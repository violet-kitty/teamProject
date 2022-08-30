package edu.howf.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import edu.howf.service.NoticeService;
import edu.howf.util.MediaUtils;
import edu.howf.vo.Criteria;
import edu.howf.vo.NoticeVO;
import edu.howf.vo.PageMaker;
import edu.howf.vo.SearchVO;
import edu.howf.vo.UserVO;

//怨듭��궗�빆
@RequestMapping(value="/notice")
@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	String uploadPath;
	
	//경로
	@RequestMapping(value = "noticewrite.do", method = RequestMethod.GET)
	public String insertnotice() {
		
		return "notice/noticewrite";
	}
	
	//공지사항 등록
	@ResponseBody
	@RequestMapping(value = "noticewrite.do", method = RequestMethod.POST)
	public int insertnotice(MultipartFile fileupload, NoticeVO vo, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException {
		 
		session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("login");
		 
		vo.setMidx(login.getMidx());
		System.out.println("midx:"+vo.getMidx());
		 
		
		File dir = new File(uploadPath);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		if(fileupload!=null) {
			if(!fileupload.getOriginalFilename().isEmpty()) {
				System.out.println("된다!");
				UUID uuid = UUID.randomUUID();
				String filename = uuid.toString()+"_"+fileupload.getOriginalFilename();
				fileupload.transferTo(new File(uploadPath,filename));
				vo.setFilename(filename);
			}else {
				System.out.println("하하하하하하");
			}
		}
		
		int result = noticeService.insertnotice(vo);
		
		return result;
	}

	//공지사항 리스트
	@RequestMapping(value = "notice.do")
	public String list(Model model, SearchVO searchVO, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
		
		int page = searchVO.getPage();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setSearch(searchVO);
		pageMaker.setTotalCount(noticeService.pagecount(searchVO));
		
		List<NoticeVO> list = noticeService.list(searchVO);
		searchVO.setPage(page);
		
		model.addAttribute("list",list);
		model.addAttribute("searchVO",searchVO);
		model.addAttribute("pageMaker",pageMaker);
		
		return "notice/notice";
	}
	
	//공지사항 상세보기
	@RequestMapping(value = "noticeone.do", method = RequestMethod.GET)
	public String selectone(HttpServletRequest request, HttpServletResponse response, int nbidx, Model model) {
		//쿠키생성
		Cookie[] cookies = request.getCookies();
		int viewer = 0;
		
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("viewer")) {
				viewer = 1;
				
				if(cookie.getValue().contains(request.getParameter("nbidx"))) {
					
				}else {
					cookie.setValue(cookie.getValue() + "/" + request.getParameter("nbidx"));
					response.addCookie(cookie);
					int result = noticeService.noticecnt(nbidx);
				}
			}
		}
		if (viewer == 0) {
			Cookie newcookie = new Cookie("viewer", request.getParameter("nbidx"));
			response.addCookie(newcookie);
			
			int result = noticeService.noticecnt(nbidx);
		}
			
		NoticeVO vo = noticeService.selectone(nbidx);
		model.addAttribute("vo",vo);
		
		return "notice/noticeone";
	}
	
	public String filedown(HttpServletResponse response)  {
		String path = "";
		return "notice/noticeone";
	}
	
	//수정 경로
	@RequestMapping(value = "noticemodify.do", method = RequestMethod.GET)
	public String noticemodify(Model model,int nbidx ) {
		NoticeVO vo = noticeService.selectone(nbidx);
		model.addAttribute("vo",vo);
		
		return "notice/noticemodify";
	}
	//수정하기
	@ResponseBody
	@RequestMapping(value = "noticemodify.do", method = RequestMethod.POST)
	public String noticemodify(MultipartFile fileupload, NoticeVO vo,HttpServletResponse response, HttpServletRequest request ,HttpSession session) throws IOException {
		
		System.out.println(vo.getNbidx());
		
		
		session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("login");
		
		
		File dir = new File(uploadPath);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		if(fileupload!=null) {
			if(!fileupload.getOriginalFilename().isEmpty()) {
				System.out.println("되는걸까?");
				UUID uuid = UUID.randomUUID();
				String filename = uuid.toString()+"_"+fileupload.getOriginalFilename();
				fileupload.transferTo(new File(uploadPath,filename));
				vo.setFilename(filename);
			}else {
				System.out.println("하하하하하하");
			}
		}
		int result = noticeService.noticemodify(vo);
		
		return "redirect:/notice/noticeone.do?nbidx="+vo.getNbidx();
			
	}
	//제거하기
	@ResponseBody
	@RequestMapping(value = "noticedelete.do", method = RequestMethod.GET)
	public String noticedelete(int nbidx) throws Exception {
		
		//noticeService.noticedelete(nbidx);
		
		int result = noticeService.noticedelete(nbidx);
		
		return "redirect:/notice/notice.do";
	}
	
	//파일
	@RequestMapping(value="/displayFile.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(@RequestParam("filename") String filename,@RequestParam(value="down",defaultValue="0" ) int down ) throws Exception{
		
		System.out.println("fileName:"+filename);
		
		InputStream in = null;		
		ResponseEntity<byte[]> entity = null;
		
		try{
			String formatName = filename.substring(filename.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();		
			 
			in = new FileInputStream(uploadPath+filename);
			
			
			if(mType != null){
				
				if (down==1) {
					filename = filename.substring(filename.indexOf("_")+1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.add("Content-Disposition", "attachment; filename=\""+
							new String(filename.getBytes("UTF-8"),"ISO-8859-1")+"\"");
					
				}else {
					headers.setContentType(mType);	
				}
				
			}else{
				
				filename = filename.substring(filename.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
						new String(filename.getBytes("UTF-8"),"ISO-8859-1")+"\"");				
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
	
	@RequestMapping(value = "chattingview.do" ,method = RequestMethod.GET)
	public String echo(){
		
		return "notice/chattingview";
	}

	//웹 소켓 이용 채팅
		
	@GetMapping("/echo")
	public void chattingview(Model model) {
		
		NoticeVO user = (NoticeVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		  
		model.addAttribute("user", user.getNickname());
		 }

/*		
		Cookie cookies[] = request.getCookies();
		Map<String, String> mapCookie = new HashMap<String, String>();
		if(request.getCookies() != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie obj = cookies[i];
				mapCookie.put(obj.getName(), obj.getValue());
			}
			System.out.println(mapCookie);
		}
		//쿠키중 cnt만 불러오기
		String cookie_cnt = (String) mapCookie.get("cnt");
		//저장될 새로운 쿠키
		String new_cookie_cnt = "/" +nbidx;
		//저장된 쿠키에 새로운 쿠키값이 존재하는 지 검사
		if (StringUtils.indexOfIgnoreCase(cookie_cnt, new_cookie_cnt) == -1) {
			//없을 경우 쿠키 생성
			Cookie cookie = new Cookie("cnt", cookie_cnt + new_cookie_cnt);
			//cookie.setMaxAge(1000);//초단위
			response.addCookie(cookie);
			//조회수 업데이트
			this.noticeService.noticecnt(nbidx);
			System.out.println(cookie_cnt);
		}
		int result = this.noticeService.noticecnt(nbidx);
		model.addAttribute(nbidx);
*/
/*		
		NoticeVO nv = noticeService.noticecnt(nbidx);
		ModelAndView view = new ModelAndView();
		
		Cookie[] cookies = request.getCookies();
		
		Cookie cntCookie = null;
		
		if (cookies != null && cookies.length > 0) {
			for (int i =0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("cookie"+nbidx)) {
					System.out.println("쿠키 들어옴");
					cntCookie = cookies[i];
				}
			}
		}
		if (nv != null) {
			view.addObject("nv",nv);
			if (cntCookie ==null) {
				Cookie newCookie = new Cookie("cookie"+nbidx,"|"+nbidx+"|");
				
				response.addCookie(newCookie);
				
				int result = noticeService.noticecnt(nbidx);
				
				if(result>0) {
					System.out.println("증가");
				}else {
					System.out.println("에러");
				}
			}
			else {
				System.out.println("쿠키 잇어");
				String value = cntCookie.getValue();
				System.out.println("cookie"+value);
			}
			view.setViewName("noticeone");
			return view;
		}
		else {
			view.setViewName("notice");
			return view;
		}

	
*/
	}

