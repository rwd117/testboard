<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>${bean.test_BNO}번 게시물 삭제</h2>

<form action="delete_result">
<input type="hidden" id="Test_BNO" name="Test_BNO" value="${bean.test_BNO }">
<table>
	<tr>
		<td>작성자</td>
		<td><input type="text" value="${bean.test_WRITER }" disabled="disabled"/></td>
	</tr>
	<tr>
		<td>작성자 확인</td>
		<td><input type="text" id="Test_WRITER"  name="Test_WRITER"></td>
	</tr>
	
	<tr>
		<td>
			<button type="submit">게시물 삭제</button>
		</td>
	</tr>
</table>
</form>


</body>
</html>