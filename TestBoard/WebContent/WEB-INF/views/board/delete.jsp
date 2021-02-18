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

<h2>${read.test_BNO}번 게시물 삭제</h2>

<form action="delete_result">
<input type="hidden" id="Test_BNO" name="Test_BNO" value="${read.test_BNO }">
<table>
	<tr>
		<td>작성자</td>
		<td><input type="text" value="${read.test_WRITER }" disabled="disabled"/></td>
	</tr>
	<tr>
		<td>작성자 확인</td>
		<td><input type="text" id="Test_WRITER"  name="Test_WRITER"></td>
	</tr>
	
	<tr>
		<td>
			<button type="submit">게시물 삭제</button>
			<button type="button" class="listgo">홈으로</button>
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