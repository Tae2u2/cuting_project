package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.Enter_nrVO;
import net.daum.vo.HeartVO;

@Repository
public class HeartDAOImpl implements HeartDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Enter_nrVO heartSave(HeartVO h) {
		Enter_nrVO en = new Enter_nrVO();
		en.setGb_postnb(h.getGb_postnb());
		
		sqlSession.update("h_up",en);//게시물의 좋아요 +1
		
		int result = sqlSession.insert("h_save",h); //heart 테이블에 추가 
		
		if(result ==1) { //heart 테이블에 좋아요가 추가가 성공했다면
			//갱신한 하트 갯수를 가져옴
			en = sqlSession.selectOne("h_count",en);
		}
		return en;	
	}//게시물 좋아요 추가
	
	
	@Override
	public Enter_nrVO heartRemove(HeartVO h) {
		Enter_nrVO en = new Enter_nrVO();
		en.setGb_postnb(h.getGb_postnb());
		
		sqlSession.update("h_down",en);//게시물의 좋아요 -1
		
		int result = sqlSession.insert("h_remove",h); //heart 테이블에 삭제
		
		if(result ==1) { //heart 테이블에 좋아요가 삭제가 성공했다면
			//갱신한 하트 갯수를 가져옴
			en = sqlSession.selectOne("h_count",en);
		}//게시물 좋아요 취소
		
		return en;		
	}//게시물 좋아요 취소


	@Override
	public List<HeartVO> gethList(String gb_id) {
		return this.sqlSession.selectList("h_list",gb_id);
	}//목록
	
	
	
}
