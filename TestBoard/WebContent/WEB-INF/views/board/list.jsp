<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/include/top_menu.jsp" />
		<section id="container">
			<form>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>게시글 번호</th>
							<th>게시글 제목</th>
							<th>게시글 내용</th>
							<th>게시글 작성자</th>
							<th>게시글 조회수</th>
							<th>작성 날짜</th>
						</tr>
					</thead>

					<c:forEach var="board" items="${list}">

						<tr>
							<td>${board.test_BNO}</td>
							<td><a
								href="read?test_BNO=${board.test_BNO}
									 &page=${cri.page}
									 &perPageNum=${cri.perPageNum}
									 &searchType=${cri.searchType}
									 &keyword=${cri.keyword}">${board.test_TITLE}</a></td>
							<td>${board.test_CONTENT}</td>
							<td>${board.test_WRITER}</td>
							<td>${board.test_hit}</td>
							<td><fmt:formatDate value="${board.REGDATE}"
									pattern="yyyy-MM-dd" /></td>
						</tr>

					</c:forEach>
				</table>

				<div class="search row container">
					<div class="col-xs-2 col-sm-2 container">
						<select name="searchType" class="form-control">
							<option value="a"
								<c:out value="${cri.searchType eq 'a' ? 'selected' : ''}" />>전체</option>
							<option value="t"
								<c:out value="${cri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
							<option value="c"
								<c:out value="${cri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
							<option value="w"
								<c:out value="${cri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
							<option value="tc"
								<c:out value="${cri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						</select>
					</div>

					<div class="col-md container">
						<div class="input-group">
							<input class="form-control" type="text" name="keyword"
								id="keyword" />
							<button class="btn btn-outline-secondary" id="searchBtn"
								type="button">검색</button>
						</div>
					</div>
				</div>
				<br />

				<div class="col-md-4 container">
					<ul class="pagination">
						<c:if test="${pagemaker.prev }">
							<li><a class="btn btn-outline-primary"
								href='list?${pagemaker.makeSearch(pagemaker.startPage - 1)}'>이전</a>
							</li>
						</c:if>
						<c:forEach begin="${pagemaker.startPage }"
							end="${pagemaker.endPage }" var="pageNum">
							<li><a class="btn btn-outline-primary"
								href="list${pagemaker.makeSearch(pageNum)}">${pageNum }</a></li>
						</c:forEach>
						<c:if test="${pagemaker.next && pagemaker.endPage >0 }">
							<li><a class="btn btn-outline-primary"
								href='list${pagemaker.makeSearch(pagemaker.endPage + 1)}'>다음</a>
							</li>
						</c:if>
					</ul>
				</div>
				<hr />
			</form>
		</section>
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
		$(function() {
			$('#searchBtn').click(function() {
				var url = document.location.href;
				url = url + "?searchType=" + $("#searchBtn").val();
				url = url + "&keyword=" + $("#keywordInput").val();
				location.href = url;
			});
		});
	</script>
</body>
</html>