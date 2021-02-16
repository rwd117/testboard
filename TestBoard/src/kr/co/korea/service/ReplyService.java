package kr.co.korea.service;

import java.util.List;

import kr.co.korea.beans.ReplyBean;

public interface ReplyService {
	
	public List<ReplyBean> list(int reply_bno) throws Exception;
	
	public void writereply(ReplyBean replybean) throws Exception;
	
	public void updateReply(ReplyBean replybean) throws Exception;
	
	public void deleteReply(ReplyBean replybean) throws Exception;
	
	public ReplyBean selectReply(int reply_rno) throws Exception;
}
