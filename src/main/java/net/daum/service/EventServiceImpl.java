package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import net.daum.dao.EventDAO;
import net.daum.vo.EventVO;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO eventDao;
	
	@Override
	public void insertEvent(EventVO e) {
		
		this.eventDao.insertEvent(e);

	}

	@Override
	public List<EventVO> getEventList(EventVO e) {
		
		return this.eventDao.getEventList(e);
	}

	@Override
	public EventVO getBoardCont2(int ev_postnb) {
		
		return this.eventDao.getBoardCont2(ev_postnb);
	}

	@Override
	public void editEvent(EventVO eb) {
		this.eventDao.editEvent(eb);
	}

	@Override
	@Transactional(isolation = Isolation.READ_COMMITTED)
	public void delEvent(int ev_postnb) {
		this.eventDao.updateDel(ev_postnb);
		this.eventDao.delEvent(ev_postnb);		
	}

	@Override
	public int getListCount(EventVO e) {
		
		return this.eventDao.getListCount(e);
	}

	

}
