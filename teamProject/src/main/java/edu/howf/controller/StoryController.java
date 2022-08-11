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

import edu.howf.service.StoryService;
import edu.howf.util.MediaUtils;
import edu.howf.vo.HeartVO;
import edu.howf.vo.PageMaker;
import edu.howf.vo.SearchVO;
import edu.howf.vo.StoryVO;
import edu.howf.vo.UserVO;

//여행이야기
@RequestMapping(value="/story")
@Controller
public class StoryController {
	@Autowired
	StoryService storyService; // 지정할 typer과 변수이름
	
	@Autowired
	String uploadPath;
	
	/* 리스트 1. 여행이야기 리스트 */
	@RequestMapping(value="/storyList.do") // "/가상경로이름.do"
	public String storyList(SearchVO vo, Model model) {
		
		// 리스트 2. Mapper를 작성 후 DAO에서 사용
		// 리스트 3. DAO를 Service에서 사용
		// 리스트 4. Service에서 메소드 만들기 (설계도) - interface
		// 리스트 5. ServiceImple 만들기 (구현) - implemets
		/* 그냥 일반클래스 상속은 extends 인터페이스상속은 impletents */
		
		// sort 1 : 방식
				if(vo.getSortType()==null) {
					vo.setSortType("new");
				}
		
		// 페이징 1 : jsp 파일에 페이징공간 만들기
		// 페이징 2 : 페이징할 리스트 갯수 가져오기
		int page = vo.getPage(); //정보저장
		int cnt = storyService.storyCountAll(vo);
		vo.setPerPageNum(9);
		
		// 페이징 3 : 페이징 클래스 가져오기 
		PageMaker pm = new PageMaker();
		pm.setSearch(vo); // search vo 넘겨주기
		pm.setTotalCount(cnt); // 페이징할 데이타 전체 갯수 넘겨주기  
		
		// 리스트 6. DB 내용 불러오기
		List<StoryVO>storyVar = storyService.storySelectAll(vo); // Mapper- DAO - Service 를 거쳐 DB에서 내용 받아옴
		// 페이징 4 : 페이징 클래스 가져오기 
		vo.setPage(page);
		
		// 리스트 7. 화면에서 사용할 변수명 정해주기
		model.addAttribute("story", storyVar); // "화면에서 보여주는 이름" , 변수
		model.addAttribute("search", vo); /* 검색어 */
		// 페이징 5 : 페이징 클래스 가져오기 
		model.addAttribute("pm", pm); /* 페이징 */
		
		// 리스트 1. 리턴 경로 : 물리경로 "폴더/파일이름"
		return "story/storyList";
	}
	
