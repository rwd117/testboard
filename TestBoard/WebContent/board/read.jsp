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
<h2>${bean.test_BNO}번 게시물</h2>

<table>
	<tr><td>제목</td>
	<td><input type="text" id="Test_TITLE" name="Test_TITLE" value="${bean.test_TITLE }" disabled="disabled"/></td>
	<td>조회수 : ${bean.test_hit }</td>
	
	</tr>
	<tr><td>내용</td>
	<td><textarea id="Test_CONTENT"  name="Test_CONTENT" disabled="disabled">${bean.test_CONTENT }</textarea></td>
	</tr>
	<tr><td>작성자</td>
	<td><input type="text" id="Test_WRITER"  name="Test_WRITER" value="${bean.test_WRITER }" disabled="disabled"/></td>
	<td>작성 날짜 : <fmt:formatDate value="${bean.REGDATE}" pattern="yyyy-MM-dd"/></td>
	</tr>
</table>

<a href="update?test_BNO=${bean.test_BNO}">[게시물 수정]</a>
<a href="delete?test_BNO=${bean.test_BNO}">[게시물 삭제]</a>

</body>
</html>