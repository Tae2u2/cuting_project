package net.daum.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.daum.dao.User_InfoDAO;
import net.daum.vo.User_InfoVO;

@Service
public class User_InfoServiceImpl implements User_InfoService {
	
	@Inject
	private User_InfoDAO user_infoDao;
	
	@Override
	public void insertUser_Info(User_InfoVO ui) {
		
		this.user_infoDao.insertUser_Info(ui);

	}

	@Override
	public int loginUser_Info(User_InfoVO ui) {
		// TODO Auto-generated method stub
		return this.user_infoDao.loginUser_Info(ui);
	}

	@Override
	public List<User_InfoVO> getUser_InfoList(User_InfoVO ui) {
		// TODO Auto-generated method stub
		return this.user_infoDao.getUser_InfoList(ui);
	}

	@Override
	public void editUser_Info(User_InfoVO ui) {
		// TODO Auto-generated method stub
		this.user_infoDao.editUser_info(ui);
	}

	@Override
	public int check_id(User_InfoVO ui) {
		// TODO Auto-generated method stub
		return this.user_infoDao.check_id(ui);
	}

	@Override
	public String getId(String email) {
		// TODO Auto-generated method stub
		return this.user_infoDao.get_id(email);
	}

	@Override
	public String getEmail(String email) {
		// TODO Auto-generated method stub
		return this.user_infoDao.get_email(email);
	}

	@Override
	public String getPw(String id) {
		// TODO Auto-generated method stub
		return this.user_infoDao.get_pw(id);
	}


}
