<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<title>Insert title here</title>
</head>
<body>

<h2>${replydelete.reply_bno}번 게시물의 댓글 삭제</h2>
<hr/>

<div>
<form name="replyform" action="replydelete_result" method="get">
	<input type="hidden" id="reply_bno" name="reply_bno" value="${replydelete.reply_bno}" />
	<input type="hidden" id="reply_rno" name="reply_rno" value="${replydelete.reply_rno}" />
  	<input type="hidden" id="page" name="page" value="${cri.page}"> 
  	<input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum}"> 
  	<input type="hidden" id="searchType" name="searchType" value="${cri.searchType}"> 
 	<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}"> 
	
	<label>댓글 내용 :</label><input type="text" id="reply_content" name="reply_content" value="${replydelete.reply_content}" readonly><br/>
	<label>작성자 : </label><input type="text" id="reply_writer" name="reply_writer" value="${replydelete.reply_writer}" readonly><br/>
	
	
	<button type="submit">댓글 삭제</button>
	<button type="button" class="cancle">삭제 취소</button>
</form>
</div>

<script type="text/javascript">
	$(function(){
		$(".cancle").click(function(){
			var cancleurl="read?"+
						  "page=${cri.page}"+
			              "&perPageNum=${cri.perPageNum}"+
			              "&searchType=${cri.searchType}"+
			              "&keyword=${cri.keyword}"+
			              "&test_BNO=${replydelete.reply_bno}";
			 location.href= cancleurl;
			
		});
	});


</script>

</body>
</html>