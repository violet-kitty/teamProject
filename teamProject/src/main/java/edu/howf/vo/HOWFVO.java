package edu.howf.vo;

//HOWF ��õ
public class HOWFVO extends BoardVO{
	private int hbidx;		//�� ��ȣ
	private String file;	//���� ����ο� �� ����
	private String cate;	//ī�װ�(������, ����, ����)
	
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
