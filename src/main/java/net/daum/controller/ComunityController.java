package net.daum.controller;



import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import net.daum.service.ComunityService;
import net.daum.vo.ComunityVO;



@RestController
@RequestMapping("/posting")
public class ComunityController {
	
	@Autowired
	private ComunityService comunityService;

	//댓글 등록
	@RequestMapping(value="",method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ComunityVO pt,HttpServletRequest request){
		ResponseEntity<String> entity=null;		
		pt.setPt_id((String) request.getSession().getAttribute("id"));
		try {
			this.comunityService.addComunity(pt);
			entity=new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);//예외 에러가 발생하면 나쁜 상태코드를 문자열로 반환
		}
		return entity;
	}//register()
	
	//목록
    @RequestMapping(value="/all/{cm_postnb}",produces = "application/json") //get 방식으로 접근하는 매핑주소 처리
    public ResponseEntity<List<ComunityVO>> list(@PathVariable ("cm_postnb") int cm_postnb){
    	ResponseEntity<List<ComunityVO>> entity=null;
    	try {
    		entity=new ResponseEntity<>(this.comunityService.listComunity(cm_postnb),HttpStatus.OK);//게시판 번호에 해당하는 댓글 목록을 반환
    	}catch(Exception e) {
    		e.printStackTrace();
    		entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    	}
    	return entity;
    }//list()
	
    @RequestMapping(value="/{pt_postnb}", method= {RequestMethod.PUT,RequestMethod.PATCH})
    //PUT은 전체자료를 수정, PATCH는 일부 자료만 수정
    public ResponseEntity<String> update(@PathVariable("pt_postnb") int pt_postnb, @RequestBody ComunityVO pt){
    	ResponseEntity<String> entity=null;
    	
    	try {
    		pt.setPt_postnb(pt_postnb);//댓글 번호 저장
    		this.comunityService.updateComunity(pt);//댓글 수정
    		entity=new ResponseEntity<>("success",HttpStatus.OK);
    	}catch(Exception e) {
    		e.printStackTrace();
    		entity=new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
    	}
    	return entity;
    }//edit()
	
    @RequestMapping(value="{pt_postnb}",method=RequestMethod.DELETE)
    public ResponseEntity<String> remove(@PathVariable("pt_postnb") int pt_postnb){
    	ResponseEntity<String> entity=null;
    	
    	try {
    		this.comunityService.remove(pt_postnb);//댓글 삭제
    		entity=new ResponseEntity<>("success",HttpStatus.OK);
    	}catch(Exception e) {
    		e.printStackTrace();
    		entity=new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
    	}
    	return entity;
    }//remove()
}
