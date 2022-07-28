package edu.howf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.StayDao;
import edu.howf.vo.CommentVO;
import edu.howf.vo.ResVO;
import edu.howf.vo.RoomVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.StayVO;

@Service
public class StayServiceImple implements StayService{
	@Autowired
	StayDao stayDao;

	@Override
	public List<StayVO> staySelectAll(SearchVO vo) {
		return stayDao.staySelectAll(vo);
	}

	@Override
	public int stayCountAll(SearchVO vo) {
		return stayDao.stayCoountAll(vo);
	}
	
	@Override
	public StayVO staySelectOne(ResVO vo) {
		//숙박시설 정보 가져오기
		StayVO stay = stayDao.staySelectOne(vo.getSidx());
		
		//방 정보 가져오기
		List<RoomVO> room = stayDao.roomSelect(vo.getSidx());
		stay.setRoom(room);
		//cnt 가져오기
		for(RoomVO r : room) {
			vo.setName(r.getName());
			r.setCnt(stayDao.roomCnt(vo));
		}
		
		return stay;
	}
	
	@Override
	public List<CommentVO> reviewSelect(SearchVO vo) {
		return stayDao.reviewSelect(vo);
	}
	
	@Override
	public int reviewCount(int bidx) {
		return stayDao.reviewCount(bidx);
	}

	@Override
	public int stayInsert(StayVO vo) {
		/* 숙박시설 등록 */
		//content 이어붙이기
		StringBuilder contents = new StringBuilder("");
		for(int i=0;i<vo.getContent().size();i++) {
			vo.getContent().get(i).replaceAll("\n", "<br>");
			contents.append(vo.getContent().get(i)+",");
		}
		String content = contents.toString();
		vo.setContents(content.substring(0,content.length()-1));
		
		//service 이어붙이기
		StringBuilder services = new StringBuilder("");
		for(int i=0;i<vo.getService().size();i++) {
			services.append(vo.getService().get(i)+",");
		}
		String service = services.toString();
		vo.setServices(service.substring(0,service.length()-1));
		
		//등록
		int result = stayDao.stayInsert(vo);
		
		//숙박시설이 제대로 등록 되었다면
		if(result != 0) {
			/* 방 등록 */
			if(vo.getRoom() != null) {//등록할 방이 있다면
				for(RoomVO r : vo.getRoom()) {
					//sidx 넣기
					r.setSidx(vo.getSidx());
					
					//tag 이어붙이기
					StringBuilder tags = new StringBuilder("");
					for(int i=0;i<r.getTag().size();i++) {
						tags.append(r.getTag().get(i)+",");
					}
					String tag = tags.toString();
					r.setTags(tag.substring(0,tag.length()-1));
					
					for(int i=0;i<r.getCnt();i++) {
						result = stayDao.roomInsert(r);
					}
				}
			}
		}
		
		return result;
	}

	@Override
	public int reviewInsert(CommentVO vo) {
		return stayDao.reviewInsert(vo);
	}

	@Override
	public float stayStar(int bidx) {
		return stayDao.stayStar(bidx);
	}

	@Override
	public int stayModify(StayVO vo) {
		/* 숙박시설 등록 */
		//content 이어붙이기
		StringBuilder contents = new StringBuilder("");
		for(int i=0;i<vo.getContent().size();i++) {
			vo.getContent().get(i).replaceAll("\n", "<br>");
			contents.append(vo.getContent().get(i)+",");
		}
		String content = contents.toString();
		vo.setContents(content.substring(0,content.length()-1));
		
		//service 이어붙이기
		StringBuilder services = new StringBuilder("");
		for(int i=0;i<vo.getService().size();i++) {
			services.append(vo.getService().get(i)+",");
		}
		String service = services.toString();
		vo.setServices(service.substring(0,service.length()-1));
		
		//등록
		int result = stayDao.stayModify(vo);
		
		if(result == 1) {
			stayDao.roomDelete(vo.getSidx());
			if(vo.getRoom() != null) {//등록할 방이 있다면
				for(RoomVO r : vo.getRoom()) {
					//sidx 넣기
					r.setSidx(vo.getSidx());
					
					//tag 이어붙이기
					StringBuilder tags = new StringBuilder("");
					for(int i=0;i<r.getTag().size();i++) {
						tags.append(r.getTag().get(i)+",");
					}
					String tag = tags.toString();
					r.setTags(tag.substring(0,tag.length()-1));
					
					for(int i=0;i<r.getCnt();i++) {
						result = stayDao.roomInsert(r);
					}
				}
			}
		}
		return result;
	}

	@Override
	public int reviewModify(CommentVO vo) {
		return stayDao.revieweModify(vo);
	}

	@Override
	public int stayDelete(int sidx) {
		return stayDao.stayDelete(sidx);
	}

	@Override
	public int reviewDelete(int cbidx) {
		return stayDao.reviewDelete(cbidx);
	}

	@Override
	public CommentVO reviewSelectOne(int cbidx) {
		return stayDao.reviewSelectOne(cbidx);
	}

	@Override
	public int reviewDup(CommentVO vo) {
		return stayDao.reviewDup(vo);
	}
	
	
	//예약
	

	@Override
	public int roomRidx(ResVO vo) {
		return stayDao.roomRidx(vo);
	}

	@Override
	public int resInsert(ResVO vo) {
		return stayDao.resInsert(vo);
	}

	@Override
	public int resPay(String merchant) {
		return stayDao.resPay(merchant);
	}

	@Override
	public int resDelete(int reidx) {
		return stayDao.resDelete(reidx);
	}

	@Override
	public List<ResVO> resSelectAll(int midx) {
		return stayDao.resSelectAll(midx);
	}

	@Override
	public int resInsertB(ResVO vo) {
		return stayDao.resInsert(vo);
	}

	@Override
	public int resDeleteB(int reidx) {
		return stayDao.resDeleteB(reidx);
	}

	@Override
	public List<ResVO> resSelectAllB(ResVO vo) {
		return stayDao.resSelectAllB(vo);
	}
	
	
}
