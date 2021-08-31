package net.daum.dao;

import java.util.List;

import net.daum.vo.NoticeVO;

public interface NoticeDAO {

	void insertNotice(NoticeVO b);
	List<NoticeVO> getNoticeList(NoticeVO n);
	int getTotalCount(NoticeVO b);
	void updateHit(int no_postnb);
	NoticeVO getNoticeCont(int no_postnb);
	void editNotice(NoticeVO b);
	void delNotice(int no_postnb);

	

}
