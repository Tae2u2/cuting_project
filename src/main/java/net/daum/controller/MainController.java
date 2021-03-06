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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.daum.service.KakaoPayService;
import net.daum.service.PayService;
import net.daum.service.PayedService;
import net.daum.service.User_InfoService;
import net.daum.vo.BuyedVO;
import net.daum.vo.PayVO;
import net.daum.vo.PayedVO;
import net.daum.vo.PaymentVO;
import net.daum.vo.User_InfoVO;

@Controller
public class MainController {
	
	@Autowired
	private KakaoPayService kakaopay;
	
	@Autowired
	private User_InfoService user_infoService;
	
	@Autowired
	private PayedService payedService;
	
	@Autowired
	private PayService payService;
	
	@Inject
	JavaMailSender mailSender;
	
	@GetMapping("/")
	public String mainPage(HttpServletRequest request,Model rttr, User_InfoVO ui) {
		System.out.println("?????? ?????????");
		if(request.getSession().getAttribute("id")!=null) {
			ui.setInfo_id((String) request.getSession().getAttribute("id"));
			System.out.println(ui.getInfo_id());
			rttr.addAttribute("result", ui.getInfo_id());
			return "qt_project/main";
		}
		else {
			System.out.print("?????? ??????????");
			return "qt_project/main";
		}
	}

	
	@GetMapping("join")
	public String joinPage() {
		return "qt_project/join_qt";
	}
	
	@RequestMapping(value="idcheck")
	@ResponseBody
	public Map<String,String> idCheck(String id, User_InfoVO ui) {
		Map<String, String> result = new HashMap<String, String>();
		System.out.println(id);
		ui.setInfo_id(id);
		int i = this.user_infoService.check_id(ui);
		if(i==0) {
			System.out.println("??????");
			result.put("code", "??????????????? ????????? ?????????.");
		}
		else {
			System.out.println("??????");
			result.put("code", "?????? ???????????? ????????? ?????????.");
		}
		return result;
	}
	
	@RequestMapping(value="/join_ok",method=RequestMethod.POST)
	public String join_ok(User_InfoVO ui, RedirectAttributes rttr) {
		this.user_infoService.insertUser_Info(ui);
		this.payedService.insertPayed(ui.getInfo_id());
		rttr.addFlashAttribute("result","success");
		return "redirect:/";
	}
	
	@GetMapping("login")
	public String loginPage() {
		return "qt_project/qt_login";
	}
	
	@RequestMapping(value="adminPage")
	public String adminPage() {
		return "qt_project/adminPage";
	}
	
