<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">

<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script>
$(document).ready(function(){

	getreplylist();

});


</script>
<style>
textarea {
	resize: none;
}

li {
	list-style: none;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">

		<c:import url="/WEB-INF/views/include/top_menu.jsp" />

		<a href="update?test_BNO=${read.test_BNO}">[게시물 수정]</a> <a
			href="delete?test_BNO=${read.test_BNO}">[게시물 삭제]</a> <a
			class="alistBtn">[게시판으로]</a>
		<hr />
		<h3>${read.test_BNO}번게시물</h3>
		<table class="table">
			<tr>
				<td>제목</td>
				<td><input class="form-control" type="text" id="Test_TITLE"
					name="Test_TITLE" value="${read.test_TITLE }" disabled="disabled" /></td>
				<td>조회수 : ${read.test_hit }</td>

			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control" id="Test_CONTENT"
						name="Test_CONTENT" disabled="disabled">${read.test_CONTENT }</textarea></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input class="form-control" type="text" id="Test_WRITER"
					name="Test_WRITER" value="${read.test_WRITER }" disabled="disabled" /></td>
				<td>작성 날짜 : <fmt:formatDate value="${read.REGDATE}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
		</table>


		<hr />
		<div class="col-md-6">
			<form name="replyform" action="replywrite" method="get">
				<input type="hidden" id="page" name="page" value="${cri.page}">
				<input type="hidden" id="perPageNum" name="perPageNum"
					value="${cri.perPageNum}"> <input type="hidden"
					id="searchType" name="searchType" value="${cri.searchType}">
				<input type="hidden" id="keyword" name="keyword"
					value="${cri.keyword}"> <input type="hidden" id="reply_bno"
					name="reply_bno" value="${read.test_BNO}" /> <label
					for="reply_writer">작성자 :</label><input type="text"
					class="form-control" id="reply_writer" name="reply_writer"><br />

				<label for="reply_content">댓글 내용 :</label>
				<textarea class="form-control" id="reply_content"
					name="reply_content"></textarea>

				<br />

				<button type="submit" class="btn btn-outline-success"
					id="replywriteBtn">댓글 작성</button>
			</form>
		</div>
		<br />
		<hr />

		<div class="container">
			<!--<ul class="list-group list-group-flush">
<c:forEach var="replylist" items="${replylist }">
	<li class="list-group-item">
		작성자 : ${replylist.reply_writer } &nbsp;&nbsp;&nbsp;&nbsp; 작성 날짜 :  <fmt:formatDate value="${replylist.reply_regdate }" pattern="yyyy-MM-dd"/><br/>
		댓글 내용 : <span>${replylist.reply_content }</span><br/>		
	</li>
	<br/>
	<div>
	
		<button type="button" class="btn btn-outline-success" id="replyupdateBtn" data-rno="${replylist.reply_rno}">댓글 수정</button>
 		<button type="button" class="btn btn-outline-success" id="replydeleteBtn" data-rno="${replylist.reply_rno}">댓글 삭제</button>
	</div>
	<br/>
</c:forEach>


</ul>!-->
			<div id="replylist"></div>

		</div>


	</div>


	<script>


function getreplylist(){
	var replyurl = "${root}board/replylist/"
	var reply_bno = $('#reply_bno').val();
	
	$.ajax({
		url : replyurl+reply_bno,
		type : 'POST',
		dataType: 'json',
		success : function(result){
		var comments = "";
		var ana="";
		if(result.length < 1){
			comments.push("등록된 댓글이 없습니다.");
			
		}else{
			$(result).each(function(){
				
				comments +='<strong>';
				comments +='작성자 : ' + this.reply_writer;
				comments +='</strong>&nbsp;&nbsp;&nbsp;&nbsp;';
				comments +='작성 날짜 : '+ this.reply_regdate;
				comments += '<br/>';
				comments +='댓글 내용 :';
				comments +='<span>';
				comments +=this.reply_content;
				comments +='</span>'
				comments +='<br/>'
			});
		};
			$("#replylist").html(comments);
		}
	});
};


function getFormatDate(date){
    var year = date.getFullYear();             
    var month = (1 + date.getMonth());         
    month = month >= 10 ? month : '0' + month; 
    var day = date.getDate();                   
    day = day >= 10 ? day : '0' + day;         
    return  year + '-' + month + '-' + day;      
}




$(function(){
	$("#replyupdateBtn").click(function(){
		var replyupdateurl ="replyupdate?"+
							"page=${cri.page}"+
							"&perPageNum=${cri.perPageNum}"+
							"&searchType=${cri.searchType}"+
							"&keyword=${cri.keyword}"+
							"&reply_rno="+$(this).attr("data-rno");
							
		location.href= replyupdateurl;
	});
	
	$("#replydeleteBtn").click(function(){
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
		var writeurl = "list?page=${cri.page}"+
						"&perPageNum=${cri.perPageNum}"+
						"&searchType=${cri.searchType}"+
						"&keyword=${cri.keyword}";
		location.href = writeurl;
	});
});



</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
		integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
		integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
		crossorigin="anonymous"></script>


</body>
</html>