package net.daum.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.daum.service.PaymentService;
import net.daum.service.User_InfoService;
import net.daum.vo.PaymentVO;
import net.daum.vo.User_InfoVO;

@Controller
public class MainController {
	
	@Autowired
	private User_InfoService user_infoService;
	
	@Autowired
	private PaymentService paymentService;
	
	@GetMapping("/")
	public String mainPage(HttpServletRequest request,Model rttr, User_InfoVO ui) {
		System.out.println("이건 못참지");
		if(request.getSession().getAttribute("id")!=null) {
			ui.setInfo_id((String) request.getSession().getAttribute("id"));
			System.out.println(ui.getInfo_id());
			rttr.addAttribute("result", ui.getInfo_id());
			return "qt_project/main";
		}
		else {
			System.out.print("세션 어디감?");
			return "qt_project/main";
		}
	}

	
	@GetMapping("join")
	public String joinPage() {
		return "qt_project/join_qt";
	}
	
	@RequestMapping(value="/join_ok",method=RequestMethod.POST)
	public String join_ok(User_InfoVO ui, RedirectAttributes rttr) {
		this.user_infoService.insertUser_Info(ui);
		rttr.addFlashAttribute("result","success");
		return "redirect:/";
		
	}
	
	@GetMapping("login")
	public String loginPage() {
		return "qt_project/qt_login";
	}
	
	@RequestMapping(value="/login_ok",method=RequestMethod.POST)
	public String login_ok(Model rttr,HttpServletRequest request,HttpSession session,User_InfoVO ui)
		throws Exception{
		int i  = this.user_infoService.loginUser_Info(ui);
		if(i==1) {
			request.getSession().setAttribute("id", ui.getInfo_id());
			rttr.addAttribute("result", ui.getInfo_id());
			return "redirect:/";
		}
		else {
			return "redirect:/login";
		}
	}
	
	
	
	@RequestMapping(value="myinfo")
	public ModelAndView myinfoPage(HttpServletRequest request, HttpSession session, @ModelAttribute User_InfoVO ui, @ModelAttribute PaymentVO pa) {
		ModelAndView listM;
		
		if(request.getSession().getAttribute("id")!=null) {
		ui.setInfo_id((String) request.getSession().getAttribute("id"));
		pa.setPay_id((String) request.getSession().getAttribute("id"));
		System.out.println(ui.getInfo_id());
		System.out.println(pa.getPay_id());
		List<PaymentVO> plist = this.paymentService.getPayment(pa);
		List<User_InfoVO> ulist = this.user_infoService.getUser_InfoList(ui);
		listM=new ModelAndView("/qt_project/mypage_qt");
		listM.addObject("ulist",ulist);
		listM.addObject("plist", plist);
		return listM;
		}
		else {
			listM= new ModelAndView("/qt_project/qt_login");
			return listM;
		}
	}
	
	@RequestMapping(value="logout")
	public String logOut(HttpSession session, HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="modify",method=RequestMethod.POST)
	public String modifyInfo(HttpServletRequest request, User_InfoVO ui) {
		System.out.println("수정눌렀땅");
		ui.setSession_id((String)request.getSession().getAttribute("id"));
		System.out.println(ui.getSession_id());
		this.user_infoService.editUser_Info(ui);
		return "redirect:/myinfo";
	}
	
