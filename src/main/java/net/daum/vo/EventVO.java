package net.daum.vo;







public class EventVO {
	
	public int getEv_postnb() {
		return ev_postnb;
	}
	public void setEv_postnb(int ev_postnb) {
		this.ev_postnb = ev_postnb;
	}
	public String getEv_filename() {
		return ev_filename;
	}
	public void setEv_filename(String ev_filename) {
		this.ev_filename = ev_filename;
	}
	public String getEv_update() {
		return ev_update;
	}
	
	public void setEv_update(String ev_update) {
		this.ev_update = ev_update;
	}
	public String getEv_exdate() {
		return ev_exdate;
	}
	
	public void setEv_exdate(String ev_exdate) {
		this.ev_exdate = ev_exdate;
	}
	public String getEv_mddate() {
		return ev_mddate;
	}
	
	public void setEv_mddate(String ev_mddate) {
		this.ev_mddate = ev_mddate;
	}
	public int getEv_delflag() {
		return ev_delflag;
	}
	public void setEv_delflag(int ev_delflag) {
		this.ev_delflag = ev_delflag;
	}
	public String getEv_title() {
		return ev_title;
	}
	public void setEv_title(String ev_title) {
		this.ev_title = ev_title;
	}
	public String getEv_content() {
		return ev_content;
	}
	public void setEv_content(String ev_content) {
		this.ev_content = ev_content;
	}
	public int getStartrow() {
		return Startrow;
	}
	public void setStartrow(int startrow) {
		Startrow = startrow;
	}
	public int getEndrow() {
		return Endrow;
	}
	public void setEndrow(int endrow) {
		Endrow = endrow;
	}
	private int ev_postnb;
	private String ev_filename;
	
	
	private String ev_update;
	
	private String ev_exdate;
	
	
	private String ev_mddate;
	private int ev_delflag;

	private String ev_title;
	private String ev_content;
	private int Startrow;
	private int Endrow;
	


}
