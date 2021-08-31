package net.daum.dao;

import java.util.List;

import net.daum.vo.EventVO;

public interface EventDAO {


	int getTotalCount(EventVO e);

	List<EventVO> getEventList(EventVO e);

	void insertEvent(EventVO e);

	

}
