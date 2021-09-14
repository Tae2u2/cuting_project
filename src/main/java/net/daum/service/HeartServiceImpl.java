package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.daum.dao.HeartDAO;
import net.daum.vo.Enter_nrVO;
import net.daum.vo.HeartVO;

@Service
public class HeartServiceImpl implements HeartService {
	
	@Autowired
	private HeartDAO heartDao;


	@Override
	public Enter_nrVO heartSave(HeartVO h) {
		return this.heartDao.heartSave(h);
	}//좋아요한 게시물 레코드에 추가

	@Override
	public Enter_nrVO heartRemove(HeartVO h) {
		return this.heartDao.heartRemove(h);
	}//좋아요 게시물 레코드에서 삭제

	@Override
	public List<HeartVO> gethList(String gb_id) {
		return this.heartDao.gethList(gb_id);
	}



	

}
