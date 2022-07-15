package edu.howf.vo;

import java.util.List;

public class StayVO {
	private int sidx;			//숙박시설 번호
	private int midx;			//숙박시설 주인 회원 번호
	private String name;		//숙박시설 이름
	private String addr;		//숙박시설 주소
	private String detailaddr;	//숙박시설 상세 주소
	private List<String> content;		//숙박시설 간단한 설명
	private String contents;			//테이블에 저장할 숙박시설 설명
	private String tag;			//숙박시설 태그
	private String photo;		//숙박시설 사진
	private String delyn;		//삭제 여부
	private List<RoomVO> room;	//숙박시설에 있는 방
	private int star;			//숙박 시설 별점
	private int heart;			//숙박 시설 찜 갯수
	private int min;			//포함된 방의 최저가
	private int max;			//포함된 방의 최고가
	private List<String> service;	//숙박시설의 편의시설 및 서비스
	private String services;		//테이블에 저장할 편의시설 및 서비스
	
	public int getSidx() {
		return sidx;
	}
	public void setSidx(int sidx) {
		this.sidx = sidx;
	}
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDetailaddr() {
		return detailaddr;
	}
	public void setDetailaddr(String detailaddr) {
		this.detailaddr = detailaddr;
	}
	public List<String> getContent() {
		return content;
	}
	public void setContent(List<String> content) {
		this.content = content;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public List<RoomVO> getRoom() {
		return room;
	}
	public void setRoom(List<RoomVO> room) {
		this.room = room;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getHeart() {
		return heart;
	}
	public void setHeart(int heart) {
		this.heart = heart;
	}
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public List<String> getService() {
		return service;
	}
	public void setService(List<String> service) {
		this.service = service;
	}
	public String getServices() {
		return services;
	}
	public void setServices(String services) {
		this.services = services;
	}
}
