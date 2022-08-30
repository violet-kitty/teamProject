package edu.howf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.StoryDao;
import edu.howf.vo.StoryVO;
import edu.howf.vo.CommentVO;
import edu.howf.vo.HeartVO;
import edu.howf.vo.SearchVO;

// 실제 구현하는 클래스
@Service
public class StoryServiceImple implements StoryService{
	@Autowired
	StoryDao StoryDao;

	//여행이야기
	@Override
	public List<StoryVO> storySelectAll(SearchVO vo) {
		return StoryDao.storySelectAll(vo);
	}
	
	@Override
	public int storyCountAll(SearchVO vo) {
		return StoryDao.storyCountAll(vo);
	}
	
	@Override
	public StoryVO storyView(int sbidx) {
		return StoryDao.storyView(sbidx);
	}
	
	@Override
	public int storyWrite(StoryVO vo) {
		return StoryDao.storyWrite(vo);
	}
	
	@Override
	public int storyModify(StoryVO vo) {
		return StoryDao.storyModify(vo);
	}
	
	@Override
	public int storyDelete(int sbidx) {
		return StoryDao.storyDelete(sbidx);
	}
	
	@Override
	public List<CommentVO> commentSelect(SearchVO vo) {
		return StoryDao.commentSelect(vo);
	}

	@Override
	public int commentCount(int bidx) {
		return StoryDao.commentCount(bidx);
	}

	@Override
	public int commentHeart(int bidx) {
		return StoryDao.commentHeart(bidx);
	}
	
	@Override
	public int commentWrite(CommentVO vo) {
		return StoryDao.commentWrite(vo);
	}
	
	@Override
	public int heartInsert(HeartVO vo) {
		return StoryDao.heartInsert(vo);
	}

	@Override
	public int heartDelete(HeartVO vo) {
		return StoryDao.heartDelete(vo);
	}

	@Override
	public int heartDup(HeartVO vo) {
		return StoryDao.heartDup(vo);
	}
	
}
