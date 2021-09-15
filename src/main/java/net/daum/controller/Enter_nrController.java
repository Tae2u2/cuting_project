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

import net.daum.service.Enter_nrService;
import net.daum.service.HeartService;
import net.daum.vo.Enter_nrVO;
import net.daum.vo.HeartVO;

@Controller
public class Enter_nrController {
	
	@Autowired
	private Enter_nrService enter_nrService;
	
	@Autowired
	private HeartService heartService;
	
	
	//자료실 글쓰기 폼
	@GetMapping("uploadForm")
	public String uploadForm(HttpServletRequest request, Model model , HttpSession session, @ModelAttribute Enter_nrVO en) {
		en.setGb_id((String) request.getSession().getAttribute("id"));
		model.addAttribute("gb_id",en.getGb_id());
		System.out.println(en.getGb_id());
		return "enter_nr/nr_uploadForm";
	}//uploadForm()


	@PostMapping("uploadForm_ok") //post로 접근하는 매핑주소를 처리
	public String uploadForm_ok(@ModelAttribute Enter_nrVO en,HttpSession session,HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");//서버에서 사용자에게 메세지 보낼때 사용되는 언어타입 UTF-8로설정. 안했을시 한글이 깨지거나 읽어들이지 못하는 현상 발생. 
		PrintWriter out=response.getWriter(); //개발자가 쓴 글을 jsp를따로 만들어 alert('${msg}');한다음 다시 컨트롤러로 호출시키려는 번거로움을 줄이고자 변수out에 담음
		
		
		String saveFolder=request.getRealPath("resources/upload");//이진파일 업로드 서버 경로=>톰캣 WAS 서버에 의해서 변경된 실제 톰캣 프로젝트 경로
		
		
		int fileSize=5*1024*1024;//이진파일 업로드 최대크기=>5M
		MultipartRequest multi=null;//이진파일 업로드 참조변수->cos.jar로 부터 읽어들임.
		
		multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
		
		
		String gb_id=(String)request.getSession().getAttribute("id"); //현재 세션상 로그인된 아이디를 불러들임
		
		if(gb_id==null) {//만약 세션값이 없다면 즉, 로그인을 하지 않고 이용한 상태라면 다음 문장들을 실행시킴.
			System.out.println("뒤로 ㄱㄱ");
				out.println("<script>");
				out.println("alert('로그인 후 이용 가능합니다!');");
				out.println("location='login';");
				out.println("</script>");
		}
		
		
		String gb_category=multi.getParameter("gb_category");
		String gb_title=multi.getParameter("gb_title");
		String gb_content=multi.getParameter("gb_content");
		
		System.out.println(gb_category);
		
		File upFile=multi.getFile("gb_filename");//첨부한 이진파일을 가져온다.
		
		
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
		    String refileName="Nr"+"-"+year+"_"+month+"_"+date+"_"+random+"."+fileExtendsion;//새로운 이진파일명 저장
		    String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;//데이터베이스에 저장될 레코드 값
		    
		    upFile.renameTo(new File(homedir+"/"+refileName));//변경된 이진파일로 새롭게 생성된 폴더에 실제 업로드
		    en.setGb_filename(fileDBName);//오라클에 저장될 레코드 값
		}else {//파일을 첨부하지 않았을때
			out.println("<script>");
			out.println("location='uploadForm';");
			out.println("alert('파일을 첨부해야만 합니다.');");
			out.println("</script>");
		}
		en.setGb_id(gb_id); en.setGb_content(gb_content); en.setGb_title(gb_title); en.setGb_category(gb_category);
		
		this.enter_nrService.insertNr(en);//자료실 저장
		
