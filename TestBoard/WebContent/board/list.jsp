<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>게시글 목록</h2>
<table border=1>
	<tr>
		<td>게시글 번호</td>
		<td>게시글 제목</td>
		<td>게시글 내용</td>
		<td>게시글 작성자</td>
		<td>게시글 조회수</td>
		<td>작성 날짜</td>
	
	</tr>

<c:forEach var="board" items="${list}">
	
	
	
	<tr>
		<td>${board.test_BNO}</td>
		<td><a href="read?test_BNO=${board.test_BNO}">${board.test_TITLE}</a></td>
		
		<td>${board.test_CONTENT}</td>
		<td>${board.test_WRITER}</td>
		<td>${board.test_hit}</td>
		<td><fmt:formatDate value="${board.REGDATE}" pattern="yyyy-MM-dd"/></td>
	</tr>



</c:forEach>
</table>
<a href="index">[홈으로]</a>
<a href="write">[글작성]</a><br/>
</body>
</html>