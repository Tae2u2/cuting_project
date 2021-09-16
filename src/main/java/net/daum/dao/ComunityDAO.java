package net.daum.dao;

import java.util.List;

import net.daum.vo.ComunityVO;

public interface ComunityDAO {


	List<ComunityVO> getComunityList(ComunityVO pt);

}
