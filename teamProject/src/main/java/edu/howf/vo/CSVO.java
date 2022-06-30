package edu.howf.vo;

public class CSVO extends BoardVO{
	
//	private String title;
//	private String content;
//	private String writer;
//	private String wdate;
//	private int cnt;
//	private String delyn;
	private int midx;	//유저 번호
	private int csidx;	//1:1 문의글 번호
	private int ridx;
	private String divsn;
	private String filename;
	private String replyn;
	
	
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getCsidx() {
		return csidx;
	}
	public void setCsidx(int csidx) {
		this.csidx = csidx;
	}
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public String getDivsn() {
		return divsn;
	}
	public void setDivsn(String divsn) {
		this.divsn = divsn;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getReplyn() {
		return replyn;
	}
	public void setReplyn(String replyn) {
		this.replyn = replyn;
	}

}
