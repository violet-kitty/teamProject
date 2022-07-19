package edu.howf.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

//게시판 관련 공통된 컬럼들 정의한 VO
public class BoardVO extends UserVO{
	
	private String title;
	private String content;
	private String wdate;
	private int cnt;
	private String delyn;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		try {
			SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date formatData = dtFormat.parse(wdate);
			this.wdate = newDtFormat.format(formatData);
//			System.out.println(this.wdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		this.wdate = wdate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
}
