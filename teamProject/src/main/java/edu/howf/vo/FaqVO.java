package edu.howf.vo;

import org.springframework.stereotype.Component;

@Component
public class FaqVO extends BoardVO{
	
	private int fbidx;
	private int cnt;
	private String title;
	private String content;
	private String writer;
	private int midx;
	
	public int getFbidx() {
		return fbidx;
	}
	public void setFbidx(int fbidx) {
		this.fbidx = fbidx;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
		
		
		
}

