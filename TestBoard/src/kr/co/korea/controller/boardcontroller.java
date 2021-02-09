package kr.co.korea.controller;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.context.request.WebRequest;

import kr.co.korea.beans.BoardBean;
import kr.co.korea.beans.PageMaker;
import kr.co.korea.beans.SearchCriteria;
import kr.co.korea.beans.Criteria;


@Controller
public class boardcontroller {

	@Autowired
	SqlSessionTemplate sqltemp;

	@GetMapping("index")
	public String index() {
		return "index.jsp";
	}
	
	@GetMapping("write")
	public String write() {
		return "/board/write.jsp";
	}
	
	@GetMapping("list")
	public String list(Model model,	@ModelAttribute("cri") SearchCriteria Cri) {
		List<BoardBean> list=sqltemp.selectList("test_board.board_list",Cri);
		model.addAttribute("list",list);
		
		PageMaker pagemaker = new PageMaker();
		pagemaker.setCri(Cri);
		pagemaker.setTotalCount(sqltemp.selectOne("test_board.board_boardcount"));
		model.addAttribute("pagemaker",pagemaker);
		
		return "/board/list.jsp";
	}
	
	
	
	
	@GetMapping("read")
	public String read(WebRequest request,Model model) {
		String code=request.getParameter("test_BNO");
		int updatecode=Integer.parseInt(code);
		
		sqltemp.update("test_board.board_hitadd",updatecode);
		BoardBean bean=sqltemp.selectOne("test_board.board_read",code);
		
		model.addAttribute("bean",bean);
		
		return "/board/read.jsp";
	}
	@GetMapping("update")
	public String update(WebRequest request,Model model) {
		String code=request.getParameter("test_BNO");
		BoardBean bean=sqltemp.selectOne("test_board.board_read",code);
		model.addAttribute("bean",bean);
		
		return "/board/update.jsp";
	}
	@GetMapping("delete")
	public String delete(WebRequest request, Model model) {
		String code=request.getParameter("test_BNO");
		BoardBean bean=sqltemp.selectOne("test_board.board_read",code);
		model.addAttribute("bean",bean);
		
		return "/board/delete.jsp";
	}
	
	
	@GetMapping("delete_result")
	public String delete_result(BoardBean bean) {
		sqltemp.delete("test_board.board_delete",bean);
		
		return "redirect:/list";
	}
	
	@GetMapping("update_result")
	public String update_result(BoardBean bean) {
		System.out.println(bean.getTest_BNO());
		System.out.println(bean.getTest_CONTENT());
		System.out.println(bean.getTest_TITLE());
		sqltemp.update("test_board.board_update",bean);
		
		return "redirect:/list";
	}
	
	@GetMapping("write_result")
	public String write_result(BoardBean bean) {
		
		sqltemp.insert("test_board.board_insert",bean);
		
		return "redirect:/index";
	}
	
}
