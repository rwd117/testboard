<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
			a{
				text-decoration:none;
			}
			li {
				list-style: none;
			 	float: left;
			  	padding: 6px;
			  }
</style>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<title>Insert title here</title>
</head>
<body>
<h2>게시글 목록</h2>
<hr/>
<a href="write">[글작성]</a><br/>
<hr/>
<form>

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
		<td><a href="read?test_BNO=${board.test_BNO}
						 &page=${cri.page}
						 &perPageNum=${cri.perPageNum}
						 &searchType=${cri.searchType}
						 &keyword=${cri.keyword}">${board.test_TITLE}</a></td>
		<td>${board.test_CONTENT}</td>
		<td>${board.test_WRITER}</td>
		<td>${board.test_hit}</td>
		<td><fmt:formatDate value="${board.REGDATE}" pattern="yyyy-MM-dd"/></td>
	</tr>

</c:forEach>
</table>

<select name="searchType">
      <option value="a"<c:out value="${cri.searchType eq 'a' ? 'selected' : ''}" />>전체</option>
      <option value="t"<c:out value="${cri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      <option value="c"<c:out value="${cri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      <option value="w"<c:out value="${cri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
      <option value="tc"<c:out value="${cri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
</select>

    <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}"/>

    <button id="searchBtn" type="button">검색</button>

</form>
    
   
<ul>
   <c:if test="${pagemaker.prev }">
    	<li>
        	<a href='list?${pagemaker.makeSearch(pagemaker.startPage - 1)}'>[이전]</a>
    	</li>
   </c:if>
   <c:forEach begin="${pagemaker.startPage }" end="${pagemaker.endPage }" var="pageNum">
    	<li>
        	<a href="list${pagemaker.makeSearch(pageNum)}">${pageNum }</a>
    	</li>
   </c:forEach>
   <c:if test="${pagemaker.next && pagemaker.endPage >0 }">
    	<li>
        	<a href='list${pagemaker.makeSearch(pagemaker.endPage + 1)}'>[다음]</a>
    	</li> 
   </c:if>
  </ul>
  <br/><br/>
<hr/>

<script>
 $(function(){
	$('#searchBtn').click(function(){
		var url = document.location.href;
		url=url + "?searchType="+$("#searchBtn").val();
		url=url + "&keyword="+$("#keywordInput").val();
		location.href = url;
	});
 });
</script>

</body>
</html>