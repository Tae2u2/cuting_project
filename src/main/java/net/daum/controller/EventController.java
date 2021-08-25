package net.daum.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;

import net.daum.service.EventService;

import net.daum.vo.EventVO;

@Controller
public class EventController {

	@Autowired
	private EventService eventService;
	
	@GetMapping("/event_write" )
	public String event_write(HttpServletRequest request,Model m) {
		
		int page=1;
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		m.addAttribute("page", page);
		return "event/event_write";
	}
	
	@PostMapping("/event_write_ok")
	public String event_write_ok(@ModelAttribute EventVO e, HttpServletRequest request
) throws Exception{
		
	
		
		String saveFolder=request.getRealPath("upload");
		int fileSize=10*1024*1024;
		MultipartRequest multi=null;
		
		multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
		
		String ev_title=multi.getParameter("ev_title");
		String ev_content=multi.getParameter("ev_content");
		
		String ev_update=multi.getParameter("ev_update");
		String ev_exdate=multi.getParameter("ev_exdate");

		
		File upFile=multi.getFile("ev_filename");
		
		if(upFile != null) {
			String fileName=upFile.getName();
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
		    String fileExtension=fileName.substring(index+1);//.이후 부터 마지막 문자까지 구함. 즉 첨부한 파일의 확장자를 구함.
		    String refileName="event"+year+month+date+random+"."+fileExtension;//새로운 이진파일명 저장
		    String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;//데이터베이스에 저장될 레코드 값
		    
		    upFile.renameTo(new File(homedir+"/"+refileName));//변경된 이진파일로 새롭게 생성된 폴더에 실제 업로드
		    e.setEv_filename(fileDBName);//오라클에 저장될 레코드 값
		}else {//파일을 첨부하지 않았을때
			String fileDBName="";
			e.setEv_filename(fileDBName);
		}
		e.setEv_content(ev_content); e.setEv_title(ev_title); e.setEv_update(ev_update); e.setEv_exdate(ev_exdate);
		
		this.eventService.insertEvent(e);
		
		return "redirect:/event_qt";	
	}//event_write_ok()
	
	
	
}