		System.out.println("저장성공");
		System.out.println(saveFolder);
		return "redirect:enter_nr";//목록보기 매핑으로 이동		
	}//uploadForm_ok()
	
	
	//오늘의 노름 폼 - 자료실 목록(검색)
		@RequestMapping("enter_nr") 
		public String nr_list(Model listM,HttpServletRequest request,HttpSession session,@ModelAttribute Enter_nrVO en) 
				throws Exception{
			
			String gb_id=(String)request.getSession().getAttribute("id");
			String find_field=request.getParameter("find_field");
			String find_name=request.getParameter("find_name");
			String gb_filename=request.getParameter("gb_filename");
			String gb_category= request.getParameter("gb_category");
			
			
			//List<HeartVO> hlist = this.heartService.gethList(gb_id);
			//System.out.println(hlist);
			
			en.setFind_field(find_field);
			en.setFind_name("%"+find_name+"%");//%는 검색에서 하나이상의 임의의 모르는 문자와 매핑 대응한다.
			en.setGb_filename(gb_filename);
			en.setGb_category(gb_category);
			
			
			List<Enter_nrVO> gblist=this.enter_nrService.getNrList(en);//목록
			
			
			listM.addAttribute("gb_id",gb_id);
			listM.addAttribute("gb_category",gb_category);
			//listM.addAttribute("hlist", hlist);
			listM.addAttribute("gblist",gblist);//gblist키이름에 목록저장
			listM.addAttribute("gb_filename",gb_filename);
			listM.addAttribute("find_field",find_field);//find_field 속성 키이름에 검색필드를 저장
			listM.addAttribute("find_name", find_name);//find_name 속성 키이름에 검색어를 저장
			
			return "enter_nr/enter_nr";
		}//nr_list()
		
		
		@RequestMapping("nr_cont")
		public ModelAndView nr_cont(@RequestParam("gb_postnb") int gb_postnb,String state,Enter_nrVO en,HttpServletResponse response,HttpServletRequest request) throws Exception {
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			String up=request.getRealPath("upload");
			
			String gb_id=(String)request.getSession().getAttribute("id"); //세션아이디값 가져오기
			
			if(state.equals("content")) {//내용보기 일때만 조회수 증가(aop를 통한 트랜잭션 적용)
				en=this.enter_nrService.getNrCont(gb_postnb);
			}else {//답변폼,수정폼,삭제폼일때는 조회수 증가 안함.->트랜잭션 적용 안함.
				en=this.enter_nrService.getNrCont2(gb_postnb);
			}
			
			String gb_content=en.getGb_content().replace("\n","<br/>");//textarea에서 엔터키 친부분을 줄바꿈
			//List<Enter_nrVO> collect_idList = this.enter_nrService.collect_idList(gb_id);
			//System.out.println(collect_idList);
			List<Enter_nrVO> gblist = this.enter_nrService.getNrList(en);
			
			System.out.println(gblist);
			
			ModelAndView ma=new ModelAndView();
			ma.addObject("en",en);
			ma.addObject("gb_content",gb_content);
			ma.addObject("gb_id",gb_id);
			//ma.addObject("collect_idList",collect_idList);
			ma.addObject("gblist",gblist);
			
			if(state.equals("content")) {//내용보기
				ma.setViewName("enter_nr/nr_cont");
			}else if(state.equals("reply")) {
				ma.setViewName("enter_nr/nr_reply");
			}else if(state.equals("modify")){
				ma.setViewName("enter_nr/nr_modify");
			}else if(state.equals("del")){ //삭제폼
				
				Enter_nrVO db_id=this.enter_nrService.getNrCont2(gb_postnb);//오라클로 부터 레코드를 가져옴.
				
				if(!db_id.getGb_id().equals(gb_id)) {
					out.println("<script>");
					out.println("alert('삭제할 권한이 없습니다.');");
					out.println("history.back();");
					out.println("</script>");
				}else{
					
					this.enter_nrService.delNr(gb_postnb);//자료실 삭제
					
					
					//if(db_id.getGb_filename() != null) {//첨부파일이 있는 경우
					//	File file=new File(up+db_id.getGb_filename());
					//	file.delete();//upload폴더로 부터 첨부파일을 삭제
					//}
				
				ma.setViewName("enter_nr/cont");
				out.println("<script>");
				out.println("alert('삭제가 완료되었습니다.');");
				out.println("location='enter_nr';");
				out.println("</script>");
				}
				return null;
			}

			return ma;
			}

		//수정
		@RequestMapping("/modify_ok")
		public ModelAndView bbs_edit_ok(@ModelAttribute Enter_nrVO en,HttpSession session ,HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String saveFolder=request.getRealPath("resources/upload");//이진파일 업로드 서버 경로=>톰캣 WAS 서버에 의해서 변경된 실제 톰캣 프로젝트 경로
		int fileSize=5*1024*1024;
		
		MultipartRequest multi=null;
		multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
		
		int gb_postnb=Integer.parseInt(multi.getParameter("gb_postnb"));//히든으로 전달된 번호값을 받아서 정수 숫자로 변경해서 저장
		
		String gb_id=(String)request.getSession().getAttribute("id"); 
		String gb_category=multi.getParameter("gb_category");
		String gb_title=multi.getParameter("gb_title");
		//String gb_pwd=(String)request.getSession().getAttribute("password");
		String gb_content=multi.getParameter("gb_content");
		
		
		Enter_nrVO db_id=this.enter_nrService.getNrCont2(gb_postnb);//오라클로 부터 레코드를 가져옴.
		
		if(!db_id.getGb_id().equals(gb_id)) {
			out.println("<script>");
			out.println("alert('바꿀권한이 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		
		}else{
				
			File upFile=multi.getFile("gb_filename");//수정 첨부한 이진파일을 가져옴.
			
			if(upFile != null) {//수정첨부한 이진파일이 있는 경우
				String fileName=upFile.getName();//수정 첨부한 파일명
				File delFile=new File(saveFolder+db_id.getGb_filename());

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
				path01.mkdir();
			}

			Random r=new Random();
			int random=r.nextInt(100000000);
				
			//확장자를 구함
			int index=fileName.lastIndexOf(".");//.의 위치번호를 구함
			String fileExtendsion=fileName.substring(index+1);//.이후 부터 마지막 문자까지 구함. 즉 첨부한 파일의 확장자를 구함.
		    String refileName="bbs"+year+month+date+random+"."+fileExtendsion;//새로운 이진파일명 저장
		    String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;//데이터베이스에 저장될 레코드 값
			upFile.renameTo(new File(homedir+"/"+refileName));
			en.setGb_filename(fileDBName);
		}else {//수정 파일을 첨부하지 않은 경우

			String fileDBName="";
			if(db_id.getGb_filename() != null){
				en.setGb_filename(db_id.getGb_filename());
			}else{
				out.println("<script>");
				out.println("alert('파일이 첨부되지 않았습니다. 다시 확인해주세요');");
				out.println("history.back();");
				out.println("</script>");
			}
				
		}
			
			en.setGb_id(gb_id); en.setGb_postnb(gb_postnb); en.setGb_category(gb_category); en.setGb_title(gb_title); en.setGb_content(gb_content);
			this.enter_nrService.modifyNr(en);
			
			ModelAndView ma=new ModelAndView("redirect:/nr_cont");
			ma.addObject("gb_postnb",gb_postnb);
			ma.addObject("state","content");
			return ma;
		
		} 
		return null;
	}//modify_ok  게시글 변경
	
}
