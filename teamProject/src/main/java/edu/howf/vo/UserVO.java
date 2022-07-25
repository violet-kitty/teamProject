package edu.howf.vo;

public class UserVO {
	private int midx;			//회원번호
	private String name;		//이름
	private String email;		//이메일
	private String password;	//비밀번호
	private String nickname;	//닉네임
	private String phone;		//전화번호
	private String addr;		//도로명주소 or 지번주소
	private String detailaddr;	//상세주소
	private String jumin;		//생년월일
	private String role;		//회원종류(일반회원, 사업자, 관리자)
	private String img;			//프로필사진
	private String document;	//사업자일시 사업자 등록증
	private String joinyn;		//가입 승인 여부
	private String delyn;		//탈퇴 여부
	
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDetailaddr() {
		return detailaddr;
	}
	public void setDetailAddr(String detailaddr) {
		this.detailaddr = detailaddr;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getDocument() {
		return document;
	}
	public void setDocument(String document) {
		this.document = document;
	}
	public String getJoinyn() {
		return joinyn;
	}
	public void setJoinyn(String joinyn) {
		this.joinyn = joinyn;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
}
