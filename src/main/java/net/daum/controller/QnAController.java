package net.daum.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.daum.service.QnAService;
import net.daum.vo.QnAVO;

@Controller
@RequestMapping("/QnA/*")
public class QnAController {
	
	@Autowired
	private QnAService qnaService;
	
	//글쓰기
	@GetMapping("/QnA_write")
	public void qna_write(Model m,HttpServletRequest request) {
		int page=1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		m.addAttribute("page",page);
	}//qna_write() end
	
	
	//qna_write_ok()
	@RequestMapping(value="/QnA_write_ok",method=RequestMethod.POST)
    public String qna_write_ok(QnAVO qna,RedirectAttributes rttr) {
		this.qnaService.insertQnA(qna);
		rttr.addFlashAttribute("result","success");
		return "redirect:/QnA/QnA_qt";
	}//qna_write_ok() end
	
	//리스트
	@RequestMapping(value="/QnA_qt",method=RequestMethod.GET)
	public ModelAndView QnA_qt(HttpServletRequest request, @ModelAttribute QnAVO qna) {
		
		int page=1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int totalCount=this.qnaService.getTotalCount();
		List<QnAVO> qnalist=this.qnaService.getQnAList(qna);
		
		ModelAndView listQ=new ModelAndView("QnA/QnA_qt");
		listQ.addObject("totalCount",totalCount);
		listQ.addObject("qnalist",qnalist);
		listQ.addObject("page",page);
		return listQ;
		
	}//리스트() end
	
	//내용보기
	@RequestMapping("/qna_cont")
	public String qna_cont(Model m,@RequestParam("qa_postnb") int qa_postnb,int page) {
		QnAVO qna=this.qnaService.getQnACont(qa_postnb);
		m.addAttribute("qna",qna);
		m.addAttribute("page",page);
		return "QnA/qna_cont";
	}//내용보기() end
	
	//수정()
	@GetMapping("/qna_edit")
	public ModelAndView qna_edit(int qa_postnb,int page) {
		QnAVO qna=this.qnaService.getQnACont2(qa_postnb);		
		ModelAndView em=new ModelAndView();
		em.setViewName("QnA/qna_edit");
		em.addObject("eb",qna);
		em.addObject("page",page);
		return em;
	}//수정() end
	
	//수정확인()
	@PostMapping("/qna_edit_ok")
	public String qna_edit_ok(@ModelAttribute QnAVO eqna, int page,RedirectAttributes rttr) {
		this.qnaService.editQnA(eqna);
		rttr.addFlashAttribute("result","success");
		return "redirect:/QnA/QnA_qt?page="+page;
	}//수정확인() end
	
	//삭제()
	@RequestMapping("/qna_del")
	public ModelAndView qna_del(int qa_postnb ,int page,RedirectAttributes rttr) {
		qnaService.delQnA(qa_postnb);
		rttr.addFlashAttribute("result","success");
		ModelAndView dm=new ModelAndView("redirect:/QnA/QnA_qt");
		dm.addObject("page",page);
		return dm;
	}//삭제() end
	
}
