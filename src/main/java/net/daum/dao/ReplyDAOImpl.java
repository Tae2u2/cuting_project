package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession sqlSession;


	@Override
	public void replyQnA(ReplyVO rp) {
		this.sqlSession.insert("reply_in", rp);
		
	}


	@Override
	public List<ReplyVO> getReplyList(ReplyVO rp) {
		return this.sqlSession.selectList("reply_list", rp);
	}


	@Override
	public int getListCount(ReplyVO rp) {
		
		return this.sqlSession.selectOne("reply_count",rp);
	}

	@Override
	public ReplyVO replyCont(int rp_postnb) {
		
		return this.sqlSession.selectOne("reply_cont", rp_postnb);
	}
	
	@Override
	public void editReply(ReplyVO rp) {
		this.sqlSession.update("reply_edit",rp);
	}


	@Override
	public void replyDel(int rp_postnb) {
		this.sqlSession.update("reply_del",rp_postnb);
	}
}
