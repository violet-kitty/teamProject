package edu.howf.vo;

import java.util.ArrayList;

//지역 이벤트
public class EventVO extends BoardVO{
	private int ebidx;			//글 번호
	private String file;		//이벤트 리스트 페이지 슬라이드에 들어갈 사진
	private String state;		//도
	private String city;		//시
	private String tag;			//태그들. #으로 구분됨
	private String startday;	//이벤트 시작날짜
	private String endday;		//이벤트 종료날짜
	
	public int getEbidx() {
		return ebidx;
	}
	public void setEbidx(int ebidx) {
		this.ebidx = ebidx;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String[] tagSplit() {
		String[] tags = tag.split("#");
		
		return tags;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
}
