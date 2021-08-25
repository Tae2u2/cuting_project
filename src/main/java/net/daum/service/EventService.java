package net.daum.service;

import java.util.List;

import net.daum.vo.EventVO;

public interface EventService {

	void insertEvent(EventVO e);

	List<EventVO> getEventList(EventVO e);

	EventVO getBoardCont2(int ev_postnb);

	void editEvent(EventVO eb);

	void delEvent(int ev_postnb);

	int getListCount(EventVO e);

	

}
