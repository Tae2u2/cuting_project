package net.daum.service;


import java.util.List;


import net.daum.vo.ComunityVO;
import net.daum.vo.PostingVO;

public interface ComunityService {

	void addComunity(ComunityVO pt);
	List<ComunityVO> listComunity(int cm_postnb);
	void remove(int pt_postnb);
	void updateComunity(ComunityVO pt);

	PostingVO getBoardCont(int cm_postnb);

}
