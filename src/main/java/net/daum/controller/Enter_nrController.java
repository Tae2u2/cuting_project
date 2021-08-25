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
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;

import net.daum.service.Enter_nrService;
import net.daum.vo.Enter_nrVO;

@Controller
public class Enter_nrController {
	
	@Autowired
	private Enter_nrService enter_nrService;
	
	//오늘의 노름 폼
	@GetMapping("/enter_nr")
	public ModelAndView enter_nr() {
		ModelAndView am=new ModelAndView();
		am.setViewName("enter_nr/enter_nr");//뷰리졸브 경로=> /WEB-INF/views/enter_nr/enter_nr.jsp로 이동
		return am;
	}//enter_nr()

	//자료실 글쓰기 폼
	@GetMapping("/uploadForm")
	public ModelAndView uploadForm() {
		ModelAndView am=new ModelAndView();
		am.setViewName("enter_nr/uploadForm");//뷰리졸브 경로=> /WEB-INF/views/enter_nr/uploadForm.jsp로 이동
		return am;
	}//uploadForm()

	
	@PostMapping("/uploadForm_ok") //post로 접근하는 매핑주소를 처리
	public String uploadForm_ok(@ModelAttribute Enter_nrVO en, HttpServletRequest request) throws Exception{
		
		String saveFolder=request.getRealPath("upload");//이진파일 업로드 서버 경로=>톰캣 WAS 서버에 의해서 변경된 실제 톰캣 프로젝트 경로
		int fileSize=5*1024*1024;//이진파일 업로드 최대크기=>5M
		MultipartRequest multi=null;//이진파일 업로드 참조변수->cos.jar로 부터 읽어들임.
		
		multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
		
		String gb_id=multi.getParameter("gb_id");
		String gb_content=multi.getParameter("gb_content");
		
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
		    String refileName="Nr"+year+month+date+random+"."+fileExtendsion;//새로운 이진파일명 저장
		    String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;//데이터베이스에 저장될 레코드 값
		    
		    upFile.renameTo(new File(homedir+"/"+refileName));//변경된 이진파일로 새롭게 생성된 폴더에 실제 업로드
		    en.setGb_filename(fileDBName);//오라클에 저장될 레코드 값
		}else {//파일을 첨부하지 않았을때
			String fileDBName="";
			en.setGb_filename(fileDBName);
		}
		en.setGb_id(gb_id); en.setGb_content(gb_content);
		
		this.enter_nrService.insertNr(en);//자료실 저장
		
		return "redirect:/enter_nr";//목록보기 매핑으로 이동		
	}//uploadForm_ok()
	
	
	//오늘의 노름 폼 - 자료실 목록(검색)
		@RequestMapping("/enter_nr")  //GET OR POST방식으로 접근하는 매핑주소를 처리,bbs_list매핑주소 등록
		public String bbs_list(Model listM,HttpServletRequest request,@ModelAttribute Enter_nrVO en) throws Exception{
			
			//검색필드와 검색어
			String find_field=request.getParameter("find_field");
			String find_name=request.getParameter("find_name");
					
			en.setFind_field(find_field);
			en.setFind_name("%"+find_name+"%");//%는 검색에서 하나이상의 임의의 모르는 문자와 매핑 대응한다.
			
			List<Enter_nrVO> gblist=this.enter_nrService.getNrList(en);//목록
				
			listM.addAttribute("gblist",gblist);//gblist키이름에 목록저장
			listM.addAttribute("find_field",find_field);//find_field 속성 키이름에 검색필드를 저장
			listM.addAttribute("find_name", find_name);//find_name 속성 키이름에 검색어를 저장
			
			return "enter_nr/enter_nr";
		}//bbs_list()
}
