package edu.howf.vo;

import java.util.ArrayList;

//���� �̺�Ʈ
public class EventVO extends BoardVO{
	private int ebidx;			//�� ��ȣ
	private String file;		//�����̺�Ʈ ����Ʈ �������� ���� ����
	private String state;		//��
	private String city;		//��
	private String tag;			//�±�('#����'�� ������ �±׵�)
	private String startday;	//�̺�Ʈ ���� ��¥
	private String endday;		//�̺�Ʈ ���� ��¥
	
	public int getEbidx() {
		return ebidx;
	}
	public void setEbidx(int ebidx) {
		this.ebidx = ebidx;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String[] tagSplit() {
		String[] tags = tag.split("#");
		
		return tags;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
}
