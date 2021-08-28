package net.daum.service;

import java.util.List;

import net.daum.vo.User_InfoVO;

public interface User_InfoService {
	
	void insertUser_Info(User_InfoVO ui);
	int loginUser_Info(User_InfoVO ui);
	List<User_InfoVO> getUser_InfoList(User_InfoVO ui);
	void editUser_Info(User_InfoVO ui);
}
