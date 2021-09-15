package net.daum.vo;

import lombok.Data;

@Data
public class ReplyVO {

	private int rp_postnb;
	private String rp_id;
	private String rp_update;
	private String rp_mddate;
	private String rp_deldate;
	private int rp_delflag;
	private int rp_flag;
	private String rp_content;
	private int qa_postnb;
	private int re_step;
}
