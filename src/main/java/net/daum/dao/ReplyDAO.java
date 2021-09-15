package net.daum.dao;

import java.util.List;

import net.daum.vo.ReplyVO;

public interface ReplyDAO {

	void replyQnA(ReplyVO rp);

	List<ReplyVO> getReplyList(ReplyVO rp);

	int getListCount(ReplyVO rp);

	ReplyVO replyCont(int rp_postnb);

	void editReply(ReplyVO rp);

	void replyDel(int rp_postnb);
}
