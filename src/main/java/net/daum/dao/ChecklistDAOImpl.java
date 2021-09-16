package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.ChecklistVO;

@Repository
public class ChecklistDAOImpl implements ChecklistDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(ChecklistVO cl) {
		this.sqlSession.insert("insertCart",cl);
	}//찜목록 추가
	
	@Override
	public List<ChecklistVO> listCart(String cl_id){
		return sqlSession.selectList("listCart",cl_id);
	}//찜목록
	
	@Override
	public void delete(int clno) {
		this.sqlSession.delete("deleteCart",clno);
	}//찜목록 삭제 
	
	

	
	
	

}
