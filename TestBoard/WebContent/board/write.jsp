<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>�� �ۼ�</h2>
<form action="write_result">

<table>
	<tr><td>����</td>
	<td><input type="text" id="Test_TITLE" name="Test_TITLE"/></td>
	</tr>
	<tr><td>����</td>
	<td><textarea id="Test_CONTENT"  name="Test_CONTENT"></textarea></td>
	</tr>
	<tr><td>�ۼ���</td>
	<td><input type="text" id="Test_WRITER"  name="Test_WRITER"/></td>
	</tr>
	<tr>
	<td>
	<button type="submit">�ۼ�</button>
	<button type="reset">���</button>
	</td>
	</tr>

</table>
</form>
</body>
</html>