package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.daum.dao.Nr_ReplyDAO;
import net.daum.vo.Nr_ReplyVO;

@Service
public class Nr_ReplyServiceImpl implements Nr_ReplyService {
	
	@Autowired
	private Nr_ReplyDAO nr_replyDao;
	
	//스프링의 aop를 통한 트랜잭션 적용
	   @Transactional
	   @Override
	   public void addReply(Nr_ReplyVO rp) {
	      this.nr_replyDao.addReply(rp);    
	   }

		@Override
		public List<Nr_ReplyVO> listReply(int gb_postnb) {
			return this.nr_replyDao.listReply(gb_postnb);
		}

		@Override
		public void updateReply(Nr_ReplyVO rp) {
			this.nr_replyDao.updateReply(rp);
		}
		
		@Transactional
		@Override
		public void remove(int rno) {
			int gb_postnb=this.nr_replyDao.getGb_postnb(rno); //댓글번호로 게시물번호를 구함.
			this.nr_replyDao.delReply(rno);
		}

}
