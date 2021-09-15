package net.daum.dao;

import java.util.List;

import net.daum.vo.Enter_nrVO;
import net.daum.vo.HeartVO;

public interface HeartDAO {

	Enter_nrVO heartSave(HeartVO h);
	Enter_nrVO heartRemove(HeartVO h);
	List<HeartVO> gethList(String gb_id);

}
