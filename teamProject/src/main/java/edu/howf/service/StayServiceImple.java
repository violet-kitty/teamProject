package edu.howf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.StayDao;
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
	public int stayInsert(StayVO vo) {
		/* 숙박시설 등록 */
		//content 이어붙이기
		StringBuilder contents = new StringBuilder("");
		for(int i=0;i<vo.getContent().size();i++) {
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
					
					//bed 이어 붙이기
					String bed = "sbed,"+r.getSbed()+",dbed,"+r.getDbed()+",qbed,"+r.getQbed()+",kbed,"+r.getKbed();
					r.setBed(bed);
					
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
}
