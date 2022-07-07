package edu.howf.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.howf.service.CSService;
import edu.howf.vo.CSVO;
import edu.howf.vo.PageMaker;
import edu.howf.vo.SearchVO;
import edu.howf.vo.UserVO;

//1:1문의, FAQ
@RequestMapping(value="/csBoard")
@Controller
public class CSController {
	
	@Autowired
	CSService csService;
	
	@RequestMapping(value = "csList.do", method = RequestMethod.GET)
	public String csList(Model model, SearchVO vo, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		if(login == null) {
			return "redirect:/user/login.do";
		}
		else {
			if(vo.getPage()<1) vo.setPage(1);
			int page = vo.getPage();
			vo.setMidx(login.getMidx());
			List<CSVO> cv = csService.CSList(vo, request, session);
			
			model.addAttribute("login", login);
			model.addAttribute("cv", cv);
			
			int cnt = csService.countPage(vo, login.getRole());
			
			
			PageMaker pm = new PageMaker();
			vo.setPage(page);
			pm.setSearch(vo);
			pm.setTotalCount(cnt);	
			
			model.addAttribute("pm", pm);
			
			
			return "csBoard/csList";
		}
		
	}
	
	@RequestMapping(value = "cs_write.do", method = RequestMethod.GET)
	public String cs_write() {
		
		return "csBoard/cs_write";
	}
	
	@RequestMapping(value = "cs_write.do", method = RequestMethod.POST)
	public String cs_write(CSVO vo, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		
		UserVO uv = (UserVO)session.getAttribute("login");
		
		vo.setMidx(uv.getMidx());
		
		int result = csService.CS_write(vo);
		
		return "redirect:/csBoard/csList.do";
	}
	
	@RequestMapping(value = "csList_view.do", method = RequestMethod.GET)
	public String csListView(int csbidx, Model model) {
		
		CSVO cv = csService.csList_view(csbidx);
		
		List<CSVO> cvr = csService.csList_reply_view(csbidx);
		
		model.addAttribute("cv", cv);
		model.addAttribute("cvr", cvr);
				
		return "csBoard/csList_view";
	}
	
	@ResponseBody
	@RequestMapping(value = "csList_reply.do")
	public int csListReply(CSVO vo) {
		
		return csService.csList_reply(vo);
	}
	
	@RequestMapping(value = "csList_modify.do", method = RequestMethod.GET)
	public String csListModify(int bidx, Model model) {
		
		CSVO cv = csService.csList_view(bidx);
		
		model.addAttribute("cv", cv);
		
		return "csBoard/csList_modify";
	}
	
	@RequestMapping(value = "csList_modify.do", method = RequestMethod.POST)
	public String csListModify(CSVO vo, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		UserVO uv = (UserVO)session.getAttribute("login");
		vo.setMidx(uv.getMidx());
		
		int result = csService.csList_modify(vo);
		
		return "redirect:/csBoard/csList_view.do?csbidx="+vo.getCsbidx();
	}
	
	@RequestMapping(value = "csList_delete.do", method = RequestMethod.GET)
	public String csListDelete(int csbidx) {
		
		int result = csService.csList_delete(csbidx);
		
		return "redirect:/csBoard/csList.do";
	}

	
	
}
