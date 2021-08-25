package net.daum.service;

import java.util.List;

import net.daum.vo.NoticeVO;

public interface NoticeService {

	void insertNotice(NoticeVO b);
	int getTotalCount(NoticeVO b);
	List<NoticeVO> getNoticeList(NoticeVO b);

}
