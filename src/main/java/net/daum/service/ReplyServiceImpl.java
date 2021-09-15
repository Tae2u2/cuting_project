package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.daum.dao.ReplyDAO;
import net.daum.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO replyDao;

	@Override
	public void replyQnA(ReplyVO rp) {
		this.replyDao.replyQnA(rp);
		
	}

	@Override
	public List<ReplyVO> getReplyList(ReplyVO rp) {
		
		return this.replyDao.getReplyList(rp);
	}

	@Override
	public int getListCount(ReplyVO rp) {
		
		return this.replyDao.getListCount(rp);
	}
	
	@Override
	public ReplyVO replyCont(int rp_postnb) {
		
		return this.replyDao.replyCont(rp_postnb);
	}
	
	@Override
	public void editReply(ReplyVO rp) {
		this.replyDao.editReply(rp);
	}

	@Override
	public void replyDel(int rp_postnb) {
		this.replyDao.replyDel(rp_postnb);
	}

	
}
