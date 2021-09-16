package net.daum.dao;

import java.util.List;

import net.daum.vo.ChecklistVO;

public interface ChecklistDAO {

	void insert(ChecklistVO cl);
	List<ChecklistVO> listCart(String cl_id);
	void delete(int clno);
	
	
}
