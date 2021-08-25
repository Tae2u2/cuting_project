package net.daum.vo;

import lombok.Data;

@Data
public class QnAVO {
	
	private int qa_postnb;
	private String qa_id;
	private String	qa_pw;
	private String qa_upload;
	private String qa_mddate;
	private String qa_deldate;
	private int qa_delflag;
	private int qa_viewcnt;
	private String qa_title;
	private String qa_content;
	
}
