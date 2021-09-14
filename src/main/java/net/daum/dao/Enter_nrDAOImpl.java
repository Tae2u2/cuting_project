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
		this.sqlSession.insert("nr_in",en);//mybatis에서 insert()메서드는 레코드를 저장시킴. nr_in은 enter_nr.xml에서 설정할 유일한 insert 아이디명.	
	}//자료실 저장

	@Override
	public List<Enter_nrVO> getNrList(Enter_nrVO en) {
		return this.sqlSession.selectList("nr_list",en);//this.은 생략가능함. mybatis에서 selectList()메서드는 하나이상의 레코드를 검색해서 컬렉션 List
		//로 반환
	}//자료실 목록
	
	@Override
	public Enter_nrVO getNrCont(int gb_postnb) {
		return this.sqlSession.selectOne("gb_co",gb_postnb);
	}//내용보기
	
	@Override
	public List<Enter_nrVO> collect_idList(String gb_id) {
		return this.sqlSession.selectList("collect_idList",gb_id);
	}//아이디 목록

	@Override
	public void updateViewcnt(int gb_postnb) {
		sqlSession.update("gb_vc",gb_postnb);	
	}//조회수 증가
	
	@Override
	public void modifyNr(Enter_nrVO en) {
		this.sqlSession.update("nr_modify", en);		
	}//자료실 수정

	@Override
	public void delNr(int gb_postnb) {
		this.sqlSession.update("nr_del",gb_postnb);		
	}//자료실 삭제

	@Override
	public void heartUp(int gb_postnb) {
		sqlSession.update("h_up",gb_postnb);
	}//좋아요 증가

	@Override
	public void heartDown(int gb_postnb) {
		sqlSession.update("h_down",gb_postnb);
	}//좋아요 하락, 취소

	@Override
	public Enter_nrVO getHeartCnt(int gb_postnb) {
		return this.sqlSession.selectOne("h_count",gb_postnb);
	}//좋아요 갯수 출력
	
	
	
}
