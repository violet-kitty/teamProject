package edu.howf.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.howf.service.NoticeService;
import edu.howf.vo.NoticeVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.UserVO;

//怨듭��궗�빆
@RequestMapping(value="/notice")
@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	
	@RequestMapping(value = "noticewrite.do", method = RequestMethod.GET)
	public String insertnotice() {
		
		return "notice/noticewrite";
	}
	
	@RequestMapping(value = "noticewrite.do", method = RequestMethod.POST)
	public void insertnotice(NoticeVO vo,HttpServletResponse response,HttpServletRequest request, HttpSession session) throws IOException {
		 
		session = request.getSession();
		 
		 UserVO login = (UserVO) session.getAttribute("login");
		 
		 vo.setMidx(login.getMidx());
		 System.out.println("midx:"+vo.getMidx());
		 
		 int result = noticeService.insertnotice(vo);
		 
		 response.setContentType("text/html;charset=utf-8");
		 PrintWriter pw = response.getWriter();
		 
		 if(result <= 0) {
				//성공 실패 여부
				System.out.println("99");
				pw.append("<script>alert('등록 불가');location.href='notice.do';</script>");
				pw.flush();
				pw.close();
			}else {
				System.out.println("99");
				pw.append("<script>alert('등록 완료 ');location.href='notice.do';</script>");
				pw.flush();
				pw.close();
			}
	}
	
	@RequestMapping(value = "notice.do")
	public String list(Model model,SearchVO searchVO) {
		
		List<NoticeVO> list = noticeService.list(searchVO);
		
		model.addAttribute("list",list);
		model.addAttribute("searchVO",searchVO);
		
		return "notice/notice";
	}
	
	@RequestMapping(value = "noticeone.do")
	public String selectone(Model model,int nbidx) {
		
		NoticeVO vo = noticeService.selectone(nbidx);
		model.addAttribute("vo",vo);
		
		return "notice/noticeone";
	}
	
}
