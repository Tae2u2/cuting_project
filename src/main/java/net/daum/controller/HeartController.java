package net.daum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.daum.service.HeartService;
import net.daum.vo.Enter_nrVO;
import net.daum.vo.HeartVO;

@Controller
public class HeartController {
	
	@Autowired
	private HeartService heartService;
	
	//빈 하트 클릭시 하트 저장
	@ResponseBody
	@RequestMapping(value="/saveHeart.do" ,produces = "application/json")
	public Enter_nrVO save_heart(@RequestParam int gb_postnb, HttpSession session,HttpServletRequest request) {
		
		HeartVO h = new HeartVO();
		
		h.setGb_postnb(gb_postnb); //게시물 번호 불러오기
		h.setGb_id((String) request.getSession().getAttribute("id")); //로그인한 세션아이디값을 받아와 gb_id에 설정
		Enter_nrVO en = heartService.heartSave(h);
				
		return en;		
	}
	
	// 빨간하트 클릭시 하트 해제
	@ResponseBody
	@RequestMapping(value = "/removeHeart.do", produces = "application/json")
	public Enter_nrVO remove_heart(@RequestParam int gb_postnb, HttpSession session,HttpServletRequest request) {
		
		HeartVO h = new HeartVO();
		
		h.setGb_postnb(gb_postnb); //게시물 번호 불러오기
		h.setGb_id((String) request.getSession().getAttribute("id")); //로그인한 세션아이디값을 받아와 gb_id에 설정
		Enter_nrVO en = heartService.heartRemove(h);
		return en;
	}
	
	
		
		
	
	

}
