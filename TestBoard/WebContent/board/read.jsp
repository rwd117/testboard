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
<h2>${bean.test_BNO}�� �Խù�</h2>

<table>
	<tr><td>����</td>
	<td><input type="text" id="Test_TITLE" name="Test_TITLE" value="${bean.test_TITLE }" disabled="disabled"/></td>
	<td>��ȸ�� : ${bean.test_hit }</td>
	
	</tr>
	<tr><td>����</td>
	<td><textarea id="Test_CONTENT"  name="Test_CONTENT" disabled="disabled">${bean.test_CONTENT }</textarea></td>
	</tr>
	<tr><td>�ۼ���</td>
	<td><input type="text" id="Test_WRITER"  name="Test_WRITER" value="${bean.test_WRITER }" disabled="disabled"/></td>
	<td>�ۼ� ��¥ : <fmt:formatDate value="${bean.REGDATE}" pattern="yyyy-MM-dd"/></td>
	</tr>
</table>

<a href="update?test_BNO=${bean.test_BNO}">[�Խù� ����]</a>
<a href="delete?test_BNO=${bean.test_BNO}">[�Խù� ����]</a>

</body>
</html>