package net.daum.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import net.daum.service.ReplyService;
import net.daum.vo.QnAVO;
import net.daum.vo.ReplyVO;

@Controller
public class QnAController {
	
	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private ReplyService replyService;
	
	//글쓰기
	@GetMapping("QnA_write")
	public String qna_write(Model m,HttpServletRequest request, HttpSession session, @ModelAttribute QnAVO qna) {
		qna.setQa_id((String) request.getSession().getAttribute("id"));
		m.addAttribute("qa_id",qna.getQa_id());
		return "QnA/QnA_write";
	}//qna_write() end
	
	
	//qna_write_ok()
	@RequestMapping(value="/QnA_write_ok",method=RequestMethod.POST)
    public String qna_write_ok(QnAVO qna,RedirectAttributes rttr) {
		this.qnaService.insertQnA(qna);
		rttr.addFlashAttribute("result","success");
		System.out.println(rttr.getFlashAttributes());
		return "redirect:/QnA_qt";
	}//qna_write_ok() end
	
	//리스트
	@RequestMapping(value="/QnA_qt",method=RequestMethod.GET)
	public ModelAndView QnA_qt(HttpServletRequest request,HttpSession session, @ModelAttribute QnAVO qna,@ModelAttribute ReplyVO rp) {
			qna.setQa_id((String) request.getSession().getAttribute("id"));
			List<QnAVO> qnalist=this.qnaService.getQnAList(qna);
			
			ModelAndView listQ=new ModelAndView("QnA/QnA_qt");
			listQ.addObject("qnalist",qnalist);
		int page=1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}			
		listQ.addObject("page",page);
		return listQ;	
	}//리스트() end
	
	//내용보기
	@GetMapping("qna_cont")
	public String qna_cont(HttpServletRequest request, HttpSession session,Model m,@RequestParam("qa_postnb") int qa_postnb, @ModelAttribute ReplyVO rp) {
		
		rp.setRp_id((String)request.getSession().getAttribute("id"));
		m.addAttribute("rp_id",rp.getRp_id());
		int listcount=this.replyService.getListCount(rp);
		List<ReplyVO> rlist = this.replyService.getReplyList(rp);
		System.out.println(listcount);			//댓글 개수.
		m.addAttribute("rlist", rlist);
				
		System.out.println(rp.getRp_delflag()); //얘는 항상0 이고
		System.out.println(rp.getRp_content()); //애는 null인 상태네.
		System.out.println(rp.getRp_id());		//아이디 제대로 나오고.
		System.out.println(qa_postnb);			//qa_postnb 제대로 나오고
		
		QnAVO qna=this.qnaService.getQnACont(qa_postnb);
		String qaContent = qna.getQa_content().replace("\n", "<br/>");
		m.addAttribute("qaContent", qaContent);
		m.addAttribute("qna",qna);
		
		return "QnA/qna_cont";
	}//내용보기() end
	
	//수정()
	@GetMapping("/qna_edit")
	public ModelAndView qna_edit(int qa_postnb) {
		QnAVO qna=this.qnaService.getQnACont2(qa_postnb);		
		ModelAndView em=new ModelAndView();
		em.setViewName("QnA/qna_edit");
		em.addObject("eqna",qna);
		return em;
	}//수정() end
	
	//수정확인()
	@PostMapping("/qna_edit_ok")
	public String qna_edit_ok(@ModelAttribute QnAVO eqna,RedirectAttributes rttr) {
		this.qnaService.editQnA(eqna);
		rttr.addFlashAttribute("result","success");
		return "redirect:/QnA_qt";
	}//수정확인() end
	
	//삭제()
	@RequestMapping("/qna_del")
	public ModelAndView qna_del(int qa_postnb,RedirectAttributes rttr) {
		qnaService.delQnA(qa_postnb);
		rttr.addFlashAttribute("result","success");
		ModelAndView dm=new ModelAndView("redirect:/QnA_qt");
		return dm;
	}//삭제() end
	
	
	
	//여기서 부터 댓글//
	
	
	//댓글등록
	@GetMapping("/qna_reply")
	public String qna_reply(Model m,int qa_postnb,HttpServletRequest request,HttpSession session,@ModelAttribute ReplyVO rp) {
		rp.setRp_id((String)request.getSession().getAttribute("id"));
		m.addAttribute("rp_id",rp.getRp_id());							//System.out.println(rp.getRp_id());
		m.addAttribute("qa_postnb", qa_postnb);
		return "QnA/qna_reply";
	}
	
	@PostMapping("qna_reply_ok")
	public String qna_reply_ok(HttpServletRequest request, HttpSession session,@RequestParam("qa_postnb") int qa_postnb,
			Model m,@ModelAttribute ReplyVO rp, @ModelAttribute QnAVO qna) throws Exception{
		
		rp.setRp_id((String)request.getSession().getAttribute("id"));
		m.addAttribute("rp_id",rp.getRp_id());  	
		m.addAttribute("qa_postnb", qa_postnb); 
		m.addAttribute("rp", rp);										//System.out.println(rp.getRp_id());
		
		this.replyService.replyQnA(rp);			//System.out.println(qa_postnb);
		return "redirect:/qna_cont?qa_postnb="+qa_postnb;
	}
	
	@RequestMapping("/reply_edit")
	public String reply_edit(Model m, int rp_postnb)throws Exception{
	
		System.out.println(rp_postnb);
		ReplyVO rp = this.replyService.replyCont(rp_postnb);
		System.out.println(rp.getRp_id()+000);
		m.addAttribute("rp", rp);
		return "QnA/reply_edit";
	}
	
	//수정확인()
	@RequestMapping("/reply_edit_ok")
	public String reply_edit_ok(HttpServletRequest request, HttpSession session,@ModelAttribute ReplyVO rp, Model m) {
		rp.setRp_id((String)request.getSession().getAttribute("id"));
		m.addAttribute("rp_id",rp.getRp_id());		
		System.out.println(rp.getRp_id());
		this.replyService.editReply(rp);
		System.out.println(rp.getQa_postnb());
		return "redirect:/qna_cont?qa_postnb="+rp.getQa_postnb();
	}//수정확인() end
	
	@RequestMapping("/reply_del")
	public ModelAndView reply_del(int rp_postnb) throws Exception{
		System.out.println(rp_postnb);
		ReplyVO rp = this.replyService.replyCont(rp_postnb);
		ModelAndView dm=new ModelAndView("redirect:/qna_cont?qa_postnb="+rp.getQa_postnb());
		this.replyService.replyDel(rp_postnb);
		
		return dm;
	}
	
}
