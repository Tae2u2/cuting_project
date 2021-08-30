package net.daum.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.daum.service.User_InfoService;
import net.daum.vo.User_InfoVO;

@Controller
public class MainController {
	
	@Autowired
	private User_InfoService user_infoService;
	
	@GetMapping("/")
	public String mainPage(HttpServletRequest request,Model rttr, User_InfoVO ui) {
		System.out.println("이건 못참지");
		if(request.getSession().getAttribute("id")!=null) {
			ui.setInfo_id((String) request.getSession().getAttribute("id"));
			System.out.println(ui.getInfo_id());
			rttr.addAttribute("result", ui.getInfo_id());
			return "qt_project/main";
		}
		else {
			System.out.print("세션 어디감?");
			return "qt_project/main";
		}
	}

	
	@GetMapping("join")
	public String joinPage() {
		return "qt_project/join_qt";
	}
	
	@RequestMapping(value="/join_ok",method=RequestMethod.POST)
	public String join_ok(User_InfoVO ui, RedirectAttributes rttr) {
		this.user_infoService.insertUser_Info(ui);
		rttr.addFlashAttribute("result","success");
		return "redirect:/";
		
	}
	
	@GetMapping("login")
	public String loginPage() {
		return "qt_project/qt_login";
	}
	
	@RequestMapping(value="/login_ok",method=RequestMethod.POST)
	public String login_ok(Model rttr,HttpServletRequest request,HttpSession session,User_InfoVO ui)
		throws Exception{
		int i  = this.user_infoService.loginUser_Info(ui);
		if(i==1) {
			request.getSession().setAttribute("id", ui.getInfo_id());
			rttr.addAttribute("result", ui.getInfo_id());
			return "redirect:/";
		}
		else {
			return "redirect:/login";
		}
	}
	
	
	
	@RequestMapping(value="myinfo")
	public ModelAndView myinfoPage(HttpServletRequest request, HttpSession session, @ModelAttribute User_InfoVO ui) {
		ModelAndView listM;
		
		if(request.getSession().getAttribute("id")!=null) {
		ui.setInfo_id((String) request.getSession().getAttribute("id"));
		System.out.println(ui.getInfo_id());
		List<User_InfoVO> ulist = this.user_infoService.getUser_InfoList(ui);
		listM=new ModelAndView("/qt_project/mypage_qt");
		listM.addObject("ulist",ulist);
		return listM;
		}
		else {
			listM= new ModelAndView("/qt_project/qt_login");
			return listM;
		}
	}
	
	@RequestMapping(value="logout")
	public String logOut(HttpSession session, HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="modify",method=RequestMethod.POST)
	public String modifyInfo(HttpServletRequest request, User_InfoVO ui) {
		System.out.println("수정눌렀땅");
		ui.setSession_id((String)request.getSession().getAttribute("id"));
		System.out.println(ui.getSession_id());
		this.user_infoService.editUser_Info(ui);
		return "redirect:/myinfo";
	}
	
}
