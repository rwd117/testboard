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
<h2>�Խñ� ���</h2>
<table border=1>
	<tr>
		<td>�Խñ� ��ȣ</td>
		<td>�Խñ� ����</td>
		<td>�Խñ� ����</td>
		<td>�Խñ� �ۼ���</td>
		<td>�Խñ� ��ȸ��</td>
		<td>�ۼ� ��¥</td>
	
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
<a href="index">[Ȩ����]</a>
<a href="write">[���ۼ�]</a><br/>
</body>
</html>