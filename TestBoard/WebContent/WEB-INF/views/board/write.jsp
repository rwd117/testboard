<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<style>

textarea {
	resize: none;
}

li {
	list-style: none;
}
</style>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/include/top_menu.jsp" />

		<h2>글 작성</h2>

		<form action="write_result">

			<table class="table">
				<tr>
					<td>제목</td>
					<td class="table-active"><input class="form-control"
						type="text" id="Test_TITLE" name="Test_TITLE" /></td>
				</tr>
				<tr>
					<td scope="row">내용</td>
					<td class="table-active"><textarea class="form-control"
							id="Test_CONTENT" name="Test_CONTENT"></textarea></td>
				</tr>
				<tr>
					<td scope="row">작성자</td>
					<td class="table-active"><input class="form-control"
						type="text" id="Test_WRITER" name="Test_WRITER" /></td>
				</tr>
				<tr>
					<td>
						<button class="btn btn-outline-success" type="submit">작성</button>
						<button class="btn btn-outline-success" type="button" class="listgo">작성글 지우기</button>
					</td>
				</tr>

			</table>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
		integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
		integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
		crossorigin="anonymous"></script>
		
	
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