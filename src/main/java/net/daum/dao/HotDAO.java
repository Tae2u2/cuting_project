package net.daum.dao;

import java.util.List;

import net.daum.vo.Enter_nrVO;

public interface HotDAO {

	List<Enter_nrVO> getHotList(Enter_nrVO h);

	List<Enter_nrVO> getHot2List(Enter_nrVO h);

	List<Enter_nrVO> getHot1List(Enter_nrVO h);

}
