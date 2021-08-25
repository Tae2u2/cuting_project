package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.QnAVO;


@Repository
public class QnADAOImpl implements QnADAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertQnA(QnAVO qna) {
		this.sqlSession.insert("qna_in",qna);
	}

	@Override
	public int getTotalCount() {
		return this.sqlSession.selectOne("qna_count");
	}

	@Override
	public List<QnAVO> getQnAList(QnAVO qna) {
		return this.sqlSession.selectList("qna_list",qna);
	}

	@Override
	public void qa_viewcnt(int qa_postnb) {
		this.sqlSession.update("qna_hit",qa_postnb);
		
	}

	@Override
	public QnAVO getQnACont(int qa_postnb) {
		return this.sqlSession.selectOne("qna_cont",qa_postnb);
	}

	@Override
	public void delQnA(int qa_postnb) {
		this.sqlSession.delete("qna_del",qa_postnb);
	}

	@Override
	public void editQnA(QnAVO eqna) {
		this.sqlSession.update("qna_edit",eqna);
		
	}

}
