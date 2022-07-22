package edu.howf.vo;

public class TeamVO extends BoardVO{ 
	
//	--UserVO의 매개변수--
//	private int midx;
	
//  --BoardVO의 매개변수들--	
//	private String title;
//	private String content;
//	private String wdate;
//	private int cnt;
//	private String delyn;
	
	private int tidx;
	private int people_cnt;
	private String filename;
	private String applyyn;
	
	public int getTidx() {
		return tidx;
	}
	public void setTidx(int tidx) {
		this.tidx = tidx;
	}
	public int getPeople_cnt() {
		return people_cnt;
	}
	public void setPeople_cnt(int people_cnt) {
		this.people_cnt = people_cnt;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getApplyyn() {
		return applyyn;
	}
	public void setApplyyn(String applyyn) {
		this.applyyn = applyyn;
	}
	
	
	

	
	
}
