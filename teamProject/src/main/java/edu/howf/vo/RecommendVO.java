package edu.howf.vo;

import java.util.List;

public class RecommendVO extends BoardVO{
	
//	UserVO
//	private int midx;			//회원번호
//	private String name;		//이름
//	private String email;		//이메일
//	private String password;	//비밀번호
//	private String nickname;	//닉네임
//	private String phone;		//전화번호
//	private String addr;		//도로명주소 or 지번주소
//	private String detailaddr;	//상세주소
//	private String jumin;		//생년월일
//	private String role;		//회원종류(일반회원, 사업자, 관리자)
//	private String img;			//프로필사진
//	private String document;	//사업자일시 사업자 등록증
//	private String joinyn;		//가입 승인 여부
//	private String delyn;		//탈퇴 여부	
	
//	BoardVO
//	private String title;
//	private String content;
//	private String wdate;
//	private int cnt;
//	private String delyn;
	
	private int ridx;
	private int tidx;
	private String place1;
	private String place2;
	private String place3;
	private String place4;
	private String place5;
	private String pdate;
	private String allow;
	private String delyn;
	
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public int getTidx() {
		return tidx;
	}
	public void setTidx(int tidx) {
		this.tidx = tidx;
	}
	public String getPlace1() {
		return place1;
	}
	public void setPlace1(String place1) {
		this.place1 = place1;
	}
	public String getPlace2() {
		return place2;
	}
	public void setPlace2(String place2) {
		this.place2 = place2;
	}
	public String getPlace3() {
		return place3;
	}
	public void setPlace3(String place3) {
		this.place3 = place3;
	}
	public String getPlace4() {
		return place4;
	}
	public void setPlace4(String place4) {
		this.place4 = place4;
	}
	public String getPlace5() {
		return place5;
	}
	public void setPlace5(String place5) {
		this.place5 = place5;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getAllow() {
		return allow;
	}
	public void setAllow(String allow) {
		this.allow = allow;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	
	
	
	
	

}
