package kr.co.korea.controller;

import org.hibernate.validator.internal.util.stereotypes.Lazy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.korea.beans.BoardBean;
import kr.co.korea.beans.PageMaker;
import kr.co.korea.beans.ReplyBean;
import kr.co.korea.beans.SearchCriteria;
import kr.co.korea.service.BoardService;
import kr.co.korea.service.ReplyService;

@Controller
public class BoardController {

	
	@Autowired
	@Lazy
	BoardService service;
	
	@Autowired
	@Lazy
	ReplyService replyservice;
	
	@GetMapping("write")
	public String write(Model model,@ModelAttribute("cri") SearchCriteria cri) {
		
		model.addAttribute("cri",cri);
		return "/board/write.jsp";
	}
	
	@GetMapping("write_result")
	public String write_result(BoardBean boardbean) throws Exception {
		service.write(boardbean);
		return "redirect:/list";
	}
	
	@RequestMapping(value="list" ,method={RequestMethod.GET, RequestMethod.POST})
	public String list(Model model,@ModelAttribute("cri") SearchCriteria cri) throws Exception {
		
		model.addAttribute("list",service.list(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount(cri));
		
		model.addAttribute("pagemaker", pageMaker);
		
		return "/board/list.jsp";
	}
	
	@GetMapping("read")
	public String read(Model model,BoardBean boardbean,@ModelAttribute("cri") SearchCriteria cri) throws Exception {
		
		model.addAttribute("read",service.read(boardbean.getTest_BNO()));
		
		service.addhit(boardbean.getTest_BNO());
		
		model.addAttribute("cri",cri);
		model.addAttribute("reply",new ReplyBean());
		
		return "/board/read.jsp";
	}
	
	
	
	@GetMapping("update")
	public String update(BoardBean boardbean,Model model,@ModelAttribute("cri") SearchCriteria cri) throws Exception {
		
		model.addAttribute("read",service.read(boardbean.getTest_BNO()));
		model.addAttribute("cri",cri);
		
		return "/board/update.jsp";
	}
	
	@PostMapping("update_result")
	public String update_result(BoardBean boardbean,@ModelAttribute("cri") SearchCriteria cri,RedirectAttributes rttr) throws Exception {
		
		service.update(boardbean);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/list";
	}
	
	
	@GetMapping("delete")
	public String delete(BoardBean boardbean,Model model,@ModelAttribute("cri") SearchCriteria cri) throws Exception {
		
		model.addAttribute("read",service.read(boardbean.getTest_BNO()));
		model.addAttribute("cri",cri);
		
		return "/board/delete.jsp";
	}
	
	
	@PostMapping("delete_result")
	public String delete_result(BoardBean boardbean,@ModelAttribute("cri") SearchCriteria cri,RedirectAttributes rttr) throws Exception {
		service.delete(boardbean);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/list";
	}
	
	@GetMapping("/replywrite")
	public String replywrite(ReplyBean replybean, @ModelAttribute("cri") SearchCriteria cri ,RedirectAttributes rttr) throws Exception {
		replyservice.writereply(replybean);
		
		rttr.addAttribute("test_BNO",replybean.getReply_bno());
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/read";
	}
	
	@GetMapping("/replyupdate")
	public String replyupdate(ReplyBean replybean,Model model,SearchCriteria cri) throws Exception  {
		
		model.addAttribute("replyupdate",replyservice.selectReply(replybean.getReply_rno()));
		model.addAttribute("cri",cri);
		
		return "/board/replyupdate.jsp";
	}
	
	@GetMapping("/replyupdate_result")
	public String replyupdate_result(ReplyBean replybean, SearchCriteria cri ,RedirectAttributes rttr) throws Exception {
		
		replyservice.updateReply(replybean);
		
		rttr.addAttribute("test_BNO",replybean.getReply_bno());
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/read";
	}
	
	@GetMapping("/replydelete")
	public String replydelete(ReplyBean replybean,Model model,SearchCriteria cri) throws Exception {
		model.addAttribute("replydelete",replyservice.selectReply(replybean.getReply_rno()));
		model.addAttribute("cri",cri);
		
		return"/board/replydelete.jsp";
	}
	
	
	@GetMapping("/replydelete_result")
	public String replydelete_result(ReplyBean replybean,SearchCriteria cri ,RedirectAttributes rttr)throws Exception {
		
		replyservice.deleteReply(replybean);
		
		rttr.addAttribute("test_BNO",replybean.getReply_bno());
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/read";
	}
	
	
	
	
	
}
