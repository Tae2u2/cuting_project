package net.daum.service;

import java.util.List;

import net.daum.vo.ComunityVO;

public interface ComunityService {


	List<ComunityVO> getComunityList(ComunityVO pt);

	void insertPt(ComunityVO pt);


}
