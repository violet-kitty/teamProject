package edu.howf.vo;

public class SearchVO extends Criteria{
	private String searchType;
	private String searchValue;
	private String sortType;
	private FilterVO filter;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public String getSortType() {
		return sortType;
	}
	public void setSortType(String sortType) {
		this.sortType = sortType;
	}
	public FilterVO getFilter() {
		return filter;
	}
	public void setFilter(FilterVO filter) {
		this.filter = filter;
	}
}
