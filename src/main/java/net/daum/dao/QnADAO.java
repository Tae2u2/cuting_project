package net.daum.dao;

import java.util.List;

import net.daum.vo.QnAVO;

public interface QnADAO {

	void insertQnA(QnAVO qna);

	int getTotalCount();

	List<QnAVO> getQnAList(QnAVO qna);

	void qa_viewcnt(int qa_postnb);

	QnAVO getQnACont(int qa_postnb);

	void delQnA(int qa_postnb);

	void editQnA(QnAVO eqna);

}
