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
<h2>${bean.test_BNO}�� �Խù� ����</h2>
<form action="update_result">
<input type="hidden" id="Test_BNO" name="Test_BNO" value="${bean.test_BNO }">
<table>
	<tr>
		<td>����</td>
		<td><input type="text" id="Test_TITLE" name="Test_TITLE" value="${bean.test_TITLE }"/></td>
		<td>��ȸ�� : ${bean.test_hit }</td>
	</tr>
	
	<tr>
		<td>����</td>
		<td><textarea id="Test_CONTENT"  name="Test_CONTENT" >${bean.test_CONTENT }</textarea></td>
	</tr>
	
	<tr>
		<td>�ۼ���</td>
		<td><input type="text" id="Test_WRITER"  name="Test_WRITER" value="${bean.test_WRITER }" disabled="disabled"/></td>
		<td>�ۼ� ��¥ : <fmt:formatDate value="${bean.REGDATE}" pattern="yyyy-MM-dd"/></td>
	</tr>
	
	<tr>
		<td>
			<button type="submit">�Խù� ����</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>