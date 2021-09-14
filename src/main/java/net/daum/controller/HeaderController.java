package net.daum.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.daum.service.ComunityService;
import net.daum.vo.ComunityVO;

@Controller
public class HeaderController {
	
	@GetMapping("about_qt")
	public String abouqt(){
		return "qt_project/about_qt";
	}

	@GetMapping("FAQ_qt")
	public String faqqt(){
		return "qt_project/FAQ_qt";
	}
	
	@Autowired
	private ComunityService comunityService;

	//내용보기
		@GetMapping("comunity")
		public ModelAndView comunity(Model m,@RequestParam("cm_postnb") int cm_postnb,HttpServletRequest request) {
			ComunityVO pt=this.comunityService.getBoardCont(cm_postnb);
			m.addAttribute("pt",pt);
			List<ComunityVO> ptlist=this.comunityService.listComunity(cm_postnb);
			ModelAndView listC=new ModelAndView("comunity/comunity");
			listC.addObject("ptlist",ptlist);
			cm_postnb=1;
			if(request.getParameter("cm_postnb") != null) {
				cm_postnb = Integer.parseInt(request.getParameter("cm_postnb"));
			}			
			listC.addObject("cm_postnb",cm_postnb);
			return listC;
		}//내용보기() end
		

}
