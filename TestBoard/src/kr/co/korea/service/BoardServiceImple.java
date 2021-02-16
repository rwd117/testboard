package kr.co.korea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.BoardBean;
import kr.co.korea.beans.SearchCriteria;
import kr.co.korea.dao.BoardDAO;

@Service
public class BoardServiceImple implements BoardService{

	@Autowired
	private BoardDAO dao;
	
	@Override
	public void write(BoardBean boardbean) throws Exception {
		dao.write(boardbean);
	}
	
	@Override
	public List<BoardBean> list(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(cri);
	}
	
	@Override
	public int listCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(cri);
	}
	
	
	@Override
	public BoardBean read(int Test_BNO) throws Exception {
	// TODO Auto-generated method stub
	return dao.read(Test_BNO);
	}
		
	@Override
	public void addhit(int Test_BNO) throws Exception {
		// TODO Auto-generated method stub
		dao.addhit(Test_BNO);
	}
	
	
	@Override
	public void update(BoardBean boardbean) throws Exception {
		// TODO Auto-generated method stub
		dao.update(boardbean);
	}
	
	@Override
	public void delete(BoardBean boardbean) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(boardbean);
	}
}
