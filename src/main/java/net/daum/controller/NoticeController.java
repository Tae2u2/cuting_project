package net.daum.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

@Controller
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
		}//notice_write()
		
	
		@PostMapping("/notice_write_ok") //post로 접근하는 매핑주소를 처리
		public String notice_write_ok(@ModelAttribute NoticeVO b, HttpServletRequest request) 
				throws Exception{
			
			String saveFolder=request.getRealPath("resources/upload");
			//이진파일 업로드 서버 경로=>톰캣 WAS 서버에 의해서 변경된 실제 톰캣 프로젝트 경로
			int fileSize=5*1024*1024;//이진파일 업로드 최대크기=>5M
			MultipartRequest multi=null;//이진파일 업로드 참조변수->cos.jar로 부터 읽어들임.
			
			multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
			
			String no_title=multi.getParameter("no_title");
			String no_content=multi.getParameter("no_content");
			/*
			 * String bbs_pwd=multi.getParameter("bbs_pwd"); String
			 * bbs_name=multi.getParameter("bbs_name");
			 */
			
			File upFile=multi.getFile("no_filename");//첨부한 이진파일(속성명:no_filename)을 가져온다.
			
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
		//return redirect:/ 인경우는 다시 controller가 호출되는것.(redirect오른쪽의 주소로 URL 요청을 다시 하는 것)
		//return "뷰페이지" 이건 view페이지의 jsp를 불러오는것
		
		
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
			}else {//답변폼,수정폼,삭제폼일때는 조회수 증가 안함.->트랜잭션 적용 안함.
				  b=this.noticeService.getNo_content2(no_postnb); }
				
			
			String no_content=b.getNo_content().replace("\n","<br/>");//textarea에서 엔터키 친부분을 줄바꿈
			
			ModelAndView cm=new ModelAndView();
			cm.addObject("b",b);
			cm.addObject("no_content",no_content);
			cm.addObject("page",page);
			
			if(state.equals("cont")) {//내용보기
				cm.setViewName("notice/notice_cont");//뷰페이지 경로=>/WEB-INF/views/notice/notice_cont.jsp
			}else if(state.equals("edit")) {//수정폼
				cm.setViewName("notice/notice_edit");
			}else if(state.equals("del")) {//삭제폼
				cm.setViewName("notice/notice_del");
			}
			/*
			 * else if(state.equals("reply")) {//답변폼 cm.setViewName("bbs/bbs_reply"); }
			 */
			return cm;
		}//notice_cont()
		
	//자료실 수정완료
	@RequestMapping("/notice_edit_ok")
	public ModelAndView notice_edit_ok(HttpServletRequest request, HttpServletResponse response,NoticeVO b)
			throws Exception{
		response.setContentType("text/html;charset=UTF-8");//브라우저에 출력되는 파일형식과 언어코딩 타입 지정
		/*PrintWriter out=response.getWriter();//출력스트림 객체 생성*/		
		String saveFolder=request.getRealPath("resources/upload");//이진파일 업로드 서버 경로=>톰캣 WAS 서버에 의해서 변경된 실제 톰캣 프로젝트 경로
		int fileSize=5*1024*1024;//이진파일 최대 크기
		
		MultipartRequest multi=null;
		multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");//이진파일을 가져올 multi생성
		
		int no_postnb=Integer.parseInt(multi.getParameter("no_postnb"));//히든으로 전달된 번호값을 받아서 정수 숫자로 변경해서 저장
		int page=1;
		if(multi.getParameter("page") != null) {
			page=Integer.parseInt(multi.getParameter("page"));
		}
		
		/*String no_name=multi.getParameter("bbs_name");//수정할 이름,제목,내용을 받아서 각각 저장
*/		String no_title=multi.getParameter("no_title");
	/*	String bbs_pwd=multi.getParameter("bbs_pwd");*/
		String no_content=multi.getParameter("no_content");
		
		NoticeVO db_pwd=this.noticeService.getNo_content2(no_postnb);//오라클로 부터 레코드를 가져옴.
			/*
			 * if(!db_pwd.getBbs_pwd().equals(bbs_pwd)) { out.println("<script>");
			 * out.println("alert('비번이 다릅니다!');"); out.println("history.back();");
			 * out.println("</script>"); }else {
			 */
		File upFile=multi.getFile("no_filename");//수정 첨부한 이진파일을 가져옴.
			
		if(upFile != null) {//수정첨부한 이진파일이 있는 경우
			String fileName=upFile.getName();//수정 첨부한 파일명
			File delFile=new File(saveFolder+db_pwd.getNo_filename());//기존 첨부된 삭제할 파일 객체를 생성
			if(delFile.exists()) {//삭제할 파일이 있다면
				delFile.delete();//기존 이진파일을 삭제
			}
			Calendar c=Calendar.getInstance();//칼렌더는 추상클래스로 new키워드로 객체 생성을 못함. 하지만 년월일 시분초 값을 반환할 수 있다.
			int year=c.get(Calendar.YEAR);//년도
			int month=c.get(Calendar.MONTH)+1;//월값,+1을 한 이유는 1월이 0부터 시작하기 때문이다.
			int date=c.get(Calendar.DATE);//일값
			
			String homedir=saveFolder+"/"+year+"-"+month+"-"+date;
			File path01=new File(homedir);
			if(!(path01.exists())) {
				path01.mkdir(); //path01이 존재 하지 않다면...폴더를 생성한다.
			}
			Random r=new Random();
			int random=r.nextInt(100000000);
			
			//확장자를 구함
			int index=fileName.lastIndexOf(".");//.의 위치번호를 구함
			String fileExtendsion=fileName.substring(index+1);//첨부파일의 확장자를 구함.
			String refileName="notice"+year+month+date+random+"."+fileExtendsion;
			String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;
			upFile.renameTo(new File(homedir+"/"+refileName));
			b.setNo_filename(fileDBName);
		}else {//수정 파일을 첨부하지 않은 경우
			String fileDBName="";
			if(db_pwd.getNo_filename() != null) {//기존 첨부된 파일이 있는경우
				b.setNo_filename(db_pwd.getNo_filename());
			}else {
				b.setNo_filename(fileDBName);
			}
		}//if else
		
		b.setNo_postnb(no_postnb); b.setNo_title(no_title); b.setNo_content(no_content);
		this.noticeService.editNotice(b);
		/* 문제) 서비스,모델 dao,mybatis 매퍼태그까지 스프링의 흐름도 따라 번호를 기준으로 
		 * 글쓴이,제목,내용,첨부파일을 수정되게 한다. 개발자 테스트까지 완료한다.
		 */
		
		ModelAndView em=new ModelAndView("redirect:/notice_cont");
		em.addObject("no_postnb",no_postnb);
		em.addObject("page",page);
		em.addObject("state","cont");
		return em;// 주소창에 노출되는 get방식으로 3개의 인자값이 전달됨. bbs_cont?bbs_no=번호&page=쪽번호&state=cont
}//notice_edit_ok()
		
		

	//자료실 삭제
	@RequestMapping("/notice_del_ok")
	public String notice_del_ok(int no_postnb,int page, HttpServletResponse response,HttpServletRequest request)
	throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String up=request.getRealPath("upload");
		
		NoticeVO db_pwd = this.noticeService.getNo_content2(no_postnb);
		
		
		/*
		 * if(!db_pwd.getBbs_pwd().equals(del_pwd)) { out.println("<script>");
		 * out.println("alert('비번이 다릅니다!');"); out.println("history.go(-1);");
		 * out.println("</script>");
		 */
		
		/*
		 * out.println("<script>"); out.println("ask('삭제하시겠습니까?');");
		 * out.println("document.write(answer)"); out.println("</script>");
		 */
		
		
		
			this.noticeService.delNotice(no_postnb);//자료실 삭제
			/* 문제)번호를 기준으로 오라클로 부터 자료를 삭제되게 해 보자. 개발 테스트 까지 완료 시킨다. 
			 */
			
			if(db_pwd.getNo_filename() != null) {//첨부파일이 있는 경우
				File file=new File(up+db_pwd.getNo_filename());
				file.delete();//upload폴더로 부터 첨부파일을 삭제
			}
			return "redirect:/board_qt?page="+page;
	
	}//notice_del_ok()	
		
		
}
