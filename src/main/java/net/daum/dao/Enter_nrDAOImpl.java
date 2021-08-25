package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.Enter_nrVO;

@Repository
public class Enter_nrDAOImpl implements Enter_nrDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertNr(Enter_nrVO en) {
		this.sqlSession.insert("nr_in",en);//mybatis에서 insert()메서드는 레코드를 저장시킴. nr_in은 bbs.xml에서 설정할 유일한 insert 아이디명.	
	}//자료실 저장

	@Override
	public List<Enter_nrVO> getNrList(Enter_nrVO en) {
		return this.sqlSession.selectList("nr_list",en);//this.은 생략가능함. mybatis에서 selectList()메서드는 하나이상의 레코드를 검색해서 컬렉션 List
		//로 반환
	}//자료실 목록
	
}
