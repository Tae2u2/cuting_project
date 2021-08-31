package net.daum.vo;

import lombok.Data;

@Data
public class ComunityVO {
	private int pt_postnb;
	private String pt_id;
	private String pt_pw;
	private String pt_update;
	private String pt_mddate;
	private String pt_deldate;
	private int pt_delflag;
	private int pt_viewcnt;
	private int pt_reportcnt;
	private String pt_title;
	private String pt_content;
	private String pt_category;
}
