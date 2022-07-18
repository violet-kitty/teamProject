package edu.howf.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.howf.service.StayService;
import edu.howf.util.MediaUtils;
import edu.howf.vo.CommentVO;
import edu.howf.vo.PageMaker;
import edu.howf.vo.RoomVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.StayVO;
import edu.howf.vo.UserVO;

//숙박정보
@RequestMapping(value="/stay")
@Controller
public class StayController {
	@Autowired
	StayService stayService;
	
	@Autowired
	String uploadPath;
	
	@RequestMapping(value="/stayList.do")
	public String stayList(SearchVO vo, Model model) {
		//히어로
		
		//sort
		if(vo.getSortType()==null) vo.setSortType("star");
		
		//페이징
		int page = vo.getPage();
		int cnt = stayService.stayCountAll(vo);
		vo.setPerPageNum(9);
		
		PageMaker pm = new PageMaker();
		pm.setSearch(vo);
		pm.setTotalCount(cnt);
		
		List<StayVO> stay = stayService.staySelectAll(vo);
		vo.setPage(page);
		

		model.addAttribute("stay", stay);
		model.addAttribute("search", vo);
		model.addAttribute("pm", pm);
		
		
		return "stay/stayList";
	}
	
	@RequestMapping(value="/stayWrite.do", method=RequestMethod.GET)
	public String stayWrite() {
		return "stay/stayWrite";
	}
	
	@RequestMapping(value="/stayWrite.do", method=RequestMethod.POST)
	public String stayWrite(MultipartFile[] btnAtt, @RequestParam("roomFile")MultipartFile[] roomFile, StayVO vo, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		//파일 업로드
		File dir = new File(uploadPath);
				
		if(!dir.exists()) dir.mkdirs();
		
		StringBuilder photos = new StringBuilder("");
		
		//숙박시설의 이미지 받기
		if(btnAtt.length != 0) {
			for(MultipartFile f : btnAtt) {
				if(!f.getOriginalFilename().isEmpty()) {
					System.out.println("파일 저장 경로 : "+uploadPath);
					UUID uuid = UUID.randomUUID();
					String fileName = uuid.toString()+"_"+f.getOriginalFilename();
					f.transferTo(new File(uploadPath,fileName));
					
					photos.append(fileName+",");
				}
				else {
					System.out.println("업로드된 파일 없음");
				}
			}
			
			String photo = photos.toString();
			vo.setPhoto(photo.substring(0,photo.length()-1));
		}
		
		//방 이미지 받기
		if(roomFile.length != 0) {
			int i = 0;
			for(MultipartFile f : roomFile) {
				if(!f.getOriginalFilename().isEmpty()) {
					System.out.println("파일 저장 경로 : "+uploadPath);
					UUID uuid = UUID.randomUUID();
					String fileName = uuid.toString()+"_"+f.getOriginalFilename();
					f.transferTo(new File(uploadPath,fileName));
					vo.getRoom().get(i).setPhoto(fileName);
					
					i++;
				}
				else {
					System.out.println("업로드된 파일 없음");
				}
			}
		}
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		
		int result = stayService.stayInsert(vo);
		
		return "redirect:/stay/stayList.do";
	}
	
	@RequestMapping(value="/stayView.do")
	public String stayView(int sidx, SearchVO vo, Model model) {
		//숙박정보, 방 정보
		StayVO stay = stayService.staySelectOne(sidx);
		
		//리뷰
		//리뷰는 3개씩 보여줌
		vo.setPerPageNum(3);
		int page = vo.getPage();
		
		//리뷰 페이징
		//페이징
		int cnt = stayService.reviewCount(sidx);
				
		PageMaker pm = new PageMaker();
		pm.setSearch(vo);
		pm.setTotalCount(cnt);
		
		vo.setBidx(sidx);
		if(vo.getPage()==0) vo.setPage(1);
		List<CommentVO> review = stayService.reviewSelect(vo);
		vo.setPage(page);
		
		model.addAttribute("stay", stay);
		model.addAttribute("review", review);
		model.addAttribute("pm", pm);
		model.addAttribute("vo",vo);
		
		return "stay/stayView";
	}
	
	//리뷰쓰기
	@ResponseBody
	@RequestMapping(value="/reviewWrite.do")
	public int reviewWrite(CommentVO vo, MultipartFile file, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		//파일 업로드
		File dir = new File(uploadPath);
		if(!dir.exists()) dir.mkdirs();
		
		if(!file.getOriginalFilename().isEmpty()) {
			System.out.println("파일 저장 경로 : "+uploadPath);
			UUID uuid = UUID.randomUUID();
			String fileName = uuid.toString()+"_"+file.getOriginalFilename();
			file.transferTo(new File(uploadPath,fileName));
			vo.setPhoto(fileName);
		}
		else {
			System.out.println("업로드된 파일 없음");
		}
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		
		return stayService.reviewInsert(vo);
	}
	
	//리뷰 불러오기
	@ResponseBody
	@RequestMapping(value="/reviewSelect.do", produces = "application/json;charset=utf-8")
	public List<CommentVO> reviewSelect(SearchVO vo){
		vo.setPerPageNum(3);
		return stayService.reviewSelect(vo);
	}
	
	//리뷰 페이징
	@ResponseBody
	@RequestMapping(value="/reviewPaging.do", produces = "application/json;charset=utf-8")
	public PageMaker reviewPaging(SearchVO vo) {
		int cnt = stayService.reviewCount(vo.getBidx());
		vo.setPerPageNum(3);
		
		PageMaker pm = new PageMaker();
		pm.setSearch(vo);
		pm.setTotalCount(cnt);
		
		return pm;
	}
	
	//별점 변경
	@ResponseBody
	@RequestMapping(value="/stayStar.do")
	public float stayStar(int bidx) {
		return stayService.stayStar(bidx);
	}
	
	//수정 페이지 이동
	@RequestMapping(value="/stayModify.do", method=RequestMethod.GET)
	public String stayModify(int sidx, Model model) {
		
		
		return "stay/stayModify";
	}
	
	//숙박 정보 수정
	@RequestMapping(value="/stayModify.do", method=RequestMethod.POST)
	public String stayModify(StayVO vo) {
		
		
		
		return "redirect:/stay/stayView.do?sidx="+vo.getSidx();
	}
	
	//숙박 정보 삭제
	@ResponseBody
	@RequestMapping(value="/stayDelete.do")
	public int stayDelete(int sidx) {
		return 0;
	}
	
	//사진 보여주기 위한 코드
	@RequestMapping(value="/displayFile.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(@RequestParam("fileName") String fileName,@RequestParam(value="down",defaultValue="0" ) int down ) throws Exception{
			
		System.out.println("fileName:"+fileName);
			
		InputStream in = null;		
		ResponseEntity<byte[]> entity = null;
			
		try{
			//파일 타입 체크
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();		
				
			//bean에 주입한 물리경로 uploadPath
			in = new FileInputStream(uploadPath+fileName);
				
			//파일 확장자가 있다면
			if(mType != null){
					
				//만약 다운로드를 하고 싶다면 매개변수 down에 1을 넘겨줘서 호출하면 됨
				if (down==1) {
					fileName = fileName.substring(fileName.indexOf("_")+1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.add("Content-Disposition", "attachment; filename=\""+
							new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");	
						
				}else {
					//down에 1이 넘어오지 않았다면 사진 보여주기
					headers.setContentType(mType);
				}
					
			}else{//파일 확장자가 없다면
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
						new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");				
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
					headers,
					HttpStatus.CREATED);
				
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;
	}
}
