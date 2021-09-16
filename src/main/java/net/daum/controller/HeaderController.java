package net.daum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


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
	
	@GetMapping("checklist")
	public String checklist(){
		return "qt_project/checklist";
	}
	

}
