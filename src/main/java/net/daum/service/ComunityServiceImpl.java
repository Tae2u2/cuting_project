package net.daum.service;



import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.daum.dao.ComunityDAO;
import net.daum.vo.ComunityVO;
import net.daum.vo.PostingVO;

@Service
public class ComunityServiceImpl implements ComunityService {
	
	@Autowired
	private ComunityDAO comunityDao;

	@Override
	public PostingVO getBoardCont(int cm_postnb) {
		return this.comunityDao.getBoardCont(cm_postnb);
	}
	
	@Transactional
	@Override
	public void addComunity(ComunityVO pt) {
		this.comunityDao.addComunity(pt);
	}

	@Override
	public List<ComunityVO> listComunity(int cm_postnb) {
		return this.comunityDao.listComunity(cm_postnb);
	}

	@Transactional
	@Override
	public void remove(int pt_postnb) {
		this.comunityDao.delComunity(pt_postnb);
	}

	
	@Override
	public void updateComunity(ComunityVO pt) {
		this.comunityDao.updateComunity(pt);
	}



}
