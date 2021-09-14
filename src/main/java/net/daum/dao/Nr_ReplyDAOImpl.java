package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.Nr_ReplyVO;

@Repository
public class Nr_ReplyDAOImpl implements Nr_ReplyDAO {
	
	@Autowired
	   private SqlSession sqlSession;//mybatis 쿼리문 수행 sqlSession 생성

	@Override
	  public void addReply(Nr_ReplyVO rp) {
	     this.sqlSession.insert("nr_reply_in",rp);	  
	 }//댓글등록

	@Override
	public List<Nr_ReplyVO> listReply(int gb_postnb) {
		return this.sqlSession.selectList("nr_reply_list",gb_postnb);
	}//댓글목록

	@Override
	public void updateReply(Nr_ReplyVO rp) {
		this.sqlSession.update("nr_reply_edit",rp);
	}//댓글 수정

	@Override
	public void delReply(int rno) {
		this.sqlSession.delete("nr_reply_del",rno);
	}//댓글삭제

	@Override
	public int getGb_postnb(int rno) {	
		return this.sqlSession.selectOne("reply_gb_postnb",rno);	
	}//댓글번호로 게시판 번호값 알아내기
	   
	   
}