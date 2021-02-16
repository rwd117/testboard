package kr.co.korea.service;

import java.util.List;

import kr.co.korea.beans.BoardBean;
import kr.co.korea.beans.SearchCriteria;

public interface BoardService {
	
	public void write(BoardBean boardbean) throws Exception;
	
	public List<BoardBean> list(SearchCriteria cri) throws Exception;
	
	public int listCount(SearchCriteria cri) throws Exception;
	
	public BoardBean read (int Test_BNO) throws Exception;
	
	public void addhit(int Test_BNO) throws Exception;
	
	public void update(BoardBean boardbean) throws Exception;
	
	public void delete(BoardBean boardbean) throws Exception;
}
