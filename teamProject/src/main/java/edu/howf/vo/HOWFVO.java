package edu.howf.vo;

//HOWF 추천
public class HOWFVO extends BoardVO{
	private int hbidx;		//글 번호
	private String file;	//메인 히어로에 들어갈 사진
	private String cate;	//카테고리(여행지, 맛집, 숙박)
	
	public int getHbidx() {
		return hbidx;
	}
	public void setHbidx(int hbidx) {
		this.hbidx = hbidx;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
}
