package net.daum.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ComunityController {

	@RequestMapping(value="/comunity/comunity",method = RequestMethod.GET)
	public String comunity(Model m) {
		return "comunity/comunity";
	}
}
