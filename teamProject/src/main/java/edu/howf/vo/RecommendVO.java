package edu.howf.vo;

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
	private String place;
	private String pdate;
	
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	
	

}
