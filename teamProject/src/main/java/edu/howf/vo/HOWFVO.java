package edu.howf.vo;

//HOWF 추천
public class HOWFVO extends BoardVO{
	private int hbidx;		//글 번호
	private String filename;	//메인 페이지 히어로에 들어갈 사진
	private String cate;	//카테고리(여행지, 맛집, 숙박)
	private String tag;		//해시태그
	private int heart;		//찜 받은 수
	
	public int getHbidx() {
		return hbidx;
	}
	public void setHbidx(int hbidx) {
		this.hbidx = hbidx;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
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
