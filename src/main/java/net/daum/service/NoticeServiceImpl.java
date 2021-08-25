package net.daum.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.daum.dao.NoticeDAO;
import net.daum.vo.NoticeVO;

@Service //@Service 애노테이션을 추가해서 스프링에 서비스라는 것을 인식하게 한다.
public class NoticeServiceImpl implements NoticeService {
	
	@Inject //자동의존성 주입
	private NoticeDAO NoticeDao;

	@Override
	public void insertNotice(NoticeVO b) {
		this.NoticeDao.insertNotice(b);//this.은 생략가능
	}
	
	@Override
	public int getTotalCount(NoticeVO b) {
		return this.NoticeDao.getTotalCount(b);
	}
	
	@Override
	public List<NoticeVO> getNoticeList(NoticeVO b) {
		return this.NoticeDao.getNoticeList(b);
	}


}
