package net.daum.service;

import java.util.List;

import net.daum.vo.Enter_nrVO;

public interface HotService {

	List<Enter_nrVO> getHotList(Enter_nrVO nr);
 
	List<Enter_nrVO> getHot2List(Enter_nrVO nr);

	List<Enter_nrVO> getHot1List(Enter_nrVO nr);

}
