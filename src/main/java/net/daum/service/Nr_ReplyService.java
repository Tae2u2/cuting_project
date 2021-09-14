package net.daum.service;

import java.util.List;

import net.daum.vo.Nr_ReplyVO;

public interface Nr_ReplyService {

	void updateReply(Nr_ReplyVO rp);
	List<Nr_ReplyVO> listReply(int gb_postnb);
	void addReply(Nr_ReplyVO rp);
	void remove(int rno);

}
