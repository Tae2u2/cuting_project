package net.daum.dao;

import java.util.List;

import net.daum.vo.User_InfoVO;

public interface User_InfoDAO {
	
	void insertUser_Info(User_InfoVO ui);
	int loginUser_Info(User_InfoVO ui);
	List<User_InfoVO> getUser_InfoList(User_InfoVO ui);
}
