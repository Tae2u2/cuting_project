package net.daum.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.daum.dao.ComunityDAO;
import net.daum.vo.ComunityVO;

@Service
public class ComunityServiceImpl implements ComunityService {
	@Inject
	private ComunityDAO comunityDao;

	@Override
	public List<ComunityVO> getComunityList(ComunityVO pt) {

		return this.comunityDao.getComunityList(pt);
	}

	@Override
	public void insertPt(ComunityVO pt) {
		this.comunityDao.insertPt(pt);
		
	}



}
