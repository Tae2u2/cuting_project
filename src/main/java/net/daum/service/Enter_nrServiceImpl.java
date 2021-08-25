package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


}
