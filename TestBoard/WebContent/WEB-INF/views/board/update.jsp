<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<title>Insert title here</title>
</head>
<body>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />


<h2>${read.test_BNO}번 게시물 수정</h2>

<form action="update_result">
<input type="hidden" id="Test_BNO" name="Test_BNO" value="${read.test_BNO }">
<table>
	<tr>
		<td>제목</td>
		<td><input type="text" id="Test_TITLE" name="Test_TITLE" value="${read.test_TITLE }"/></td>
		<td>조회수 : ${read.test_hit }</td>
	</tr>
	
	<tr>
		<td>내용</td>
		<td><textarea id="Test_CONTENT"  name="Test_CONTENT" >${read.test_CONTENT }</textarea></td>
	</tr>
	
	<tr>
		<td>작성자</td>
		<td><input type="text" id="Test_WRITER"  name="Test_WRITER" value="${read.test_WRITER }" disabled="disabled"/></td>
		<td>작성 날짜 : <fmt:formatDate value="${read.REGDATE}" pattern="yyyy-MM-dd"/></td>
	</tr>
	
	<tr>
		<td>
			<button type="submit">게시물 수정</button>
			<button type="button" class="listgo">게시판으로</button>
		</td>
	</tr>
</table>
</form>

<script>

$(function(){
	$(".listgo").click(function(){
		var listurl = "list?page=${cri.page}"+
						"&perPageNum=${cri.perPageNum}"+
						"&searchType=${cri.searchType}"+
						"&keyword=${cri.keyword}";
		location.href = listurl;
	});
});


</script>
</body>
</html>