	@RequestMapping(value="/login_ok",method=RequestMethod.POST)
	public String login_ok(Model rttr,HttpServletRequest request,HttpSession session,User_InfoVO ui,String info_id,String info_pw)
		throws Exception{
		
		
		if(info_id.equals("admin") && info_pw.equals("admin")) {
			request.getSession().setAttribute("admin", "admin");
			rttr.addAttribute("result", "admin");			
			return "redirect:adminPage";
		}
		
		
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
	public ModelAndView myinfoPage(HttpServletRequest request, HttpSession session, @ModelAttribute User_InfoVO ui, @ModelAttribute PayedVO pd) {
		ModelAndView listM;
		
		if(request.getSession().getAttribute("id")!=null) {
		ui.setInfo_id((String) request.getSession().getAttribute("id"));
		pd.setPayed_id((String) request.getSession().getAttribute("id"));
		System.out.println(ui.getInfo_id());
		System.out.println(pd.getPayed_id());
		List<PayedVO> plist = this.payedService.getPayed(pd);
		List<User_InfoVO> ulist = this.user_infoService.getUser_InfoList(ui);
		List<PayVO> palist = this.payService.getPay(ui.getInfo_id());
		listM=new ModelAndView("/qt_project/mypage_qt");
		
		listM.addObject("ulist",ulist);
		listM.addObject("plist",plist);
		listM.addObject("palist",palist);
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
		System.out.println("???????????????");
		ui.setSession_id((String)request.getSession().getAttribute("id"));
		System.out.println(ui.getSession_id());
		this.user_infoService.editUser_Info(ui);
		return "redirect:/myinfo";
	}
	
	@RequestMapping(value="kakaoPay")
	@ResponseBody
	public String kakaopay(HttpServletRequest request, User_InfoVO ui) {
	/*	this.kakaopay.kakaoPayReady();
		
		Map<String, String> rmap = new HashMap<String, String>();
		rmap.put("result",kakaopay.kakaoPayReady());
		System.out.println("{\"result\":\""+kakaopay.kakaoPayReady()+"\"}");
		
		
		
		return rmap; */
		ui.setInfo_id((String)request.getSession().getAttribute("id"));
		try {
			System.out.println("????????????");
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connectServer = (HttpURLConnection) address.openConnection();//???????????? ?????????????????? ?????????????????? ????????? ???????????? ???
			connectServer.setRequestMethod("POST");
			connectServer.setRequestProperty("Authorization", "KakaoAK 65482c6c8fbd17bfa4a5b14b65e033ef");
			connectServer.setRequestProperty("Content-type","application/x-www-form-urlencoded;charset=utf-8");
			connectServer.setDoOutput(true);//????????? ?????? ???????????? ??????????????? ????????? ???????????? ???????????? ??????????????? Input??? true
			String param = "cid=TC0ONETIME&partner_order_id=cuting&partner_user_id="+ui.getInfo_id()+"&item_name=cuting&quantity=1&total_amount=1000&vat_amount=0&tax_free_amount=0&approval_url=http://localhost:8080/controller/kakaoPaySuccess&fail_url=http://localhost:8080/qt_project/main&cancel_url=http://localhost:8080/qt_project/main";
			OutputStream ops = connectServer.getOutputStream(); //????????? ?????????
			DataOutputStream dops = new DataOutputStream(ops); //???????????? ?????????
			dops.writeBytes(param);//???????????? ?????????
			dops.close();//?????? ?????????, connectServer??? ?????? ?????????.????????? ????????? ??????
			
			int result = connectServer.getResponseCode();//????????? ??????????????? ??????
			
			InputStream ips;//?????????
			System.out.println(result);
			if(result == 200) {//http???????????? ???????????? ????????? ????????? ????????? 200??????.
				ips = connectServer.getInputStream();
			}else {
				ips = connectServer.getErrorStream();
			}
			
			InputStreamReader isr = new InputStreamReader(ips);//?????????
			
			BufferedReader br = new BufferedReader(isr);//????????? ??????
			
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
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, User_InfoVO ui, PayedVO pd,PayVO pa, HttpServletRequest request) throws ParseException {
	/*	ui.setInfo_id((String) request.getSession().getAttribute("id") );
		
        
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
        
        model.addAttribute("id", ui.getInfo_id());
		
        return "/qt_project/kakaoPaySuccess"; */
		Map<String,Object> mlist = new HashMap<String,Object>();
        
		System.out.println(pg_token);
		String tid = (String) request.getSession().getAttribute("tid");
		System.out.println(tid);
		System.out.println("?????????????");
		ui.setInfo_id((String) request.getSession().getAttribute("id") );
		
		System.out.println(ui.getInfo_id());
		System.out.println(tid);
	
		
		try {
			System.out.println("????????????");
			URL address = new URL("https://kapi.kakao.com/v1/payment/approve");
			HttpURLConnection connectServer = (HttpURLConnection) address.openConnection();//???????????? ?????????????????? ?????????????????? ????????? ???????????? ???
			connectServer.setRequestMethod("POST");
			connectServer.setRequestProperty("Authorization", "KakaoAK 65482c6c8fbd17bfa4a5b14b65e033ef");
			connectServer.setRequestProperty("Content-type","application/x-www-form-urlencoded;charset=utf-8");
			connectServer.setDoOutput(true);//????????? ?????? ???????????? ??????????????? ????????? ???????????? ???????????? ??????????????? Input??? true
			String param = "cid=TC0ONETIME&tid="+tid+"&partner_order_id=cuting&partner_user_id="+ui.getInfo_id()+"&pg_token="+pg_token;
			OutputStream ops = connectServer.getOutputStream(); //????????? ?????????
			DataOutputStream dops = new DataOutputStream(ops); //???????????? ?????????
			dops.writeBytes(param);//???????????? ?????????
			dops.close();//?????? ?????????, connectServer??? ?????? ?????????.????????? ????????? ??????
			
			int result = connectServer.getResponseCode();//????????? ??????????????? ??????
			
			InputStream ips;//?????????
			System.out.println(result);
			if(result == 200) {//http???????????? ???????????? ????????? ????????? ????????? 200??????.
				ips = connectServer.getInputStream();
			}else {
				ips = connectServer.getErrorStream();
			}
			
			InputStreamReader isr = new InputStreamReader(ips);//?????????
			
			BufferedReader br = new BufferedReader(isr);//????????? ??????
			
			System.out.println(br);
			
		
				JSONParser parser = new JSONParser();
				JSONObject obj=(JSONObject)parser.parse(br);
				System.out.println(obj);
				
				String payment_method_type = (String) obj.get("payment_method_type");
				
				String partner_user_id = (String) obj.get("partner_user_id");
				String approved_at= (String) obj.get("approved_at");
				String item_name=(String) obj.get("item_name");
				String amountobj = (String) obj.get("amount").toString(); 
			
				
				System.out.println(amountobj);
				
				String parse = amountobj.replace('}', ' ');
				String parse2 = parse.replace('{', ' ');
				String parse3 = parse2.replace('"', ' ');
				String parse4 = parse3.trim();
				
				String[] arr = parse4.split(",");
				
				for(String a : arr) {
					
					String[] arrp = a.split(":");
					for(int i = 1 ; i<arrp.length; i++) {
						mlist.put(arrp[i-1].trim(), arrp[i]);
					}
				}
				System.out.println("====================================");
				for(String a : mlist.keySet())
				System.out.println(String.format("??? : "+a+"??? : "+mlist.get(a)));
				
			
				
				System.out.println("-----------------------");
				System.out.println("?????? ??????"+payment_method_type);
				System.out.println("????????? ?????????"+partner_user_id);
				System.out.println("?????? ??????"+approved_at);
				System.out.println("??????"+mlist.get("total"));
				System.out.println("????????????"+item_name);
				System.out.println("-----------------------");
				
				//MONEY?????? ????????? ??????
				
				pd.setPayed_id(partner_user_id);
				pd.setPayed_purchase(Integer.parseInt((String) mlist.get("total")));
				this.payedService.updatePayed(pd); //?????? ????????? ????????????
				
				pa.setPay_id(partner_user_id);
				pa.setPay_name(item_name);
				pa.setPay_purchase(Integer.parseInt((String) mlist.get("total")));
				pa.setPay_way(payment_method_type);
				
				
				//pa??? ??????
			
				if(payment_method_type.equals("CARD")) {
					String cardobj = (String) obj.get("card_info").toString();
					System.out.println("????????????");
					
					String p = cardobj.replace('}',' ');
					String p2 = p.replace('{', ' ');
					String p3 = p2.replace('"', ' ');
					String p4 = p3.trim();
					
					String[] arr2 = p4.split(",");
					
					for(String a : arr2) {
						
						String[] arrc = a.split(":");
						for(int i = 1 ; i<arrc.length; i++) {
							mlist.put(arrc[i-1].trim(), arrc[i]);
						}
					}
					System.out.println("====================================");
					for(String a : mlist.keySet())
					System.out.println(String.format("??? : "+a+"??? : "+mlist.get(a)));
					pa.setPay_way2((String) mlist.get("issuer_corp"));
				}//CARD if
				
				
			request.getSession().removeAttribute("tid");
			
			System.out.println((String) request.getSession().getAttribute("tid"));
		
			model.addAttribute("id",ui.getInfo_id());
			
			System.out.println(pa.getPay_id());
			System.out.println(pa.getPay_name());
			System.out.println(pa.getPay_purchase());
			System.out.println(pa.getPay_way());
			System.out.println(pa.getPay_way2());
			if(pa.getPay_way2()==null) {
				System.out.println("?????????????????????");
				pa.setPay_way2("???????????????");
			}
			
			this.payService.insertPay(pa);
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:myinfo";
		
	}
	
	
	
	
	
	
	@RequestMapping(value="emailcheck")
	@ResponseBody
	public Map<String, String> mailSending(String email) throws IOException {
		Map<String, String> rmap = new HashMap<String, String>();
		
		  String echeck = this.user_infoService.getEmail(email);
		  System.out.println(echeck);
		  if(echeck == null) {
		
		  Random r = new Random();
		  int dice = r.nextInt(4589362) + 49311; //???????????? ?????? ???????????? ?????? (??????)
        
          String setfrom = "khb2870@gamil.com";
          String tomail = email; // ?????? ?????? ?????????
          System.out.println(email);
          String title = "?????? ?????? ????????? ?????????."; // ??????
          String content =
          
          System.getProperty("line.separator")+ //????????? ???????????? ???????????? ??????
          
          System.getProperty("line.separator")+
                  
          "??????????????? ????????? ?????? ??????????????? ??????????????? ???????????????"
          
          +System.getProperty("line.separator")+
          
          System.getProperty("line.separator")+
  
          " ??????????????? " +dice+ " ?????????. "
          
          +System.getProperty("line.separator")+
          
          System.getProperty("line.separator")+
          
          "????????? ??????????????? ??????????????? ????????? ????????? ???????????? ???????????????."; // ??????
          
          
          try {
              MimeMessage message = mailSender.createMimeMessage();
              MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                      true, "UTF-8");
  
              messageHelper.setFrom(setfrom); // ??????????????? ???????????? ??????????????? ??????
              System.out.println("????????????: "+setfrom);
              messageHelper.setTo(tomail); // ???????????? ?????????
              System.out.println("????????????: "+tomail);
              messageHelper.setSubject(title); // ??????????????? ????????? ????????????
              System.out.println("??????: "+title);
              messageHelper.setText(content); // ?????? ??????
              System.out.println(content);
              
              mailSender.send(message);
              System.out.println("?????????: "+message);
          } catch (Exception e) {
              System.out.println(e);
          }
  
          
          rmap.put("result", "???????????? ?????????????????????. ??????????????? ??????????????????.");
          rmap.put("dice", String.valueOf(dice));
          return rmap;
          
		  }
		  
		  else {
			  rmap.put("result","?????? ???????????? ????????? ????????? ?????????.");
			  return rmap;
		  }
        
    }
	
	@RequestMapping(value="findId")
	@ResponseBody
	public Map<String, String> findId(String email) {
		Map<String, String> rmap = new HashMap<String, String>();
		System.out.println(email);
		String id = this.user_infoService.getId(email);
		System.out.println(id);
		if(id==null) {
			System.out.println("???????????? ?????????");
			rmap.put("result","???????????? ?????? ????????? ?????????.");
			return rmap;
		}
		else {
			  String setfrom = "khb2870@gamil.com";
	          String tomail = email; // ?????? ?????? ?????????
	          System.out.println(email);
	          String title = "?????? ????????? ?????? ????????? ?????????."; // ??????
	          String content =
	          
	          System.getProperty("line.separator")+ //????????? ???????????? ???????????? ??????
	          
	          System.getProperty("line.separator")+
	                  
	          " ????????? ???????????? " +id+ " ?????????. "
	          
	          +System.getProperty("line.separator")+
	          
	          System.getProperty("line.separator");
	          
	          try {
	              MimeMessage message = mailSender.createMimeMessage();
	              MimeMessageHelper messageHelper = new MimeMessageHelper(message,
	                      true, "UTF-8");
	  
	              messageHelper.setFrom(setfrom); // ??????????????? ???????????? ??????????????? ??????
	              System.out.println("????????????: "+setfrom);
	              messageHelper.setTo(tomail); // ???????????? ?????????
	              System.out.println("????????????: "+tomail);
	              messageHelper.setSubject(title); // ??????????????? ????????? ????????????
	              System.out.println("??????: "+title);
	              messageHelper.setText(content); // ?????? ??????
	              System.out.println(content);
	              
	              mailSender.send(message);
	              System.out.println("?????????: "+message);
	          } catch (Exception e) {
	              System.out.println(e);
	          }
	          
			rmap.put("result", "??????????????? ???????????? ???????????????");
			return rmap;
		}
	}
	
	@RequestMapping(value="findpw")
	@ResponseBody
	public Map<String,String> findPw(String id,User_InfoVO ui){
		Map<String, String> rmap = new HashMap<String, String>();
		System.out.println("????????????");
		System.out.println(id);
		ui.setInfo_id(id);
		List<User_InfoVO> ulist = this.user_infoService.getUser_InfoList(ui);
		
		String pw = null;
		String email = null;
		for(User_InfoVO u : ulist) {
			System.out.println(u);
			pw=u.getInfo_pw();
			email=u.getInfo_email();
		}
		
		
		
		System.out.println(email);
		
		System.out.println(pw);
		
		if(pw==null) {
			rmap.put("result","???????????? ?????? ????????? ?????????.");
			return rmap;
		}
		else {
			String setfrom = "khb2870@gamil.com";
	          String tomail = email; // ?????? ?????? ?????????
	          System.out.println(email);
	          String title = "?????? ???????????? ?????? ????????? ?????????."; // ??????
	          String content =
	          
	          System.getProperty("line.separator")+ //????????? ???????????? ???????????? ??????
	          
	          System.getProperty("line.separator")+
	                  
	          " ????????? ??????????????? " +pw+ " ?????????. "
	          
	          +System.getProperty("line.separator")+
	          
	          System.getProperty("line.separator");
	          
	          try {
	              MimeMessage message = mailSender.createMimeMessage();
	              MimeMessageHelper messageHelper = new MimeMessageHelper(message,
	                      true, "UTF-8");
	  
	              messageHelper.setFrom(setfrom); // ??????????????? ???????????? ??????????????? ??????
	              System.out.println("????????????: "+setfrom);
	              messageHelper.setTo(tomail); // ???????????? ?????????
	              System.out.println("????????????: "+tomail);
	              messageHelper.setSubject(title); // ??????????????? ????????? ????????????
	              System.out.println("??????: "+title);
	              messageHelper.setText(content); // ?????? ??????
	              System.out.println(content);
	              
	              mailSender.send(message);
	              System.out.println("?????????: "+message);
	          } catch (Exception e) {
	              System.out.println(e);
	          }
	          
			rmap.put("result", "??????????????? ??????????????? ???????????????");
			return rmap;
		}
		
		
		
	}
	
	
	@RequestMapping(value="payment")
	public String payment(@RequestParam("id") String id,@RequestParam("filename")String filename,@RequestParam("postnb") String postnb,@RequestParam("title") String title,PaymentVO pm,HttpServletRequest request, RedirectAttributes rttr) {
		System.out.println(id+"  "+filename+"  "+postnb);
		id=id.replace('/', ' ').trim();
		filename=filename.substring(0, filename.length()-1);
		postnb= postnb.replace('/', ' ').trim();
		title=title.replace('/', ' ').trim();
		System.out.println(id);
		System.out.println(postnb);
		System.out.println(filename);
		int i;
		if((String) request.getSession().getAttribute("id")==null) {
			return "redirect:/login";
		}
		else {
		i = this.payedService.getBalance((String) request.getSession().getAttribute("id"));
		}
		System.out.println(i);
		
		if(i>=500) {
			System.out.println("?????????");
			pm.setBy_sid(id);
			pm.setBy_post_nb(Integer.parseInt(postnb));
			pm.setBy_purchase(500);
			pm.setBy_filename(filename);
			pm.setBy_title(title);
			pm.setBy_id((String) request.getSession().getAttribute("id"));
			this.payService.insertPayment(pm);
			this.payedService.mupdatePayed((String) request.getSession().getAttribute("id"));
			rttr.addFlashAttribute("result", "????????? ??????????????????.");
			return "redirect:enter_nr";
		}
		
		else {
			System.out.println("?????????");
			rttr.addFlashAttribute("result", "????????? ???????????????.");
			return "redirect:enter_nr";
		}
	}
	
	
	@RequestMapping(value="buyedlist")
	public ModelAndView buyedlist(HttpServletRequest request,@ModelAttribute BuyedVO by) {
		ModelAndView listM;
		
		if(request.getSession().getAttribute("id")!=null) {
		by.setBy_id((String) request.getSession().getAttribute("id"));
		List<BuyedVO> bylist = this.payedService.getBuyed(by.getBy_id());
		for(int i = 0 ; i <bylist.size() ; i++)
		System.out.println(bylist.get(i));
		listM=new ModelAndView("/qt_project/mypay");
		
		
		listM.addObject("bylist", bylist);
		
		return listM;
		}else {
			listM=new ModelAndView("myinfo");
		return listM;
		}
	}
	
	
	
}
