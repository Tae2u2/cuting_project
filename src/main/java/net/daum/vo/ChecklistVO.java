package net.daum.vo;

import lombok.Data;

@Data
public class ChecklistVO {
	
	private int clno; //찜목록 번호
	private int gb_postnb; // 노름 게시물 번호
	private String gb_filename; // 노름 게시물 사진
	private String gb_id; // 게시물 소유주 
	private String cl_id; // 구매자(찜목록 넣을 우리 자신)
	private String cldate; // 찜목록에 넣은 날짜
	private int amount; // 게시물에 몇개나 있는지
	private String gb_title; //게시물제목
	
}
