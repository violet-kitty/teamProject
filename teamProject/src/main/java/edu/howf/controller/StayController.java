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
import org.springframework.web.multipart.MultipartFile;

import edu.howf.service.StayService;
import edu.howf.util.MediaUtils;
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
		if(vo.getSortType()==null) vo.setSortType("star");
		
		List<StayVO> stay = stayService.staySelectAll(vo);
		
		if(stay != null) {
			model.addAttribute("stay", stay);
		}
		
		
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
	public String stayView(int sidx, Model model) {
		
		
		
		return "stay/stayView";
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
