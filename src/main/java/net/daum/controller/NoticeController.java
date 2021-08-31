package net.daum.controller;

import java.io.File;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

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

import net.daum.service.NoticeService;
import net.daum.vo.NoticeVO;

@Controller //08.26 유재선 왓다감.
public class NoticeController {

	@Autowired //자동의존성 주입
	private NoticeService noticeService;
	
	//자료실 글쓰기 폼
		@GetMapping("/notice_write") //get으로 접근하는 매핑주소를 처리,notice_write 매핑주소 등록
		public String notice_write(HttpServletRequest request,Model wm) {
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			
			wm.addAttribute("page",page);//페이징에서 책갈피 기능을 구현		
			return "notice/notice_write";//뷰페이지 경로=> /WEB-INF/views/notice/notice_write.jsp
		}//notice_write()\
		
	
		@PostMapping("/notice_write_ok") //post로 접근하는 매핑주소를 처리
		public String notice_write_ok(@ModelAttribute NoticeVO b, HttpServletRequest request) 
				throws Exception{
			
			String saveFolder=request.getRealPath("upload");
			//이진파일 업로드 서버 경로=>톰캣 WAS 서버에 의해서 변경된 실제 톰캣 프로젝트 경로
			int fileSize=5*1024*1024;//이진파일 업로드 최대크기=>5M
			MultipartRequest multi=null;//이진파일 업로드 참조변수->cos.jar로 부터 읽어들임.
			
			multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
			
			String no_title=multi.getParameter("no_title");
			String no_content=multi.getParameter("no_content");
					//String bbs_pwd=multi.getParameter("bbs_pwd");
					//String bbs_name=multi.getParameter("bbs_name");
			
			File upFile=multi.getFile("no_filename");//첨부한 이진파일을 가져온다.
			
			if(upFile != null) {//첨부한 이진파일이 있는 경우
				String fileName=upFile.getName();//첨부한 이진파일명
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
			    String refileName="notice"+year+month+date+random+"."+fileExtendsion;//새로운 이진파일명 저장
			    String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;//데이터베이스에 저장될 레코드 값
			    
			    upFile.renameTo(new File(homedir+"/"+refileName));//변경된 이진파일로 새롭게 생성된 폴더에 실제 업로드
			    b.setNo_filename(fileDBName);//오라클에 저장될 레코드 값
			}else {//파일을 첨부하지 않았을때
				String fileDBName="";
				b.setNo_filename(fileDBName);
			}
			//b.setBbs_name(bbs_name); b.setBbs_pwd(bbs_pwd);
			b.setNo_title(no_title);  b.setNo_content(no_content);
			
			this.noticeService.insertNotice(b);//자료실 저장
			
			return "redirect:/board_qt";//목록보기 매핑으로 이동		
		}//notice_write_ok()
	
		
	//8.30일 수정본
		//자료실 목록(페이징+검색)
		@RequestMapping("/board_qt")  //GET OR POST방식으로 접근하는 매핑주소를 처리,bbs_list매핑주소 등록
		public String board_qt(Model listM,HttpServletRequest request,@ModelAttribute NoticeVO n) throws Exception{
			int page=1;
			int limit=10;//한페이지에 보여지는 목록개수
			if(request.getParameter("page") != null) {//get으로 전달된 쪽번호가 있는 경우
				page=Integer.parseInt(request.getParameter("page"));//쪽번호를 정수 숫자로 변경해서 저장
			}
		
			//검색필드와 검색어
			String find_field=request.getParameter("find_field");
			String find_name=request.getParameter("find_name");
					
			n.setFind_field(find_field);
			n.setFind_name("%"+find_name+"%");//%는 검색에서 하나이상의 임의의 모르는 문자와 매핑 대응한다.
			
			int totalCount=this.noticeService.getTotalCount(n);//검색 전은 총레코드 개수,검색 이후에는 검색한 레코드개수
			
			n.setStartrow((page-1)*10+1);//시작행번호
			n.setEndrow(n.getStartrow()+limit-1);//끝행번호
			
			List<NoticeVO> nlist=this.noticeService.getNoticeList(n);//목록
			
			//총페이지수
			int maxpage=(int)((double)totalCount/limit+0.95);
			//시작페이지
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			//현재페이지에 보여질 마지막 페이지
			int endpage=maxpage;
			if(endpage>startpage+10-1) endpage=startpage+10-1;
			
			listM.addAttribute("nlist",nlist);//nlist키이름에 목록저장
			listM.addAttribute("page",page);//page키이름에 쪽번호 저장
			listM.addAttribute("startpage",startpage);
			listM.addAttribute("endpage",endpage);
			listM.addAttribute("maxpage",maxpage);
			listM.addAttribute("totalCount",totalCount);//totalCount키이름에 총 레코드 개수 저장
			listM.addAttribute("find_field",find_field);//find_field 속성 키이름에 검색필드를 저장
			listM.addAttribute("find_name", find_name);//find_name 속성 키이름에 검색어를 저장
			
			return "notice/board_qt";//뷰페이지 경로=> /WEB-INF/views/notice/board_qt.jsp
		}//board_qt()
		
		
		//자료실 내용보기+답변폼+수정폼+삭제폼->한개의 매핑주소로 4개의 뷰화면이 실행됨.
		@RequestMapping("/notice_cont")
		public ModelAndView notice_cont(@RequestParam("no_postnb") int no_postnb, int page, String state, NoticeVO b) {
			//@RequestParam("no_postnb")는 request.getParameter("no_postnb") 와 같다.
			
			if(state.equals("cont")) {//내용보기 일때만 조회수 증가(aop를 통한 트랜잭션 적용)
				b=this.noticeService.getNoticeCont(no_postnb);
			} 
				/*
				 * else {//답변폼,수정폼,삭제폼일때는 조회수 증가 안함.->트랜잭션 적용 안함.
				 * b=this.noticeService.getNO_content2(no_postnb); }
				 */
			
			String no_content=b.getNo_content().replace("\n","<br/>");//textarea에서 엔터키 친부분을 줄바꿈
			
			ModelAndView cm=new ModelAndView();
			cm.addObject("b",b);
			cm.addObject("no_content",no_content);
			cm.addObject("page",page);
			
			if(state.equals("cont")) {//내용보기
				cm.setViewName("notice/notice_cont");//뷰페이지 경로=>/WEB-INF/views/notice/no_content.jsp
			} 
				/*
				 * else if(state.equals("reply")) {//답변폼 cm.setViewName("bbs/bbs_reply"); }
				 */
			
				/*
				 * else if(state.equals("edit")) {//수정폼 cm.setViewName("notice/no_edit"); }
				 */
				/*
				 * else if(state.equals("del")) {//삭제폼 cm.setViewName("bbs/bbs_del"); }
				 */
			return cm;
		}//notice_cont()
		
		
}
