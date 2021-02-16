package kr.co.korea.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.BoardBean;
import kr.co.korea.beans.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
	SqlSessionTemplate sqltemp;
	
	@Override
	public void write(BoardBean boardbean) throws Exception {
		// TODO Auto-generated method stub
		sqltemp.insert("test_board.board_insert",boardbean);
	}
	
	@Override
	public List<BoardBean> list(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqltemp.selectList("test_board.board_list",cri);
	}
	
	@Override
	public int listCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqltemp.selectOne("test_board.board_boardcount",cri);
	}
	
	@Override
	public BoardBean read(int Test_BNO) throws Exception {
		// TODO Auto-generated method stub
		return sqltemp.selectOne("test_board.board_read", Test_BNO);
	}
	
	@Override
	public void addhit(int Test_BNO) throws Exception {
		// TODO Auto-generated method stub
		sqltemp.update("test_board.board_hitadd",Test_BNO);
	}
	
	
	@Override
	public void update(BoardBean boardbean) throws Exception {
		// TODO Auto-generated method stub
		sqltemp.update("test_board.board_update",boardbean);
	}
	
	@Override
	public void delete(BoardBean boardbean) throws Exception {
		// TODO Auto-generated method stub
		sqltemp.delete("test_board.board_delete",boardbean);
		
	}
}
