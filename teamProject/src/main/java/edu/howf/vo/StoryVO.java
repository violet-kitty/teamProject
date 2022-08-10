package edu.howf.vo;

//여행이야기
public class StoryVO extends BoardVO{
	private int sbidx; //글 번호
	private int midx; //작성자 회원 번호
	private String filename;
	private String tag; //해시태그
	private int heart; //좋아요
	
	public int getSbidx() {
		return sbidx;
	}
	public void setSbidx(int sbidx) {
		this.sbidx = sbidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getHeart() {
		return heart;
	}
	public void setHeart(int heart) {
		this.heart = heart;
	}
}
