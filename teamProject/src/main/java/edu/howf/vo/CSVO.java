package edu.howf.vo;

public class CSVO extends BoardVO{
	
//	private String title;
//	private String content;
//	private String midx;
//	private String wdate;
//	private int cnt;
//	private String delyn;
	private int csbidx;	//1:1 문의글 번호
	private int origincsbidx;
	private String divsn;
	private String filename;
	
	public int getCsbidx() {
		return csbidx;
	}
	public void setCsbidx(int csbidx) {
		this.csbidx = csbidx;
	}
	public int getOrigincsbidx() {
		return origincsbidx;
	}
	public void setOrigincsbidx(int origincsbidx) {
		this.origincsbidx = origincsbidx;
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

	
	


}
