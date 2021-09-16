package net.daum.service;

import java.util.List;

import net.daum.vo.ChecklistVO;

public interface ChecklistService {

	void insert(ChecklistVO cl);
	List<ChecklistVO> listCart(String cl_id);
	void delete(int clno);	


}
