package net.daum.vo;

public class User_InfoVO {
	
	private String info_id; //아이디
	private String info_pw;	//비밀번호
	private String info_name;//회원 이름
	private String info_bday;//생년월일
	private int info_phonenumber;//전화번호
	private String info_email;//이메일
	private String info_nickname;//닉네임
	private String info_joindate;//가입날짜
	private String info_modifydate;//수정날짜
	private String info_deldate;//삭제날짜
	private int info_delflag;//삭제 여부 확인
	
	
	public String getInfo_id() {
		return info_id;
	}
	public void setInfo_id(String info_id) {
		this.info_id = info_id;
	}
	public String getInfo_pw() {
		return info_pw;
	}
	public void setInfo_pw(String info_pw) {
		this.info_pw = info_pw;
	}
	public String getInfo_name() {
		return info_name;
	}
	public void setInfo_name(String info_name) {
		this.info_name = info_name;
	}
	public String getInfo_bday() {
		return info_bday;
	}
	public void setInfo_bday(String info_bday) {
		this.info_bday = info_bday;
	}
	public int getInfo_phonenumber() {
		return info_phonenumber;
	}
	public void setInfo_phonenumber(int info_phonenumber) {
		this.info_phonenumber = info_phonenumber;
	}
	public String getInfo_email() {
		return info_email;
	}
	public void setInfo_email(String info_email) {
		this.info_email = info_email;
	}
	public String getInfo_nickname() {
		return info_nickname;
	}
	public void setInfo_nickname(String info_nickname) {
		this.info_nickname = info_nickname;
	}
	public String getInfo_joindate() {
		return info_joindate;
	}
	public void setInfo_joindate(String info_joindate) {
		this.info_joindate = info_joindate;
	}
	public String getInfo_modifydate() {
		return info_modifydate;
	}
	public void setInfo_modifydate(String info_modifydate) {
		this.info_modifydate = info_modifydate;
	}
	public String getInfo_deldate() {
		return info_deldate;
	}
	public void setInfo_deldate(String info_deldate) {
		this.info_deldate = info_deldate;
	}
	public int getInfo_delflag() {
		return info_delflag;
	}
	public void setInfo_delflag(int info_delflag) {
		this.info_delflag = info_delflag;
	}
	
}
