package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.daum.dao.ChecklistDAO;
import net.daum.vo.ChecklistVO;

@Service
public class ChecklistServiceImpl implements ChecklistService {
	
	@Autowired
	private ChecklistDAO checklistDao;
	
	@Override
	public void insert(ChecklistVO cl) {
		this.checklistDao.insert(cl);
	}// 상품추가 -> 찜목록 추가
	
	@Override
	public List<ChecklistVO> listCart(String cl_id) {
		return this.checklistDao.listCart(cl_id);
	}// 상품추가 -> 찜목록 추가
	
	@Override
	public void delete(int clno) {
		this.checklistDao.delete(clno);
	}//찜목록 삭제
		
	
	
	
	
}
