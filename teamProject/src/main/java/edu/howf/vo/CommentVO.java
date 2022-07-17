package edu.howf.vo;

public class CommentVO extends SearchVO{
	private int cbidx;
	private String content;
	private String photo;
	private int star;
	private String type;
	private int bidx;
	private String delyn;
	
	public int getCbidx() {
		return cbidx;
	}
	public void setCbidx(int cbidx) {
		this.cbidx = cbidx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
}
