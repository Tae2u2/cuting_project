package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.daum.dao.Enter_nrDAO;
import net.daum.vo.Enter_nrVO;

@Service
public class Enter_nrServiceImpl implements Enter_nrService {
	
	@Autowired
	private Enter_nrDAO enter_nrDao;

	@Override
	public void insertNr(Enter_nrVO en) {
		this.enter_nrDao.insertNr(en);		
	}

	@Override
	public List<Enter_nrVO> getNrList(Enter_nrVO en) {
		return this.enter_nrDao.getNrList(en);
	}
	
	@Transactional //스프링의 AOP를 통한 트랜잭션 적용
	@Override
	public Enter_nrVO getNrCont(int gb_postnb) {
		this.enter_nrDao.updateViewcnt(gb_postnb);//조회수 증가
		return this.enter_nrDao.getNrCont(gb_postnb);//내용보기
	}

	@Override
	public Enter_nrVO getNrCont2(int gb_postnb){
		return this.enter_nrDao.getNrCont(gb_postnb);
	}//게시물 내용보기
	
	@Override
	public List<Enter_nrVO> collect_idList(String gb_id) {
		return this.enter_nrDao.collect_idList(gb_id);
	}

	@Override
	public void modifyNr(Enter_nrVO en) {
		this.enter_nrDao.modifyNr(en);		
	}//게시물 수정

	@Override
	public void delNr(int gb_postnb) {
		this.enter_nrDao.delNr(gb_postnb);		
	}//게시물 삭제

	@Override
	public void heartUp(int gb_postnb) {
		this.enter_nrDao.heartUp(gb_postnb);
	}//게시물 좋아요 +1

	@Override
	public void heartDown(int gb_postnb) {
		this.enter_nrDao.heartDown(gb_postnb);
	}//게시물 좋아요 -1
	
	@Transactional
	@Override
	public Enter_nrVO getHeartCnt(int gb_postnb) {
		return this.enter_nrDao.getHeartCnt(gb_postnb);
	}// 게시물 좋아요 총갯수 출력


	
	
}
