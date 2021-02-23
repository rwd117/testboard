package kr.co.korea.dao;

import java.util.List;

import kr.co.korea.beans.ReplyBean;

public interface ReplyDAO {
	
	public List<ReplyBean> list(int reply_bno) throws Exception;
	
	public void writeReply(ReplyBean replybean) throws Exception;
	
	public void updateReply(ReplyBean replybean) throws Exception;
	
	public void deleteReply(ReplyBean replybean) throws Exception;
	
}
