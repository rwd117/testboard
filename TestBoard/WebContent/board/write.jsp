<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>글 작성</h2>
<form action="write_result">

<table>
	<tr><td>제목</td>
	<td><input type="text" id="Test_TITLE" name="Test_TITLE"/></td>
	</tr>
	<tr><td>내용</td>
	<td><textarea id="Test_CONTENT"  name="Test_CONTENT"></textarea></td>
	</tr>
	<tr><td>작성자</td>
	<td><input type="text" id="Test_WRITER"  name="Test_WRITER"/></td>
	</tr>
	<tr>
	<td>
	<button type="submit">작성</button>
	<button type="reset">취소</button>
	</td>
	</tr>

</table>
</form>
</body>
</html>