package net.daum.service;

import java.util.List;

import org.springframework.stereotype.Service;

import net.daum.dao.HotDAO;
import net.daum.vo.Enter_nrVO;

@Service
public class HotServiceImpl implements HotService {

	private HotDAO hotDao;
 
	@Override
	public List<Enter_nrVO> getHotList(Enter_nrVO h) {
		
		return this.hotDao.getHotList(h);
	}

	@Override
	public List<Enter_nrVO> getHot2List(Enter_nrVO h) {
		return this.hotDao.getHot2List(h);
	}

	@Override
	public List<Enter_nrVO> getHot1List(Enter_nrVO h) {
	
		return this.hotDao.getHot1List(h);
	}
}
