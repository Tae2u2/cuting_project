package net.daum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.daum.service.ChecklistService;
import net.daum.vo.ChecklistVO;

@Controller
public class ChecklistController {
	
	@Autowired
	private ChecklistService checklistService;
	
	
	
	//찜목록 추가
	@RequestMapping("insert.do")
	public String checklist_ok(@ModelAttribute ChecklistVO cl, HttpSession session,HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out=response.getWriter();
		
		String cl_id = (String) session.getAttribute("id");
		cl.setCl_id(cl_id);
		
		List<ChecklistVO> list = checklistService.listCart(cl_id); //장바구니 정보
		System.out.println(list);
		
		if(cl.getCl_id() == null) { //가져온 세션아이디가  null이라면 , 즉 로그인한 회원이 아니라면
			out.println("<script>");
			out.println("alert('로그인 후 이용 가능합니다!');");
			out.println("location='login';");
			out.println("</script>");
		}else {
			
			
						
		checklistService.insert(cl);	//찜목록 상품 추가								
		}
		
		return "redirect:/list.do"; //찜목록으로 바로가기
	}
	
	// 찜목록
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session,ModelAndView ma) {
		
		
		String cl_id = (String) session.getAttribute("id"); //세션에 저장된 아이디
		

		List<ChecklistVO> list = checklistService.listCart(cl_id); //장바구니 정보
				
		Map<String, Object>map = new HashMap<String,Object>();
		map.put("list",list); //장바구니 리스트 정보
		map.put("count",list.size()); // 장바구니에 상품이 있는지 없는지
		ma.setViewName("qt_project/checklist");
		ma.addObject("map",map);
		
		
		return ma;
	}

	// 찜목록 삭제
	@RequestMapping("delete.do")
	public String delete(@RequestParam int clno) {
		checklistService.delete(clno);
		
		return "redirect:/list.do";
	}
	
	
	
}
