package net.daum.service;

import java.util.List;

import net.daum.vo.QnAVO;

public interface QnAService {

	void insertQnA(QnAVO qna);

	int getTotalCount();

	List<QnAVO> getQnAList(QnAVO qna);

	QnAVO getQnACont(int qa_postnb);

	QnAVO getQnACont2(int qa_postnb);

	void editQnA(QnAVO eqna);

	void delQnA(int qa_postnb);

}
