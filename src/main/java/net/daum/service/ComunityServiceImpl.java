package net.daum.service;



import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.daum.dao.ComunityDAO;
import net.daum.vo.ComunityVO;

@Service
public class ComunityServiceImpl implements ComunityService {
	
	@Autowired
	private ComunityDAO comunityDao;

	@Override
	public List<ComunityVO> getComunityList(ComunityVO pt) {
		// TODO Auto-generated method stub
		return this.comunityDao.getComunityList(pt);
	}




}
