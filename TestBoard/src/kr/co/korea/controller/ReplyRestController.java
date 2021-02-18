package kr.co.korea.controller;

import java.util.List;

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
	

	
	//@PostMapping("/replywrite")
//	public Map<String,Object> replywrite(@RequestBody ReplyBean replybean) {
//		 Map<String,Object> map=  new HashMap<String, Object>();
//			try {
//				
//				replyservice.writereply(replybean);
//				map.put("result", "success");
//				
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//				map.put("result", "fail");
//			}
//		return map;
//	}
//	
	
}
