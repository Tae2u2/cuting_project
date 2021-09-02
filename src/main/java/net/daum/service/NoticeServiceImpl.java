package net.daum.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public int getTotalCount(NoticeVO n) {
		return this.NoticeDao.getTotalCount(n);
	}
	
	@Override
	public List<NoticeVO> getNoticeList(NoticeVO b) {
		return this.NoticeDao.getNoticeList(b);
	}
	@Transactional   //aop를 통한 트랜잭션적용.
	@Override
	public NoticeVO getNoticeCont(int no_postnb) {//내용보기를 클릭했음: 조회수1증가 + 내용보여주기
			   this.NoticeDao.updateHit(no_postnb); //
		return this.NoticeDao.getNoticeCont(no_postnb);
	}

	@Override
	public NoticeVO getNo_content2(int no_postnb) {	
		return this.NoticeDao.getNoticeCont(no_postnb);
	}//수정폼,삭제폼

	@Override //수정폼.
	public void editNotice(NoticeVO b) {
		this.NoticeDao.editNotice(b);
		
	}

	@Override
	public void delNotice(int no_postnb) {
		this.NoticeDao.delNotice(no_postnb);
	}


}
