package net.daum.controller;


import java.io.File;

import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;

import net.daum.service.ComunityService;
import net.daum.vo.ComunityVO;



@Controller
public class ComunityController {

	
	@Autowired
	private ComunityService comunityService;
	
	//리스트
	
	@RequestMapping(value="/comunity_write",method=RequestMethod.POST)
	public String comunity_write(RedirectAttributes rttr, HttpServletResponse response,ComunityVO pt,HttpServletRequest request) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		
		String saveFolder=request.getRealPath("resources/upload");//이진파일 업로드 서버 경로=>톰캣 WAS 서버에 의해서 변경된 실제 톰캣 프로젝트 경로
		int fileSize=100*1024*1024;//이진파일 업로드 최대크기=>5M
		MultipartRequest multi=null;//이진파일 업로드 참조변수->cos.jar로 부터 읽어들임.
		
		multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");		
		pt.setPt_id((String) request.getSession().getAttribute("id"));
		
		String pt_category=multi.getParameter("pt_category");
		String pt_content=multi.getParameter("pt_content");
		String pt_title=multi.getParameter("pt_title");
		String pt_pw=multi.getParameter("pt_pw");

		
		File pt_filename=multi.getFile("pt_filename");//첨부한 이진파일을 가져온다.
		
		if(pt_filename != null) {//첨부한 이진파일이 있는 경우
			String fileName=pt_filename.getName();//첨부한 이진파일명
			Calendar c=Calendar.getInstance();//Calendar는 추상클래스로 new로 객체 생성을 못함. 년월일 시분초 값을 구할 수 있다.
			int year=c.get(Calendar.YEAR);//년도값
			int month=c.get(Calendar.MONTH)+1;//월값, +1을 한 이유는 1월이 0으로 반환 되기 때문이다.
			int date=c.get(Calendar.DATE);//일값
			
			String homedir=saveFolder+"/"+year+"-"+month+"-"+date;//오늘 날짜 폴더 경로를 저장
			File path01=new File(homedir);
			if(!(path01.exists())) {//해당 경로가 없어면
				path01.mkdir();//폴더 경로를 생성
			}
		    Random r=new Random();
		    int random=r.nextInt(100000000);//0~1억 미만 사이의 정수형 숫자 난수를 발생
		    
		    /*첨부한 파일 확장자를 구함*/
		    int index=fileName.lastIndexOf(".");//첨부한 파일에서 .를 맨 오른쪽 부터 찾아서 가장먼저 나오는 .의 위치번호를 맨 왼쪽첫문자를 0부터 시작해서 카운터한 위치
		    //번호를 반환.
		    String fileExtendsion=fileName.substring(index+1);//.이후 부터 마지막 문자까지 구함. 즉 첨부한 파일의 확장자를 구함.
		    String refileName="event"+year+month+date+random+"."+fileExtendsion;//새로운 이진파일명 저장
		    String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;//데이터베이스에 저장될 레코드 값
		    
		    pt_filename.renameTo(new File(homedir+"/"+refileName));//변경된 이진파일로 새롭게 생성된 폴더에 실제 업로드
		    pt.setPt_filename(fileDBName);//오라클에 저장될 레코드 값
		}else {//파일을 첨부하지 않았을때
			String fileDBName="";
			pt.setPt_filename(fileDBName);
		}
		pt.setPt_category(pt_category);pt.setPt_content(pt_content);pt.setPt_pw(pt_pw);
		pt.setPt_title(pt_title);
	
		this.comunityService.insertPt(pt);
		rttr.addFlashAttribute("result","success");
		System.out.println(rttr.getFlashAttributes());
		return "redirect:/comunity";
	}//qna_write_ok() end

	@RequestMapping(value="/comunity",method=RequestMethod.GET)
	public ModelAndView comunity_list(Model m,HttpServletRequest request,HttpSession session, @ModelAttribute ComunityVO pt) {
			pt.setPt_id((String) request.getSession().getAttribute("id"));
			m.addAttribute("pt_id",pt.getPt_id());
			List<ComunityVO> ptlist=this.comunityService.getComunityList(pt);
			
			ModelAndView listC=new ModelAndView("comunity/comunity");
			listC.addObject("ptlist",ptlist);
		int page=1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}			
		listC.addObject("page",page);
		return listC;	
	}//리스트() end

	

}
