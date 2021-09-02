package net.daum.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.daum.vo.ComunityVO;

@Controller
public class ComunityController {

	@RequestMapping(value="/comunity/comunity",method = RequestMethod.GET)
	public String comunity(Model m) {
		return "comunity/comunity";
	}
	
	@GetMapping("comunity")
	public String comunityPosting(HttpServletRequest request, Model model , HttpSession session, @ModelAttribute ComunityVO cp) {
		cp.setPt_id((String) request.getSession().getAttribute("id"));
		model.addAttribute("pt_id",cp.getPt_id());
		System.out.println(cp.getPt_id());
		return "comunity/comunity";
	}
	
	
}
