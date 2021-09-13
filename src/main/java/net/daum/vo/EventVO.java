package net.daum.vo;





import lombok.Data;

@Data
public class EventVO {
	
	private int ev_postnb;
	private String ev_filename;
	
	
	private String  ev_update;
	
	
	private String ev_exdate;
	
	
	private String ev_mddate;
	private int ev_delflag;

	private String ev_title;
	private String ev_content;
	private int Startrow;
	private int Endrow;
	


}
