package net.daum.dao;

import java.util.List;

import net.daum.vo.NoticeVO;

public interface NoticeDAO {

	void insertNotice(NoticeVO b);
	List<NoticeVO> getNoticeList(NoticeVO b);
	int getTotalCount(NoticeVO b);
	//8.30일 수정본
	void updateHit(int no_postnb);
	NoticeVO getNoticeCont(int no_postnb);

}
