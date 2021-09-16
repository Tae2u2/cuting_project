package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.ComunityVO;

@Repository
public class ComunityDAOImpl implements ComunityDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ComunityVO> getComunityList(ComunityVO pt) {
		return this.sqlSession.selectList("pt_list",pt);
	}

	@Override
	public void insertPt(ComunityVO pt) {
		this.sqlSession.insert("pt_in",pt);
		
	}



}