	/* 글작성 1. 여행이야기 글작성 */
	// 글작성 1. 경로설정 
	@RequestMapping(value="/storyWrite.do", method=RequestMethod.GET)
	public String storyWrite() {
		return "story/storyWrite";
	}
	// 글작성 2. 
	@RequestMapping(value="/storyWrite.do", method=RequestMethod.POST)
	public String storyWrite(MultipartFile file, StoryVO vo, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		
		// 글작성 6. 파일 업로드
		File dir = new File(uploadPath);
		if(!dir.exists()) dir.mkdirs(); //폴더가 없으면 폴더생성
		if(!file.getOriginalFilename().isEmpty()) {
			System.out.println("파일 저장 경로 : "+uploadPath); //확인용 콘솔에 찍히는부분
			UUID uuid = UUID.randomUUID(); //랜덤 이름
			String fileName = uuid.toString()+"_"+file.getOriginalFilename(); //파일이름이 된다
			file.transferTo(new File(uploadPath,fileName)); // 경로에 파일 저장
			vo.setFilename(fileName); //vo에 이름담아주기
		}
		else {
			System.out.println("업로드된 파일 없음");
		}
		
		// 글작성 4. 로그인 회원 정보 가져오기
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		
		// 글작성 5. 작성 데이터 DB에 넣기
		int result = storyService.storyWrite(vo);
		
		// 글작성 3. 리턴 리다이렉트 
		return "redirect:/story/storyView.do?sbidx="+vo.getSbidx();
	}
	
	
	/* 글뷰 1. 여행이야기 뷰 */
	@RequestMapping(value="/storyView.do")
	public String storyView(int sbidx, Model model, HttpServletRequest request, HttpSession session) {
		
		// 글뷰 3.  DB 내용 불러오기
	    StoryVO storyVar = storyService.storyView(sbidx); // Mapper- DAO - Service 를 거쳐 DB에서 내용 받아옴
		
	    // 글뷰 4. 로그인 회원 정보 가져오기
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		// 글뷰 5. 만약 로그인 된 상태라면 찜한 여부 가져오기
		if(login != null) {
			HeartVO heart = new HeartVO();
			heart.setMidx(login.getMidx());
			heart.setBidx(storyVar.getSbidx());
			heart.setType("story");
			int result = storyService.heartDup(heart);
			model.addAttribute("heart", result);
		}
		
		// 글뷰 6. 화면에서 사용할 변수명 정해주기
		model.addAttribute("story", storyVar); // "화면에서 보여주는 이름" , 변수
		
		// 글뷰 2. 리턴 뷰
		return "story/storyView";
	}
	
	
	/* 글수정 1. 여행이야기 수정 */
	@RequestMapping(value="/storyModify.do", method=RequestMethod.GET)
	public String storyModify(int sbidx, Model model) {
		
		// 글수정 3. DB 내용 불러오기
		StoryVO vo = storyService.storyView(sbidx); // Mapper- DAO - Service 를 거쳐 DB에서 내용 받아옴
		
		// 글수정 4. 화면에서 사용할 변수명 정해주기
		model.addAttribute("story", vo); // "화면에서 보여주는 이름" , 변수
		
		// 글수정 2. 리턴 수정
		return "story/storyModify";
	}
	// 글수정 5. 포스트 경로 설정
	@RequestMapping(value="/storyModify.do", method=RequestMethod.POST)
	public String storyModify(MultipartFile file, StoryVO vo) throws IllegalStateException, IOException {
		// 글수정 7. 파일 수정 업로드 
		if(!file.isEmpty()) {
			File dir = new File(uploadPath);
			if(!dir.exists()) dir.mkdirs();//폴더가 없으면 폴더생성
			if(!file.getOriginalFilename().isEmpty()) {
				System.out.println("파일 저장 경로 : "+uploadPath); //확인용 콘솔에 찍히는부분
				UUID uuid = UUID.randomUUID(); //랜덤 이름
				String fileName = uuid.toString()+"_"+file.getOriginalFilename(); //파일이름이 된다
				file.transferTo(new File(uploadPath,fileName)); // 경로에 파일 저장
				vo.setFilename(fileName); //vo에 이름담아주기
			}
			else {
				System.out.println("업로드된 파일 없음");
			}
		}
		// 글수정 8. 수정 데이터 DB에 업데이트
		int result = storyService.storyModify(vo);
		System.out.println("수정 : "+result);
		
		// 글수정 6. 리턴 리다이렉트 
		return "redirect:/story/storyView.do?sbidx="+vo.getSbidx();
	}
	
	/* 글삭제 1. 여행이야기 삭제 */
	@ResponseBody
	@RequestMapping(value="/storyDelete.do")
	public int storyDelete(int sbidx) {
		return storyService.storyDelete(sbidx);
	}
	
	/* 좋아요 추가 */
	@ResponseBody
	@RequestMapping(value = "/heartInsert.do")
	public int heartInsert(HeartVO vo, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("login");
		vo.setMidx(login.getMidx());

		return storyService.heartInsert(vo);
	}

	/* 좋아요 삭제 */
	@ResponseBody
	@RequestMapping(value = "/heartDelete.do")
	public int heartDelete(HeartVO vo, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("login");
		vo.setMidx(login.getMidx());

		return storyService.heartDelete(vo);
	}
	

	
	//모든 사진, 이미지 보여주기 위한 코드 (이미지를 가져오는 코드 tomcat서포터)
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
