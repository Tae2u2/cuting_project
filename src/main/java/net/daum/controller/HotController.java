package net.daum.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import net.daum.service.HotService;
import net.daum.vo.Enter_nrVO;


@Controller
public class HotController {
	 
	@Autowired
	private HotService hotService;
	
	@RequestMapping("/hot")  //GET OR POST방식으로 접근하는 매핑주소를 처리,bbs_list매핑주소 등록
	public String hot(Model listM,HttpServletRequest request,@ModelAttribute Enter_nrVO nr) throws Exception{
		int page=1;
		int limit=10;//한페이지에 보여지는 목록개수
		if(request.getParameter("page") != null) {//get으로 전달된 쪽번호가 있는 경우
			page=Integer.parseInt(request.getParameter("page"));//쪽번호를 정수 숫자로 변경해서 저장
		}
		
		
//한빈님에게,,
/* 리스트를 뽑을 수 있게 해봤지만 실행이 안되더라구요. enter_nr sql가시면 제가 테이블은  예제로 ? 만들었습니다. (select * from gamble)
 * 오류는 500 뜨구, nullpointerException이 뜹니다. 
 *hlist - day 베스트 / h1list -week 베스트 / h2list - month 베스트 형식으로 짰습니다. 
 * 오류난 부분만 주석처리 하라고 말하셨는데.. 전체 다 인것같아요..^^ 
 */
		
		//List<Enter_nrVO> hlist=this.hotService.getHotList(nr);
		List<Enter_nrVO> h1list=this.hotService.getHot1List(nr);
		List<Enter_nrVO> h2list=this.hotService.getHot2List(nr);
		
	
		
		//listM.addAttribute("hlist",hlist);
		listM.addAttribute("h1list", h1list);
		listM.addAttribute("h2list", h2list);
		listM.addAttribute("page", page);
	
		
		return "hot/hot";
	}//bbs_list()
	
	
	
	

}
