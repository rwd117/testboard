package kr.co.korea.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.validator.internal.util.stereotypes.Lazy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.korea.beans.ReplyBean;
import kr.co.korea.service.ReplyService;

@RestController
public class ReplyRestController {
	
	@Autowired
	@Lazy
	ReplyService replyservice;
	
	
	@PostMapping("/board/replylist/{reply_bno}")
	public List<ReplyBean> replylist(@PathVariable int reply_bno) throws Exception {
		
		List<ReplyBean> replylist = replyservice.list(reply_bno);
		
		return replylist;
	}
	

//	
	@PostMapping("/board/replywrite/{reply_bno}/{reply_writer}/{reply_content}")
	public Map<String,Object> replywrite(@PathVariable int reply_bno,
										@PathVariable String reply_writer,
										@PathVariable String reply_content) {
		 Map<String,Object> map=  new HashMap<String, Object>();
			try {
				ReplyBean replybean = new ReplyBean();
				replybean.setReply_bno(reply_bno);
				replybean.setReply_writer(reply_writer);
				replybean.setReply_content(reply_content);
				replyservice.writereply(replybean);
				
				map.put("result", "success");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				map.put("result", "fail");
			}
		return map;
	}
	
	
}
