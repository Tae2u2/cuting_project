package net.daum.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.ComunityVO;

@Repository
public class ComunityDAOImpl implements ComunityDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void addComunity(ComunityVO pt) {
		this.sqlSession.insert("pt_in",pt);
	}//등록

	@Override
	public List<ComunityVO> listComunity(int cm_postnb) {
		return this.sqlSession.selectList("pt_list",cm_postnb);
	}//목록

	@Override
	public ComunityVO getBoardCont(int cm_postnb) {
		return this.sqlSession.selectOne("cm_cont",cm_postnb);
	}

	@Override
	public void delComunity(int pt_postnb) {
		this.sqlSession.delete("pt_del",pt_postnb);
	}

	@Override
	public void updateComunity(ComunityVO pt) {
		this.sqlSession.update("pt_edit",pt);
	}
	
	@Override
	public int getPno(int pt_postnb) {
		return this.sqlSession.selectOne("pt_pno",pt_postnb);//mybatis에서 selectOne()은 단 한개의 레코드값만 반환. reply_bno는 reply.xml에서 설정할
		//유일한 select 아이디명
	}


}
