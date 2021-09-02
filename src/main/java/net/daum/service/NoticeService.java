package net.daum.service;

import java.util.List;

import net.daum.vo.NoticeVO;

public interface NoticeService {

	void insertNotice(NoticeVO b);
	int getTotalCount(NoticeVO n);
	List<NoticeVO> getNoticeList(NoticeVO b);
	NoticeVO getNoticeCont(int no_postnb);
	NoticeVO getNo_content2(int no_postnb);
	void editNotice(NoticeVO b);
	void delNotice(int no_postnb);

}
