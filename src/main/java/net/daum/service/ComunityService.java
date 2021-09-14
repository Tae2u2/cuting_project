package net.daum.service;


import java.util.List;


import net.daum.vo.ComunityVO;

public interface ComunityService {

	void addComunity(ComunityVO pt);
	List<ComunityVO> listComunity(int cm_postnb);
	void remove(int pt_postnb);
	void updateComunity(ComunityVO pt);

	ComunityVO getBoardCont(int cm_postnb);

}
