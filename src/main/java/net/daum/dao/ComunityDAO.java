package net.daum.dao;

import java.util.List;

import net.daum.vo.ComunityVO;
import net.daum.vo.PostingVO;

public interface ComunityDAO {

	void addComunity(ComunityVO pt);
	List<ComunityVO> listComunity(int cm_postnb);

	PostingVO getBoardCont(int cm_postnb);

	void delComunity(int pt_postnb);
	void updateComunity(ComunityVO pt);
	int getPno(int pt_postnb);

}
