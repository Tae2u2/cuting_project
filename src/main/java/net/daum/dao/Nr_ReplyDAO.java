package net.daum.dao;

import java.util.List;

import net.daum.vo.Nr_ReplyVO;

public interface Nr_ReplyDAO {

	void addReply(Nr_ReplyVO rp);
	List<Nr_ReplyVO> listReply(int gb_postnb);
	void updateReply(Nr_ReplyVO rp);
	int getGb_postnb(int rno);
	void delReply(int rno);

}
