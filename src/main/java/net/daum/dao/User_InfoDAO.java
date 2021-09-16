package net.daum.dao;

import java.util.List;

import net.daum.vo.User_InfoVO;

public interface User_InfoDAO {
	
	void insertUser_Info(User_InfoVO ui);
	int loginUser_Info(User_InfoVO ui);
	List<User_InfoVO> getUser_InfoList(User_InfoVO ui);
	void editUser_info(User_InfoVO ui);
	int check_id(User_InfoVO ui);
	String get_id(String email);
	String get_email(String email);
}
