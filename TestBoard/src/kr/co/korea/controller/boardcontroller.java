package kr.co.korea.controller;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.context.request.WebRequest;

import kr.co.korea.beans.BoardBean;


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
	public String list(Model model) {
		List<BoardBean> list=sqltemp.selectList("test_board.board_list");

		model.addAttribute("list",list);
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