	@RequestMapping("kakaopay")
	@ResponseBody
	public String kakaopay(HttpServletRequest request) {
		try {
			System.out.println("매핑되라");
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connectServer = (HttpURLConnection) address.openConnection();//요청하는 클라이언트가 클라이언트와 서버를 연결하는 줄
			connectServer.setRequestMethod("POST");
			connectServer.setRequestProperty("Authorization", "KakaoAK 65482c6c8fbd17bfa4a5b14b65e033ef");
			connectServer.setRequestProperty("Content-type","application/x-www-form-urlencoded;charset=utf-8");
			connectServer.setDoOutput(true);//연결을 통해 서버에게 전해줄것이 있는지 커넥터는 생성되면 기본적으로 Input은 true
			String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=asdfasdf&quantity=1&total_amount=2200&vat_amount=200&tax_free_amount=0&approval_url=http://localhost:8080/controller/kakaoPaySuccess&fail_url=http://localhost:8080/qt_project/main&cancel_url=http://localhost:8080/qt_project/main";
			OutputStream ops = connectServer.getOutputStream(); //서버에 주는애
			DataOutputStream dops = new DataOutputStream(ops); //데이터를 주는애
			dops.writeBytes(param);//바이트로 형변환
			dops.close();//버퍼 비우기, connectServer에 태워 보낸다.데이터 주는애 닫기
			
			int result = connectServer.getResponseCode();//통신에 성공했는지 확인
			
			InputStream ips;//받는애
			System.out.println(result);
			if(result == 200) {//http코드에서 정상적인 통신을 뜻하는 코드는 200이다.
				ips = connectServer.getInputStream();
			}else {
				ips = connectServer.getErrorStream();
			}
			
			InputStreamReader isr = new InputStreamReader(ips);//읽는애
			
			BufferedReader br = new BufferedReader(isr);//형번환 가능
			
			String a = br.readLine();
			System.out.println(a);
			String b[] = a.split("\",\"");
			
			String c[] = b[0].split("\":\"");
			String tid = c[1];
			
			System.out.println(tid);
			//System.out.println(br.readLine());
			
			request.getSession().setAttribute("tid", tid);
			
			return a;
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "{\"result\":\"NO\"}";
	}
	
	@GetMapping("/kakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, User_InfoVO ui, HttpServletRequest request) {
		System.out.println(pg_token);
		String tid = (String) request.getSession().getAttribute("tid");
		System.out.println(tid);
		System.out.println("나불렀어?");
		ui.setInfo_id((String) request.getSession().getAttribute("id") );
		
		System.out.println(ui.getInfo_id());
	
		
		try {
			System.out.println("매핑되라");
			URL address = new URL("https://kapi.kakao.com/v1/payment/approve");
			HttpURLConnection connectServer = (HttpURLConnection) address.openConnection();//요청하는 클라이언트가 클라이언트와 서버를 연결하는 줄
			connectServer.setRequestMethod("POST");
			connectServer.setRequestProperty("Authorization", "KakaoAK 65482c6c8fbd17bfa4a5b14b65e033ef");
			connectServer.setRequestProperty("Content-type","application/x-www-form-urlencoded;charset=utf-8");
			connectServer.setDoOutput(true);//연결을 통해 서버에게 전해줄것이 있는지 커넥터는 생성되면 기본적으로 Input은 true
			String param = "cid=TC0ONETIME&tid="+tid+"&partner_order_id=partner_order_id&partner_user_id=partner_user_id&pg_token="+pg_token;
			OutputStream ops = connectServer.getOutputStream(); //서버에 주는애
			DataOutputStream dops = new DataOutputStream(ops); //데이터를 주는애
			dops.writeBytes(param);//바이트로 형변환
			dops.close();//버퍼 비우기, connectServer에 태워 보낸다.데이터 주는애 닫기
			
			int result = connectServer.getResponseCode();//통신에 성공했는지 확인
			
			InputStream ips;//받는애
			System.out.println(result);
			if(result == 200) {//http코드에서 정상적인 통신을 뜻하는 코드는 200이다.
				ips = connectServer.getInputStream();
			}else {
				ips = connectServer.getErrorStream();
			}
			
			InputStreamReader isr = new InputStreamReader(ips);//읽는애
			
			BufferedReader br = new BufferedReader(isr);//형번환 가능
			
			String a = br.readLine();
			
			request.getSession().removeAttribute("tid");
			
			System.out.println((String) request.getSession().getAttribute("tid"));
			
			System.out.println(a);
			
			
			
			String b[] = a.split(",");
			
			for(int i = 0 ; i<b.length ; i++) {
				model.addAttribute("attr"+i, b[i].replace("\"", ""));
			}
			model.addAttribute("id",ui.getInfo_id());
			
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return "qt_project/kakaoPaySuccess";
		
	/*	HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "KakaoAK 65482c6c8fbd17bfa4a5b14b65e033ef");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        //approval_url=http://localhost:8080/controller/kakaoPaySuccess&fail_url=http://localhost:8080/qt_project/main&cancel_url=http://localhost:8080/qt_project/main";
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id","partner_order_id" );
        params.add("partner_user_id", "partner_user_id");
        params.add("item_name", "초코파이");
        params.add("quantity","1");
        params.add("total_amount", "2200");
        params.add("vat_amount", "200");
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost:8080/controller/kakaoPaySuccess");
        params.add("fail_url", "http://localhost:8080/qt_project/main");
        params.add("cancel_url", "http://localhost:8080/qt_project/main");
        
        */
	/*	HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "KakaoAK 65482c6c8fbd17bfa4a5b14b65e033ef");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        //approval_url=http://localhost:8080/controller/kakaoPaySuccess&fail_url=http://localhost:8080/qt_project/main&cancel_url=http://localhost:8080/qt_project/main";
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id","partner_order_id" );
        params.add("partner_user_id", "partner_user_id");
        params.add("item_name", "초코파이");
        params.add("quantity","1");
        params.add("total_amount", "2200");
        
        */
		
        
        
        
        
		
		
	}
	
}
