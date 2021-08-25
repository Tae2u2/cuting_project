package net.daum.dao;

import java.util.List;

import net.daum.vo.NoticeVO;

public interface NoticeDAO {

	void insertNotice(NoticeVO b);
	List<NoticeVO> getNoticeList(NoticeVO b);
	int getTotalCount(NoticeVO b);

}
