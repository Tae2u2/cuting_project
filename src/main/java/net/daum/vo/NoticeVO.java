package net.daum.vo;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int no_postnb;
	private String no_filename;
	private String no_update;
	private String no_exdate;
	private String no_mddate;
	private int no_delflag;
	private int no_viewcnt;
	private String no_title;
	private String no_content;
	
	//페이징 즉 쪽나누기
	private int startrow; //시작행번호
	private int endrow; //끝행번호
	
	//검색관련기능->검색필드와 검색어 관련 변수
	private String find_field; //검색필드
	private String find_name; //검색어
}