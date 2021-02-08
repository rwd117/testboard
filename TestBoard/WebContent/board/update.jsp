<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>${bean.test_BNO}번 게시물 수정</h2>
<form action="update_result">
<input type="hidden" id="Test_BNO" name="Test_BNO" value="${bean.test_BNO }">
<table>
	<tr>
		<td>제목</td>
		<td><input type="text" id="Test_TITLE" name="Test_TITLE" value="${bean.test_TITLE }"/></td>
		<td>조회수 : ${bean.test_hit }</td>
	</tr>
	
	<tr>
		<td>내용</td>
		<td><textarea id="Test_CONTENT"  name="Test_CONTENT" >${bean.test_CONTENT }</textarea></td>
	</tr>
	
	<tr>
		<td>작성자</td>
		<td><input type="text" id="Test_WRITER"  name="Test_WRITER" value="${bean.test_WRITER }" disabled="disabled"/></td>
		<td>작성 날짜 : <fmt:formatDate value="${bean.REGDATE}" pattern="yyyy-MM-dd"/></td>
	</tr>
	
	<tr>
		<td>
			<button type="submit">게시물 수정</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>