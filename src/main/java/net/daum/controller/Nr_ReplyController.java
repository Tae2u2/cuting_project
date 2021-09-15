package net.daum.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import net.daum.service.Nr_ReplyService;
import net.daum.vo.Nr_ReplyVO;

@RestController
@RequestMapping("/replies")
public class Nr_ReplyController {
	
	@Autowired
	private Nr_ReplyService nr_replyService;
	
	//댓글등록
	@RequestMapping(value="",method=RequestMethod.POST)//post방식으로 접근하는 매핑주소 처리
	public ResponseEntity<String> register(@RequestBody Nr_ReplyVO rp){
		//@RequestBody 애노테이션은 전송된 JSON데이터를 객체로 변환한다. 데이터 전송방식은 json이다. json으로 보내진 데이터를 ReplyVO 타입으로 변경한다.
		ResponseEntity<String> entity =null;
		
		try {
			this.nr_replyService.addReply(rp);//댓글 등록 저장
			entity= new ResponseEntity<String>("success",HttpStatus.OK);//댓글 저장 성공시 success문자열을 반환하고,200 정상 상태 코드 반환
			
		}catch(Exception e) {
			e.printStackTrace();
			entity= new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);//예외에러가 발생하면 나쁜 상태코드를 문자열로 반환
		}
		return entity;
	}//register()
	
	//댓글목록
    @RequestMapping(value="/all/{gb_postnb}",produces = "application/json") //get 방식으로 접근하는 매핑주소 처리
    public ResponseEntity<List<Nr_ReplyVO>> list(@PathVariable("gb_postnb") int gb_postnb){
       //@PathVariable("gb_postnb")는 매핑주소의 게시판 번호값을 추출하는 용도.
       ResponseEntity<List<Nr_ReplyVO>> entity=null;
       
       try {
          entity=new ResponseEntity<>(this.nr_replyService.listReply(gb_postnb),HttpStatus.OK);//게시판 번호에 해당하는 댓글 목록을 반환
       }catch(Exception e) {
          e.printStackTrace();
          entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
       }
       return entity;
    }//list()
    
    
    //댓글삭제
    @RequestMapping(value="{rno}", method = RequestMethod.DELETE)
    public ResponseEntity<String> remove(@RequestParam("gb_postnb") int gb_postnb,@PathVariable("rno") int rno,HttpServletResponse response,HttpServletRequest request){
    	ResponseEntity<String> entity=null;
    	try {
    		String rp_id=(String)request.getSession().getAttribute("id"); //세션아이디값 가져오기
    		Nr_ReplyVO db_id = (Nr_ReplyVO) nr_replyService.listReply(gb_postnb);
    		response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
    		
    		if(!db_id.getRp_id().equals(rp_id)) {
    			out.println("<script>");
				out.println("alert('삭제할 권한이 없습니다.');");
				out.println("location='nr_reply';");
				out.println("</script>");
    		}else {
    		
    		this.nr_replyService.remove(rno);//댓글삭제
    		entity=new ResponseEntity<>("success", HttpStatus.OK);}
    	}catch(Exception e) {
    		e.printStackTrace();
    		entity=new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
    	}
    	return entity;
    }//remove()

}