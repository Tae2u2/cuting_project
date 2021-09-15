package net.daum.service;

import java.util.List;

import net.daum.vo.Enter_nrVO;

public interface Enter_nrService {

	void insertNr(Enter_nrVO en);
	List<Enter_nrVO> getNrList(Enter_nrVO en);
	Enter_nrVO getNrCont(int gb_postnb);
	Enter_nrVO getNrCont2(int gb_postnb);
	void modifyNr(Enter_nrVO en);
	void delNr(int gb_postnb);
	void heartUp(int gb_postnb);
	void heartDown(int gb_postnb);
	Enter_nrVO getHeartCnt(int gb_postnb);
	List<Enter_nrVO> collect_idList(String gb_id);

}
