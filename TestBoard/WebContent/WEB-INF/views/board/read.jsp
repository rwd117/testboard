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
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<style>
textarea {
	resize: none;
}

li {
	list-style: none;
}
</style>

<script>
$(document).ready(function(){<!-- read.jsp가 로드되면 기본적으로 list를 불러옴!-->
	getreplylist();
});

function getreplylist(){<!--list를 불러온다.!-->
	var replyurl = "${root}board/replylist/";
	var reply_bno = ${read.test_BNO};
	var reply_rno = ${reply.reply_rno};
	
	$.ajax({
		url : replyurl+reply_bno,
		type : 'POST',
		dataType: 'json',
		success : function(result){
		var comments = "";
		if(result.length < 1){
			comments = "등록된 댓글이 없습니다.";
		}else{
			$(result).each(function(){
			comments +='<div id="reply_rno'+this.reply_rno+'">';
			comments +='<strong>'+'작성자 : ' + this.reply_writer+'</strong>&nbsp;&nbsp;&nbsp;&nbsp;';
			comments +='작성 날짜 : '+ this.reply_regdate+'<br/>';
			comments += '<p>';
			comments +='댓글 내용 : &nbsp;&nbsp;&nbsp;'+ this.reply_content;
			comments +='</p>';
			comments +='<br/>';
comments +='<button type="button" class="btn btn-outline-success" onclick="updateviewBtn(' + this.reply_rno + ',\'' + this.reply_regdate+'\', \''+ this.reply_content+'\', \''+ this.reply_writer +'\')">';
			comments +='댓글수정</button>';
			comments +='<button type="button" class="btn btn-outline-success" onclick="replydelete('+this.reply_rno+')">';
			comments +='댓글 삭제';
			comments +='</button>';
			comments +='</div>';
			comments +='<br/>';
			});
		};
			$("#replylist").html(comments);
		}
	});
};

function replydelete(reply_rno){<!--delete ajax!-->
	
	var deleteurl = "${root}board/replydelete/";
	
	$.ajax({
		url: deleteurl+reply_rno,
		type : 'POST',
		dataType: 'json',
		success: function(result){
			getreplylist();
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
	
	
}


function updateviewBtn(reply_rno, reply_regdate, reply_content, reply_writer){<!-- 폼만 바꾸면 되는 거라서 ajax 이용 x !-->
	console.log("들어옵니까?");
	
	var commentsview = "";
	
	commentsview +='<div id="reply_rno'+reply_rno+'">';
	commentsview +='<strong>';
	commentsview +='작성자 : ' + reply_writer;
	commentsview +='</strong>&nbsp;&nbsp;&nbsp;&nbsp;';
	commentsview +='작성 날짜 : '+ reply_regdate;
	commentsview += '<br/><p>';
	commentsview +='댓글 내용 : &nbsp;&nbsp;&nbsp;';
	commentsview += '<textarea class="form-control" id="reply_edit_content">';
	commentsview += reply_content ;
	commentsview += '</textarea>';
	commentsview +='</p>';
	commentsview +='<br/>';
	commentsview +='<button type="button" class="btn btn-outline-success"';
	commentsview += 'onclick="updateBtn(' + reply_rno + ',\'' + reply_writer +'\')">댓글작성</button>';
	commentsview +='<button type="button" class="btn btn-outline-success" onclick="getreplylist()" >';
	commentsview +='취소';
	commentsview +='</button>';
	commentsview +='</div>';
	commentsview +='<br/>';
	
	$('#reply_rno'+reply_rno).replaceWith(commentsview);
	$('#reply_rno'+reply_rno+'#reply_content').focus();
	
};

function updateBtn(reply_rno, reply_writer){<!--update ajax!-->
	
	var updateurl = "${root}board/replyupdate/";
	var reply_content = $("#reply_edit_content").val();
	
	$.ajax({
		url: updateurl+reply_rno+'/'+reply_content,
		type : 'POST',
		dataType: 'json',
		success: function(result){
			getreplylist();
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
	
	
};

function getFormatDate(date){ <!--ajax에서는 data형식을 읽을수 없으므로 자바스크립트에서 data형식으로 바꿈 !-->
	var year = date.getFullYear();             
	var month = (1 + date.getMonth());         
	month = month >= 10 ? month : '0' + month; 
	var day = date.getDate();                   
	day = day >= 10 ? day : '0' + day;         
	return  year + '-' + month + '-' + day;      
};

$(function(){
	
	$('#replywriteBtn').click(function(){<!--insert 댓글 작성 ajax!-->
		console.log("들어오기는 함?");
		var reply_content = $('#reply_content').val();
			reply_writer = $('#reply_writer').val();
			reply_bno = ${read.test_BNO};
			
	    var writeurl = "${root}board/replywrite/";
		$.ajax({
			url: writeurl+reply_bno+'/'+reply_writer+'/'+reply_content,
			type : 'POST',
			dataType: 'json',
			success: function(result){
				getreplylist();
				$('#reply_content').val('');
				$('#reply_writer').val('');
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
	})
});
	
	$(".alistBtn").click(function(){
		var listurl = "list?page=${cri.page}"+
						"&perPageNum=${cri.perPageNum}"+
						"&searchType=${cri.searchType}"+
						"&keyword=${cri.keyword}";
		location.href = listurl;
	});
});	
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/include/top_menu.jsp" />

		<a href="update?test_BNO=${read.test_BNO}">[게시물 수정]</a> 
		<a href="delete?test_BNO=${read.test_BNO}">[게시물 삭제]</a> 
		<a class="alistBtn">[게시판으로]</a>
		<hr />
		<!-- 게시물 기본 정보  -->
		<h3>${read.test_BNO}번게시물</h3>
		<table class="table">
			<tr>
				<td>제목</td>
				<td><input class="form-control" type="text" id="Test_TITLE" name="Test_TITLE" value="${read.test_TITLE }" disabled="disabled" /></td>
				<td>조회수 : ${read.test_hit }</td>

			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control" id="Test_CONTENT" name="Test_CONTENT" disabled="disabled">${read.test_CONTENT }</textarea></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input class="form-control" type="text" id="Test_WRITER" name="Test_WRITER" value="${read.test_WRITER }" disabled="disabled" /></td>
				<td>작성 날짜 : <fmt:formatDate value="${read.REGDATE}" pattern="yyyy-MM-dd" /></td>
			</tr>
		</table>


		<hr />
		<div class="col-md-6"><!-- 댓글 작성 div -->
			<label for="reply_writer">작성자 :</label>
			 <input type="text"	class="form-control" id="reply_writer" name="reply_writer"><br />
			<label for="reply_content">댓글 내용 :</label>
			<textarea class="form-control" id="reply_content" name="reply_content"></textarea>
			<button type="button" class="btn btn-outline-success" id="replywriteBtn">댓글 작성</button>
		</div>
		<br />
		<hr />


		<div class="container"><!-- 댓글이 들어갈 div -->
			<div id="replylist"></div>
		</div>

	</div>

	<script>

</script>





</body>
</html>