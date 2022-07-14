package edu.howf.vo;

import java.util.List;

public class RoomVO{
	private int ridx;			//방 구분 번호
	private int sidx;			//숙박시설 구분 번호
	private String name;		//방 이름
	private int price;			//방 가격
	private List<String> tag;	//방 옵션(태그)
	private String tags;		//테이블에 담길 태그
	private int people;			//적정 인원 수
	private int square;			//방 평수
	private int cnt;			//방 갯수
	private String photo;		//방 사진
	private int sbed;			//싱글 베드 갯수
	private int dbed;			//더블 베드 갯수
	private int qbed;			//퀸 베드 갯수
	private int kbed;			//킹 베드 갯수
	private String bed;			//테이블에 저장할 침대 갯수
	private String delyn;		//삭제 여부
	
	public int getSquare() {
		return square;
	}
	public void setSquare(int square) {
		this.square = square;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public int getSidx() {
		return sidx;
	}
	public void setSidx(int sidx) {
		this.sidx = sidx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public List<String> getTag() {
		return tag;
	}
	public void setTag(List<String> tag) {
		this.tag = tag;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getSbed() {
		return sbed;
	}
	public void setSbed(int sbed) {
		this.sbed = sbed;
	}
	public int getDbed() {
		return dbed;
	}
	public void setDbed(int dbed) {
		this.dbed = dbed;
	}
	public int getQbed() {
		return qbed;
	}
	public void setQbed(int qbed) {
		this.qbed = qbed;
	}
	public int getKbed() {
		return kbed;
	}
	public void setKbed(int kbed) {
		this.kbed = kbed;
	}
	public String getBed() {
		return bed;
	}
	public void setBed(String bed) {
		this.bed = bed;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
}
