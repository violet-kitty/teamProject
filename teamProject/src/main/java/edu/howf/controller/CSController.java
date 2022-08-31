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

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.howf.service.CSService;
import edu.howf.util.MediaUtils;
import edu.howf.vo.CSVO;
import edu.howf.vo.PageMaker;
import edu.howf.vo.SearchVO;
import edu.howf.vo.UserVO;

//1:1문의, FAQ
@RequestMapping(value = "/CSboard")
@Controller
public class CSController {

	@Autowired
	CSService csService;

	@Autowired
	String uploadPath;

	@RequestMapping(value = "/CS_list.do", method = RequestMethod.GET)
	public String csList(Model model, SearchVO vo, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("login");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");

		if (login == null) {
			
			out.append("<script>alert('로그인이 필요합니다.'); location.href='../user/login.do';</script>");
			out.flush();
			
			return "redirect:/user/login.do";
			
		} else {
			if (vo.getPage() < 1)
				vo.setPage(1);
			int page = vo.getPage();
			vo.setMidx(login.getMidx());
			List<CSVO> cv = csService.CSList(vo, request, session);
			
			//답변 여부
			for(CSVO c : cv) {
				c.setAnswer(csService.csReply_check(c.getCsbidx()));
			}

			model.addAttribute("login", login);
			model.addAttribute("cv", cv);

			int cnt = csService.countPage(vo, login.getRole());

			PageMaker pm = new PageMaker();
			vo.setPage(page);
			pm.setSearch(vo);
			pm.setTotalCount(cnt);

			model.addAttribute("pm", pm);
			
			

			return "CSboard/CS_list";
		}

	}

	@RequestMapping(value = "/CS_write.do", method = RequestMethod.GET)
	public String cs_write() {

		return "CSboard/CS_write";
	}

	@RequestMapping(value = "/CS_write.do")
	public String cs_write(CSVO vo, HttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {
		 
		 session = request.getSession();
		 UserVO uv = (UserVO) session.getAttribute("login");
		 vo.setMidx(uv.getMidx());		 
		 
		 int result = csService.CS_write(vo);
		 

		return "redirect:/CSboard/CS_list.do";
	}
	

	@RequestMapping(value = "/CS_view.do", method = RequestMethod.GET)
	public String csListView(int csbidx, int origincsbidx, HttpServletRequest request, HttpServletResponse response, Model model) {
		
		Cookie[] cookies = request.getCookies();
		int visitor = 0;
				
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("visit")) {
				visitor = 1;

				if(cookie.getValue().contains(request.getParameter("csbidx"))) {
				}
				else {
					cookie.setValue(cookie.getValue() + "_" + request.getParameter("csbidx"));
					response.addCookie(cookie);
					int result = csService.csList_cnt(csbidx);
				}
			}
		}
		if(visitor == 0) {
			Cookie cookie1 = new Cookie("visit", request.getParameter("csbidx"));
			response.addCookie(cookie1);
			
			int result = csService.csList_cnt(csbidx);
		}
		
		CSVO cv = csService.csList_view(csbidx);

		CSVO cvr = csService.csList_reply_view(origincsbidx);
		
		model.addAttribute("cv", cv);
		model.addAttribute("cvr", cvr);

		return "CSboard/CS_view";
	}


	@RequestMapping(value = "/CS_modify.do", method = RequestMethod.GET)
	public String csListModify(int csbidx, Model model) {

		CSVO cv = csService.csList_view(csbidx);

		model.addAttribute("cv", cv);

		return "CSboard/CS_modify";
	}

	@RequestMapping(value = "/CS_modify.do", method = RequestMethod.POST)
	public String csListModify(CSVO vo, HttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		session = request.getSession();
		UserVO uv = (UserVO) session.getAttribute("login");
		vo.setMidx(uv.getMidx());
		
		int result = csService.csList_modify(vo);

		return "redirect:/CSboard/CS_view.do?csbidx=" + vo.getCsbidx() + "&origincsbidx=" + vo.getOrigincsbidx();
	}

	@RequestMapping(value = "/CS_delete.do", method = RequestMethod.GET)
	public String csListDelete(int origincsbidx) {

		int result = csService.csList_delete(origincsbidx);

		return "redirect:/CSboard/CS_list.do";
	}

	@RequestMapping(value = "/CS_replyWrite.do", method = RequestMethod.GET)
	public String csReply_write(int csbidx, Model model, CSVO vo, HttpServletRequest request, HttpSession session) {

		session = request.getSession();

		UserVO login = (UserVO) session.getAttribute("login");

		vo.setMidx(login.getMidx());
		

		CSVO cv = csService.csList_view(csbidx);

		model.addAttribute("login", login);
		model.addAttribute("cv", cv);

		return "CSboard/CS_replyWrite";
	}

	@RequestMapping(value = "/CS_replyWrite.do", method = RequestMethod.POST)
	public String csReply_write(CSVO vo, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");

		vo.setMidx(login.getMidx());
		int result = csService.csReply_write(vo);

		return "redirect:/CSboard/CS_view.do?csbidx=" + vo.getOrigincsbidx() + "&origincsbidx=" + vo.getOrigincsbidx();
	}
	@RequestMapping(value = "/CS_replyModify.do", method = RequestMethod.GET)
	public String csReply_modify(int csbidx, Model model) {

		CSVO cv = csService.csList_view(csbidx);

		model.addAttribute("cv", cv);

		return "CSboard/CS_replyModify";
	}

	@RequestMapping(value = "/CS_replyModify.do", method = RequestMethod.POST)
	public String csReply_modify(CSVO vo) {

		int result = csService.csReply_modify(vo);

		return "redirect:/CSboard/CS_view.do?csbidx=" + vo.getOrigincsbidx() + "&origincsbidx=" + vo.getOrigincsbidx();
	}

	@RequestMapping(value = "/CS_replyDelete.do")
	public String csReply_delete(CSVO vo) {

		int result = csService.csReply_delete(vo);

		return "redirect:/CSboard/CS_view.do?csbidx=" + vo.getOrigincsbidx() + "&origincsbidx=" + vo.getOrigincsbidx();
	}
	
	@RequestMapping(value="/displayFile.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(@RequestParam("fileName") String fileName, @RequestParam(value="down", defaultValue="0" ) int down ) throws Exception{
		
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
