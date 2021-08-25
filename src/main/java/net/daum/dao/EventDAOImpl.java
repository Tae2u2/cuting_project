package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.EventVO;

@Repository
public class EventDAOImpl implements EventDAO {
	
	@Autowired
	private SqlSession sqlsession;
	

	@Override
	public void insertEvent(EventVO e) {
		this.sqlsession.insert("insert_ev", e);

	}


	@Override
	public List<EventVO> getEventList(EventVO e) {
		
		return this.sqlsession.selectList("e_list", e);
	}


	@Override
	public EventVO getBoardCont2(int ev_postnb) {
		
		return this.sqlsession.selectOne("e_cont", ev_postnb);
	}


	@Override
	public void editEvent(EventVO eb) {
		this.sqlsession.update("upd_ev", eb);
	}


	@Override
	public void delEvent(int ev_postnb) {
		this.sqlsession.delete("del_ev", ev_postnb);
		
	}


	@Override
	public void updateDel(int ev_postnb) {
		this.sqlsession.update("up_del", ev_postnb);
		
	}


	@Override
	public int getListCount(EventVO e) {
		
		return this.sqlsession.selectOne("sel_low", e);
	}


	
}
