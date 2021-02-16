package kr.co.korea.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.ReplyBean;
import kr.co.korea.dao.ReplyDAO;


@Service
public class ReplyServiceImple implements ReplyService{
	
	@Autowired
	ReplyDAO dao;
	
	@Override
	public List<ReplyBean> list(int reply_bno) throws Exception {
	// TODO Auto-generated method stub
	return dao.list(reply_bno);
	}
	
	@Override
	public void writereply(ReplyBean replybean) throws Exception {
		dao.writeReply(replybean);
	}

	@Override
	public void updateReply(ReplyBean replybean) throws Exception {
		// TODO Auto-generated method stub
		dao.updateReply(replybean);
		
	}

	@Override
	public void deleteReply(ReplyBean replybean) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteReply(replybean);
	}

	@Override
	public ReplyBean selectReply(int reply_rno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectReply(reply_rno);
	}
	
}
