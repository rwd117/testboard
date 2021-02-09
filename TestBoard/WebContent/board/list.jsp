<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
<title>Insert title here</title>
</head>
<body>
<h2>�Խñ� ���</h2>
<hr/>
<a href="index">[Ȩ����]</a>
<a href="write">[���ۼ�]</a><br/>
<hr/>
<form>

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

<select name="searchType">
      <option value="a"<c:out value="${cri.searchType eq 'a' ? 'selected' : ''}"/>>��ü</option>
      <option value="t"<c:out value="${cri.searchType eq 't' ? 'selected' : ''}"/>>����</option>
      <option value="c"<c:out value="${cri.searchType eq 'c' ? 'selected' : ''}"/>>����</option>
      <option value="w"<c:out value="${cri.searchType eq 'w' ? 'selected' : ''}"/>>�ۼ���</option>
      <option value="tc"<c:out value="${cri.searchType eq 'tc' ? 'selected' : ''}"/>>����+����</option>
</select>

    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    <button id="searchBtn" type="button">�˻�</button>

</form>
    
    
<ul>
   <c:if test="${pagemaker.prev }">
    	<li>
        	<a href='<c:url value="list?page=${pagemaker.startPage-1 }"/>'>[����]</a>
    	</li>
   </c:if>
   <c:forEach begin="${pagemaker.startPage }" end="${pagemaker.endPage }" var="pageNum">
    	<li>
        	<a href="list?page=${pageNum}">${pageNum }</a>
    	</li>
   </c:forEach>
   <c:if test="${pagemaker.next && pagemaker.endPage >0 }">
    	<li>
        	<a href='<c:url value="list?page=${pagemaker.endPage+1 }"/>'>[����]</a>
    	</li>
   </c:if>
  </ul>
  <br/><br/>
<hr/>

</body>
</html>