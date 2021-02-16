package kr.co.korea.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.ReplyBean;
@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Autowired
	SqlSessionTemplate sqltemp;
	
	
	@Override
	public List<ReplyBean> list(int reply_bno) throws Exception {
		return sqltemp.selectList("test_reply.replylist",reply_bno);
	}
	
	@Override
	public void writeReply(ReplyBean replybean) throws Exception {
		sqltemp.insert("test_reply.replyinsert",replybean);
		
	}

	@Override
	public void updateReply(ReplyBean replybean) throws Exception {
		// TODO Auto-generated method stub
		sqltemp.update("test_reply.replyupdate",replybean);
		
	}

	@Override
	public void deleteReply(ReplyBean replybean) throws Exception {
		// TODO Auto-generated method stub
		sqltemp.delete("test_reply.replydelete",replybean);
	}

	@Override
	public ReplyBean selectReply(int reply_rno) throws Exception {
		// TODO Auto-generated method stub
		return sqltemp.selectOne("test_reply.replyselect",reply_rno);
	}
	
	
}
