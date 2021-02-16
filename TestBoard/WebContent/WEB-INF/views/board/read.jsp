<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
			a{
				text-decoration:none;
			}
			li {
				list-style: none;
			 	float: left;
			  	padding: 6px;
			  }
			.replydiv{
				float:left
			}				
</style>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<title>Insert title here</title>
</head>
<body>
<h2>${read.test_BNO}번 게시물</h2>
<hr/>
<a href="update?test_BNO=${read.test_BNO}">[게시물 수정]</a>
<a href="delete?test_BNO=${read.test_BNO}">[게시물 삭제]</a>
<a class="alistBtn">[게시판으로]</a>
<hr/>

<form name="readForm" method="post">
  <input type="hidden" id="test_BNO" name="test_BNO" value="${read.test_BNO}" />
  <input type="hidden" id="page" name="page" value="${cri.page}"> 
  <input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum}"> 
  <input type="hidden" id="searchType" name="searchType" value="${cri.searchType}"> 
  <input type="hidden" id="keyword" name="keyword" value="${cri.keyword}"> 
</form>

<table>
	<tr><td>제목</td>
	<td><input type="text" id="Test_TITLE" name="Test_TITLE" value="${read.test_TITLE }" disabled="disabled"/></td>
	<td>조회수 : ${read.test_hit }</td>
	
	</tr>
	<tr><td>내용</td>
	<td><textarea id="Test_CONTENT"  name="Test_CONTENT" disabled="disabled">${read.test_CONTENT }</textarea></td>
	</tr>
	<tr><td>작성자</td>
	<td><input type="text" id="Test_WRITER"  name="Test_WRITER" value="${read.test_WRITER }" disabled="disabled"/></td>
	<td>작성 날짜 : <fmt:formatDate value="${read.REGDATE}" pattern="yyyy-MM-dd"/></td>
	</tr>
</table>
<hr/>

<div>
<form name="replyform" action="replywrite" method="get">
	<input type="hidden" id="test_BNO" name="test_BNO" value="${read.test_BNO}" />
  	<input type="hidden" id="page" name="page" value="${cri.page}"> 
  	<input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum}"> 
  	<input type="hidden" id="searchType" name="searchType" value="${cri.searchType}"> 
 	<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}"> 
 	<input type="hidden" id="reply_bno" name="reply_bno" value="${read.test_BNO}" />
	
	<label for="reply_writer">작성자 :</label><input type="text" id="reply_writer" name="reply_writer"><br/>
	<label for="reply_content">댓글 내용 :</label><input type="text" id="reply_content" name="reply_content"><br/>
	
	<button type="submit" id="replywriteBtn">댓글 작성</button>
</form>
</div>

<div class="replydiv">
<c:forEach var="replylist" items="${replylist }">
	<li>
		작성자 : ${replylist.reply_writer } &nbsp;&nbsp;&nbsp;&nbsp; 작성 날짜 :  <fmt:formatDate value="${replylist.reply_regdate }" pattern="yyyy-MM-dd"/><br/>
		댓글 내용 : <span>${replylist.reply_content }</span><br/>		
	</li>
	<br/>
	<div>
		<button type="button" class="replyupdateBtn" data-rno="${replylist.reply_rno}">댓글 수정</button>
 		<button type="button" class="replydeleteBtn" data-rno="${replylist.reply_rno}">댓글 삭제</button>
	</div>
	<br/>
</c:forEach>
</div>

<script>

$(function(){
	$(".replyupdateBtn").click(function(){
		var replyupdateurl ="replyupdate?"+
							"page=${cri.page}"+
							"&perPageNum=${cri.perPageNum}"+
							"&searchType=${cri.searchType}"+
							"&keyword=${cri.keyword}"+
							"&reply_rno="+$(this).attr("data-rno");
							
		location.href= replyupdateurl;
	});
	
	$(".replydeleteBtn").click(function(){
		var replydeleteurl ="replydelete?"+
							"page=${cri.page}"+
							"&perPageNum=${cri.perPageNum}"+
							"&searchType=${cri.searchType}"+
							"&keyword=${cri.keyword}"+
							"&reply_rno="+$(this).attr("data-rno");
		location.href=replydeleteurl;
	});
	
	$(".alistBtn").click(function(){
		var listurl = "list?page=${cri.page}"+
						"&perPageNum=${cri.perPageNum}"+
						"&searchType=${cri.searchType}"+
						"&keyword=${cri.keyword}";
		location.href = listurl;
	});
	
	$(".replywriteBtn").click(function(){
		var formreply = $("form[name='replyform']");	
			formreply.attr("action", "/replywrite");
			formreply.submit();
		});
});



</script>



</body>
</html>