package edu.howf.vo;

import java.util.ArrayList;

public class StayVO {
	private int sidx;
	private String name;
	private String addr;
	private String detailaddr;
	private String content;
	private String tag;
	private String photo;
	private String delyn;
	private ArrayList<RoomVO> room;
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public ArrayList<RoomVO> getRoom() {
		return room;
	}
	public void setRoom(ArrayList<RoomVO> room) {
		this.room = room;
	}
}
