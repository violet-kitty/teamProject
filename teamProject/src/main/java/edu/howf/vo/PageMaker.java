package edu.howf.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class PageMaker {
	private int totalCount;		// 전체 글 갯수
	private int startPage;		// 아래 페이징 번호가 몇번부터 시작해야 하는지
	private int endPage;		// 아래 페이징 번호가 몇번으로 끝나는지
	private boolean prev;		// 이전 버튼 생성 여부
	private boolean next;		// 다음 버튼 생성 여부
	private int displayPageNum = 10;	// < 1 2 3 4 5 6 7 8 9 10 > 번호 만들기 위한 변수
	private SearchVO search;	//현재 페이지, 한 페이지 내의 게시물 갯수, 검색타입, 검색어
	
	public SearchVO getSearch() {
		return search;
	}
	public void setSearch(SearchVO search) {
		this.search = search;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	//������ ��ȣ�� ����� ȭ�鿡 ��Ÿ���� ���ϴ� �޼ҵ�
	public void calcData() {
		endPage = (int)(Math.ceil(search.getPage()/(double)displayPageNum)*displayPageNum);
		startPage = (endPage - displayPageNum)+1;
		
		int tempEndPage = (int)(Math.ceil(totalCount/(double)search.getPerPageNum()));
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage*search.getPerPageNum() >= totalCount? false : true;
	}
	//�˻���� �ѱ��� ������ �� ������ �ʵ��� ���ڵ����ִ� �޼ҵ�
	public String encoding(String keyword) {
		String str = "";
		
		try {
			if(keyword != null) {
				str = URLEncoder.encode(keyword, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return str;
	}
}
