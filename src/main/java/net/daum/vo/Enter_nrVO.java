package net.daum.vo;

import lombok.Data;

@Data //setter(),getter() 메서드 자동제공,toString() 메서드 자동제공.
public class Enter_nrVO {
	
	private int gb_postnb;
	private String gb_id;
	private String gb_filename;
	private String gb_update;
	private String gb_exdate;
	private int gb_likecnt;
	private int gb_viewcnt;
	private String gb_content;
	private String gb_title;
	private int gb_delflag;
	
	//검색관련기능->검색필드와 검색어 관련 변수
	private String find_field;//검색 필드
	private String find_name;//검색어	

}
