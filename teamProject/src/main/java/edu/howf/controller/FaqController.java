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
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import edu.howf.service.FaqService;
import edu.howf.vo.FaqVO;
import edu.howf.vo.PageMaker;
import edu.howf.vo.SearchVO;
import edu.howf.vo.UserVO;

@Controller
@EnableAspectJAutoProxy
public class FaqController {
	
	@Autowired
	FaqService faqService;
	
	@RequestMapping(value = "/notice/faqwrite.do", method = RequestMethod.GET)
	public String insertfaq() {
		
		return "notice/faqwrite";
	}
	
	//faq 작성
	@RequestMapping(value = "/notice/faqwrite.do", method = RequestMethod.POST)
	public void insertfaq(FaqVO vo, HttpServletRequest request ,HttpServletResponse response ,HttpSession session) throws IOException {
		session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("login");
		 
		vo.setMidx(login.getMidx());
		System.out.println("midx:"+vo.getMidx());
		
		int result = faqService.insertfaq(vo);
		 
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

	//faq 수정
	@ResponseBody
	@RequestMapping(value = "/notice/faqmodify.do" ,method = RequestMethod.POST)
	public int faqmodify(String fbidx, String title, String content, HttpServletResponse response, HttpServletRequest request ,HttpSession session) throws IOException {
		
		session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("login");
		
		FaqVO vo = new FaqVO();
		vo.setFbidx(Integer.parseInt(fbidx));
		vo.setTitle(title);
		vo.setContent(content);
		
		System.out.println("title:"+vo.getTitle());
		System.out.println("content:"+vo.getContent());

		
		int result = faqService.faqmodify(vo);
		
		
		return result;
	}
	
	//faq 삭제
	@ResponseBody
	@RequestMapping(value = "/notice/delfaq.do" , method = RequestMethod.GET)
	public String delfaq(int fbidx){
		
		System.out.println("삭제전 좀가져와라 답답하다 너 진짜");
		int result = faqService.delfaq(fbidx);
		System.out.println("삭제후");
		
		return "redirect:/notice/faqboard.do";
	}
	
	//리스트
	@RequestMapping(value = "/notice/faqboard.do" ,method = {RequestMethod.GET ,RequestMethod.POST})
	public String list(SearchVO searchVO , Model model, HttpServletRequest request ,HttpSession session) throws IOException {
		session = request.getSession();
		int page = searchVO.getPage();
		
		searchVO.setPerPageNum(5);
		

		PageMaker pageMaker = new PageMaker();
		pageMaker.setSearch(searchVO);

		pageMaker.setTotalCount(faqService.pagecount(searchVO));
		
		List<FaqVO> list = faqService.list(searchVO);
		searchVO.setPage(page);
		
		model.addAttribute("list",list);
		model.addAttribute("searchVO",searchVO);
		model.addAttribute("pageMaker",pageMaker);


		return "notice/faqboard";
	}


}
