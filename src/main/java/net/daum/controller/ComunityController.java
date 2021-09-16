package net.daum.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import net.daum.service.ComunityService;


import net.daum.vo.ComunityVO;




@Controller
public class ComunityController {

	
	@Autowired
	private ComunityService comunityService;
	//리스트
	@RequestMapping(value="/comunity",method=RequestMethod.GET)
	public ModelAndView comunity(HttpServletRequest request,HttpSession session, @ModelAttribute ComunityVO pt) {
			pt.setPt_id((String) request.getSession().getAttribute("id"));
			List<ComunityVO> ptlist=this.comunityService.getComunityList(pt);
			
			ModelAndView listC=new ModelAndView("comunity/comunity");
			listC.addObject("ptlist",ptlist);
		int page=1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}			
		listC.addObject("page",page);
		return listC;	
	}//리스트() end


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
