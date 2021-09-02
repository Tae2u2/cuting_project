package net.daum.controller;


import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;

import net.daum.service.EventService;
import net.daum.vo.EventVO;

@Controller //@Controller 애노테이션으로 스프링에 컨트롤러 라는 것을 인식하게 한다.
public class EventController {
	
	@Autowired
	private EventService eventService;

	//자료실 글쓰기 폼
	@GetMapping("/event_write") //get으로 접근하는 매핑주소를 처리,bbs_write 매핑주소 등록
	public String event_write(HttpServletRequest request,Model wm) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		wm.addAttribute("page",page);
		return "event/event_write";
	}//bbs_write()
	
	
	@PostMapping("/event_write_ok") //post로 접근하는 매핑주소를 처리
	public String event_write_ok(@ModelAttribute EventVO e, HttpServletRequest request) throws Exception{
		
		String saveFolder=request.getRealPath("resources/upload");//이진파일 업로드 서버 경로=>톰캣 WAS 서버에 의해서 변경된 실제 톰캣 프로젝트 경로
		int fileSize=100*1024*1024;//이진파일 업로드 최대크기=>5M
		MultipartRequest multi=null;//이진파일 업로드 참조변수->cos.jar로 부터 읽어들임.
		
		multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
		
		String ev_title=multi.getParameter("ev_title");
		String ev_content=multi.getParameter("ev_content");
		String ev_update=multi.getParameter("ev_update");
		String ev_exdate=multi.getParameter("ev_exdate");
		
		File ev_filename=multi.getFile("ev_filename");//첨부한 이진파일을 가져온다.
		
		if(ev_filename != null) {//첨부한 이진파일이 있는 경우
			String fileName=ev_filename.getName();//첨부한 이진파일명
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
		    
		    ev_filename.renameTo(new File(homedir+"/"+refileName));//변경된 이진파일로 새롭게 생성된 폴더에 실제 업로드
		    e.setEv_filename(fileDBName);//오라클에 저장될 레코드 값
		}else {//파일을 첨부하지 않았을때
			String fileDBName="";
			e.setEv_filename(fileDBName);
		}
		e.setEv_title(ev_title); e.setEv_content(ev_content);  e.setEv_update(ev_update); e.setEv_exdate(ev_exdate);
		
		this.eventService.insertEvent(e);//자료실 저장
		
		return "redirect:/event_qt";//목록보기 매핑으로 이동		
	}//bbs_write_ok()
	
	
	//자료실 목록(페이징+검색)
	@RequestMapping("/event_qt")  //GET OR POST방식으로 접근하는 매핑주소를 처리,bbs_list매핑주소 등록
	public String event_qt(Model listM,HttpServletRequest request,@ModelAttribute EventVO e) throws Exception{
		int page=1;
		int limit=10;//한페이지에 보여지는 목록개수
		if(request.getParameter("page") != null) {//get으로 전달된 쪽번호가 있는 경우
			page=Integer.parseInt(request.getParameter("page"));//쪽번호를 정수 숫자로 변경해서 저장
		}
		
		
		int totalCount=this.eventService.getTotalCount(e);//검색 전은 총레코드 개수,검색 이후에는 검색한 레코드개수
		
		e.setStartrow((page-1)*10+1);//시작행번호
		e.setEndrow(e.getStartrow()+limit-1);//끝행번호
		
		List<EventVO> blist=this.eventService.getEventList(e);//목록
		
		//총페이지수
		int maxpage=(int)((double)totalCount/limit+0.95);
		//시작페이지
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재페이지에 보여질 마지막 페이지
		int endpage=maxpage;
		if(endpage>startpage+10-1) endpage=startpage+10-1;
		
		listM.addAttribute("blist",blist);//blist키이름에 목록저장
		listM.addAttribute("page",page);//page키이름에 쪽번호 저장
		listM.addAttribute("startpage",startpage);
		listM.addAttribute("endpage",endpage);
		listM.addAttribute("maxpage",maxpage);
		listM.addAttribute("totalCount",totalCount);//totalCount키이름에 총 레코드 개수 저장
	
		
		return "event/event_qt";
	}//bbs_list()
	
	
	@RequestMapping("/event_cont")
	public ModelAndView event(int no,int page,String state,HttpServletRequest request)
			throws Exception{
		
			EventVO e=this.eventService.getEventCont(no);
			String eve_cont=e.getEv_content().replace("\n","<br/>");//textarea 입력박스에서 엔터키 친 부분을 줄 바꿈 해준다.

			ModelAndView em=new ModelAndView();
			em.addObject("e",e); 
			em.addObject("eve_cont",eve_cont);
			em.addObject("page",page);

			if(state.equals("cont")) {//내용보기 일때
				em.setViewName("event/event_cont");
			}else if(state.equals("edit")) {//수정푬
				em.setViewName("event/event_edit");
			}

			return em;
	
		
	}
	
	@RequestMapping("/event_edit_ok")
	public ModelAndView event_edit_ok(HttpServletRequest request,EventVO e) throws Exception{
	
		String saveFolder=request.getRealPath("upload");
		//이진파일 업로드 서버경로
		int fileSize=5*1024*1024;//이진파일 업로드 최대크기
		MultipartRequest multi=null;//이진파일을 받을 참조변수

		multi=new MultipartRequest(request,saveFolder,
				fileSize,"UTF-8");
		int ev_postnb=Integer.parseInt(multi.getParameter("ev_postnb"));

		int page=1;
		if(multi.getParameter("page") != null) {
			page=Integer.parseInt(multi.getParameter("page"));
		}
		String ev_title=multi.getParameter("ev_title");
		String ev_content=multi.getParameter("ev_content");
		String ev_update=multi.getParameter("ev_update");
		String ev_exdate=multi.getParameter("ev_exdate");
		
		EventVO db_pwd=this.eventService.getEventCont(ev_postnb);

		File UpFile=multi.getFile("ev_filename");
		//을 받아옴.
		if(UpFile != null) {//첨부한 이진파일이 있다면
			String fileName=UpFile.getName();//첨부한 파일명
			Calendar c=Calendar.getInstance();//칼렌더는 추상
			//클래스로 new로 객체 생성을 못함. 년월일 시분초 값을 반환
			int year=c.get(Calendar.YEAR);//년도값
			int month=c.get(Calendar.MONTH)+1;//월값. +1을 한
			//이유가 1월이 0으로 반환 되기 때문이다.
			int date=c.get(Calendar.DATE);//일값
			String homedir=saveFolder+"/"+year+"-"+month+"-"+date;//오늘
			//날짜 폴더 경로 저장
			File path1=new File(homedir);
			if(!(path1.exists())) {
				path1.mkdir();//오늘날짜 폴더경로를 생성
			}
			Random r=new Random();
			int random=r.nextInt(100000000);

			/*첨부 파일 확장자 구함*/
			int index=fileName.lastIndexOf(".");//마침표 위치
			//번호를 구함
			String fileExtension=fileName.substring(index+1);//마침표
			//이후부터 마지막 문자까지 구함.첨부파일 확장자를 구함
			String refileName="event"+year+month+date+random+"."+	fileExtension;//새로운 이진파일명 저장
			String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;//디비에 저장될 레코드값
			UpFile.renameTo(new File(homedir+"/"+refileName));
			//바뀌어진 이진파일로 업로드
			e.setEv_filename(fileDBName);
		}else {//mybatis에서는 컬럼에 null을 insert하지 못함.
			String fileDBName="";
			if(db_pwd.getEv_filename() != null) {
				e.setEv_filename(db_pwd.getEv_filename());
			}else {
				e.setEv_filename(fileDBName);
			}
		}
		e.setEv_postnb(ev_postnb);
		e.setEv_title(ev_title); e.setEv_content(ev_content);  e.setEv_update(ev_update); e.setEv_exdate(ev_exdate);
		
		this.eventService.editEvent(e);
		
		ModelAndView em=new ModelAndView("redirect:/event_qt");
		em.addObject("page", page);
		return em;
	}//if else
	
	
	
	
	
		
	}
	
	
	


