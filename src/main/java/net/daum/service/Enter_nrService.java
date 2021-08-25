package net.daum.service;

import java.util.List;

import net.daum.vo.Enter_nrVO;

public interface Enter_nrService {

	void insertNr(Enter_nrVO en);
	List<Enter_nrVO> getNrList(Enter_nrVO en);

}
