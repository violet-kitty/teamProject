package edu.howf.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import edu.howf.service.NoticeService;
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
	
	//경로
	@RequestMapping(value = "noticewrite.do", method = RequestMethod.GET)
	public String insertnotice() {
		
		return "notice/noticewrite";
	}
	//공지사항 등록
	@RequestMapping(value = "noticewrite.do", method = RequestMethod.POST)
	public void insertnotice(MultipartFile fileupload,NoticeVO vo,HttpServletResponse response,HttpServletRequest request, HttpSession session) throws IOException {
		 
		session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("login");
		 
		vo.setMidx(login.getMidx());
		System.out.println("midx:"+vo.getMidx());
		
		String path = request.getSession().getServletContext().getRealPath("/resources/image");
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		if(fileupload!=null) {
			if(!fileupload.getOriginalFilename().isEmpty()) {
				System.out.println("된다!");
				fileupload.transferTo(new File(path,fileupload.getOriginalFilename()));
				vo.setFilename(fileupload.getOriginalFilename());
			}else {
				System.out.println("하하하하하하");
			}
		}
		
		int result = noticeService.insertnotice(vo);
		 
		 response.setContentType("text/html;charset=utf-8");
		 PrintWriter pw = response.getWriter();
		 
		 if(result <= 0) {
				//성공 실패 여부
				
				pw.append("<script>alert('등록 불가');location.href='notice.do';</script>");
				pw.flush();
				pw.close();
			}else {
				
				pw.append("<script>alert('등록 완료 ');location.href='notice.do';</script>");
				pw.flush();
				pw.close();
			}
	}
	//공지사항 리스트
	@RequestMapping(value = "notice.do")
	public String list(Model model ,SearchVO searchVO ,  HttpServletRequest request ,HttpSession session ,HttpServletResponse response) throws IOException {
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
	@RequestMapping(value = "noticeone.do")
	public String selectone(Model model,int nbidx) {
		
		NoticeVO vo = noticeService.selectone(nbidx);
		model.addAttribute("vo",vo);
		
		return "notice/noticeone";
	}
	//수정 경로
	@RequestMapping(value = "noticemodify.do", method = RequestMethod.GET)
	public String noticemodify(Model model,NoticeVO vo) {
		model.addAttribute("vo",vo);
		return "notice/noticemodify";
	}
	//수정하기
	@RequestMapping(value = "noticemodify.do", method = RequestMethod.POST)
	public String noticemodify(NoticeVO vo) throws IOException {
		System.out.println(vo.getNbidx());
		int result = noticeService.noticemodify(vo);
		
		return "redirect:/notice/noticeone.do?nbidx="+vo.getNbidx();
			
	}
	//널 제거한다모
	@RequestMapping(value = "noticedelete.do", method = RequestMethod.GET)
	public String noticedelete(int nbidx) throws Exception {
		
		noticeService.noticedelete(nbidx);
		
		return "redirect:/notice/notice.do";
	}
	
	/*
	 * @RequestMapping(value = "fileupload.do", method = RequestMethod.POST) public
	 * String upload (MultipartFile fileupload,NoticeVO vo, HttpServletRequest
	 * request) throws IllegalStateException, IOException {
	 * 
	 * String path =
	 * request.getSession().getServletContext().getRealPath("/resources/image");
	 * System.out.println("fileupload:"+fileupload); File dir = new File(path);
	 * if(!dir.exists()) { dir.mkdirs(); }
	 * if(!fileupload.getOriginalFilename().isEmpty()) { fileupload.transferTo(new
	 * File(path,fileupload.getOriginalFilename()));
	 * 
	 * vo.setFilename(filename); noticeService.insertnotice(vo); }else {
	 * System.out.println("하하하하하하"); }
	 * 
	 * return "redirect:/notice/noticewrite.do"; }
	 */
}
