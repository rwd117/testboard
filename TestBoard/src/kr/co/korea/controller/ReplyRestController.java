package kr.co.korea.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.validator.internal.util.stereotypes.Lazy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.korea.beans.ReplyBean;
import kr.co.korea.service.ReplyService;

@RestController
@RequestMapping("/board")
public class ReplyRestController {

	@Autowired
	@Lazy
	private ReplyService replyservice;

	@PostMapping("/replylist/{reply_bno}")
	public List<ReplyBean> replylist(@PathVariable int reply_bno) throws Exception {

		List<ReplyBean> replylist = replyservice.list(reply_bno);

		return replylist;
	}

//	
	@PostMapping("/replywrite/{reply_bno}/{reply_writer}/{reply_content}")
	public Map<String, Object> replywrite(@PathVariable int reply_bno, @PathVariable String reply_writer,
			@PathVariable String reply_content) {
		Map<String, Object> map = new HashMap<String, Object>();
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

	@PostMapping("/replyupdate/{reply_rno}/{reply_content}")
	public Map<String, Object> replyupdate(@PathVariable int reply_rno, @PathVariable String reply_content) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			ReplyBean replybean = new ReplyBean();
			replybean.setReply_rno(reply_rno);
			replybean.setReply_content(reply_content);
			replyservice.updateReply(replybean);

			map.put("result", "success");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}
	
	@PostMapping("/replydelete/{reply_rno}")
	public Map<String, Object> replydelete(@PathVariable int reply_rno) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			ReplyBean replybean = new ReplyBean();
			replybean.setReply_rno(reply_rno);
			replyservice.deleteReply(replybean);

			map.put("result", "success");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}

}
