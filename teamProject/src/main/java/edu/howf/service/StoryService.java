package edu.howf.service;

import java.util.List;

import edu.howf.vo.HeartVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.StoryVO;

//service는 인터페이스 (설계도) 
//imple을 상속받는다
public interface StoryService {
	public List<StoryVO> storySelectAll(SearchVO vo);
	public int storyCountAll(SearchVO vo);
	public StoryVO storyView(int sbidx);
	public int storyWrite(StoryVO vo);
	public int storyModify(StoryVO vo);
	public int storyDelete(int sbidx);
	
	public int heartInsert(HeartVO vo);
	public int heartDelete(HeartVO vo);
	public int heartDup(HeartVO vo);
}
