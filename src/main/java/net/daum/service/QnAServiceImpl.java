package net.daum.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import net.daum.dao.QnADAO;
import net.daum.vo.QnAVO;

@Service
public class QnAServiceImpl implements QnAService {

	@Inject
	private QnADAO qnaDao;

	@Override
	public void insertQnA(QnAVO qna) {
		this.qnaDao.insertQnA(qna);
	}

	@Override
	public int getTotalCount() {
		return this.qnaDao.getTotalCount();
	}

	@Override
	public List<QnAVO> getQnAList(QnAVO qna) {
		return this.qnaDao.getQnAList(qna);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public QnAVO getQnACont(int qa_postnb) {
		this.qnaDao.qa_viewcnt(qa_postnb);
		return this.qnaDao.getQnACont(qa_postnb);
	}

	@Override
	public QnAVO getQnACont2(int qa_postnb) {
		return this.qnaDao.getQnACont(qa_postnb);
	}

	@Override
	public void editQnA(QnAVO eqna) {
		this.qnaDao.editQnA(eqna);
	}

	@Override
	public void delQnA(int qa_postnb) {
		this.qnaDao.delQnA(qa_postnb);
	}
	
	
}
