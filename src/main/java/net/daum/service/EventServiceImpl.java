package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.daum.dao.EventDAO;
import net.daum.vo.EventVO;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO eventDao;



	@Override
	public int getTotalCount(EventVO e) {
		
		return this.eventDao.getTotalCount(e);
	}

	@Override
	public List<EventVO> getEventList(EventVO e) {
		
		return this.eventDao.getEventList(e);
	}

	@Override
	public void insertEvent(EventVO e) {
		this.eventDao.insertEvent(e);
		
	}

	@Override
	public EventVO getEventCont(int no) {
		
		return this.eventDao.getEventCont(no);
	}

	@Override
	public void editEvent(EventVO e) {
		this.eventDao.editEvent(e);
		
	}
	@Transactional
	@Override
	public void delEvent(int no) {
		this.eventDao.delEvent(no);
		this.eventDao.getEventDelLi(no);
	}




}
