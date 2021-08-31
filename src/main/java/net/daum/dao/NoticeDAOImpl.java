package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.NoticeVO;

@Repository //@Repository 애노테이션에 의해서 스프링에서 DAO를 인식하게 한다.
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired //자동의존성 주입=>DI
	private SqlSession sqlSession;//mybatis쿼리문 수행 sqlSession 의존성 주입->DI

	@Override
	public void insertNotice(NoticeVO b) {
//mybatis에서 insert()메서드는 레코드 저장. 
//no_in은 notice.xml 에서 설정할 유일한 insert 아이디명이다.		
		this.sqlSession.insert("noti_in",b);
	}//게시판 저장
	
	@Override
	public int getTotalCount(NoticeVO b) {
		return this.sqlSession.selectOne("noti_count",b);
	}
	
	@Override
	public List<NoticeVO> getNoticeList(NoticeVO b) {
		return this.sqlSession.selectList("noti_list",b);
	}
	
	//8.30일수정본
	@Override	//공지사항 내용보기 클릭시 조회수 증가.
	public void updateHit(int no_postnb) {
		this.sqlSession.update("noti_hit", no_postnb);
	}
	
	@Override 	//공지사항 내용보기
	public NoticeVO getNoticeCont(int no_postnb) {
		return this.sqlSession.selectOne("noti_cont",no_postnb);
	}

}
