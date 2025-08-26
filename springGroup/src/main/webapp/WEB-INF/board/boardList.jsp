<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/include/bs5.jsp" />
  <title>boardLists.jsp</title>
  <script>
    'use strict';
    
    function pageSizeCheck() {
    	let pageSize = $("#pageSize").val();
    	location.href = "BoardList.bo?pageSize="+pageSize;
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<table class="table table-borderless m-0 p-0">
	  <tr>
	    <td colspan="2"><h2 class="text-center mb-3">게시판 리스트</h2></td>
	  </tr>
	  <tr>
      <td><a href="BoardInput.bo" class="btn btn-success btn-sm">글쓰기</a></td>
      <td class="text-end">
        <select name="pageSize" id="pageSize" onchange="pageSizeCheck()">
          <option ${pageSize==5  ? 'selected' : ''}>5</option>
          <option ${pageSize==10 ? 'selected' : ''}>10</option>
          <option ${pageSize==15 ? 'selected' : ''}>15</option>
          <option ${pageSize==20 ? 'selected' : ''}>20</option>
          <option ${pageSize==30 ? 'selected' : ''}>30</option>
        </select>
      </td>
    </tr>
  </table>
  <table class="table table-hover text-center">
    <tr class="table-secondary">
    	<th>번호</th>
    	<th>글제목</th>
    	<th>글쓴이</th>
    	<th>올린날짜</th>
    	<th>조회수</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <tr>
        <td>${curScrStartNo}</td>
        <td class="text-start"><a href="BoardContent.bo?idx=${vo.idx}" class="text-decoration-none text-dark link-primary">${vo.title}</a></td>
        <td>${vo.nickName}</td>
        <td>${vo.wDate}</td>
        <td>${vo.readNum}</td>
      </tr>
      <c:set var="curScrStartNo" value="${curScrStartNo - 1}" />
    </c:forEach>
  </table>
<!-- 블록페이지 시작 -->
	<%-- 
	<div class="text-center">
	  <c:if test="${pag > 1}">[<a href="BoardList.bo?pag=1&pageSize=${pageSize}" class="text-decoration-none text-dark link-primary">첫페이지</a>]</c:if>
	  <c:if test="${curBlock > 0}">[<a href="BoardList.bo?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}" class="text-decoration-none text-dark link-primary">이전블록</a>]</c:if>
	  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
	  	<c:if test="${i <= totPage && i == pag}">[<a href="BoardList.bo?pag=${i}&pageSize=${pageSize}" class="text-decoration-none text-dark link-primary"><font color="red"><b>${i}</b></font></a>]</c:if>
	  	<c:if test="${i <= totPage && i != pag}">[<a href="BoardList.bo?pag=${i}&pageSize=${pageSize}" class="text-decoration-none text-dark link-primary">${i}</a>]</c:if>
	  </c:forEach>
	  <c:if test="${curBlock < lastBlock}">[<a href="BoardList.bo?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}" class="text-decoration-none text-dark link-primary">다음블록</a>]</c:if>
	  <c:if test="${pag < totPage}">[<a href="BoardList.bo?pag=${totPage}&pageSize=${pageSize}" class="text-decoration-none text-dark link-primary">마지막페이지</a>]</c:if>
	</div>
	--%>
	<div class="pagination justify-content-center">
	  <c:if test="${pag > 1}"><a href="BoardList.bo?pag=1&pageSize=${pageSize}" class="page-item page-link text-decoration-none text-dark link-primary">첫페이지</a></c:if>
	  <c:if test="${curBlock > 0}"><a href="BoardList.bo?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}" class="page-item page-link text-decoration-none text-dark link-primary">이전블록</a></c:if>
	  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
	  	<c:if test="${i <= totPage && i == pag}"><a href="BoardList.bo?pag=${i}&pageSize=${pageSize}" class="page-item page-link active text-decoration-none bg-secondary border-secondary">${i}</a></c:if>
	  	<c:if test="${i <= totPage && i != pag}"><a href="BoardList.bo?pag=${i}&pageSize=${pageSize}" class="page-item page-link text-decoration-none text-dark link-primary">${i}</a></c:if>
	  </c:forEach>
	  <c:if test="${curBlock < lastBlock}"><a href="BoardList.bo?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}" class="page-item page-link text-decoration-none text-dark link-primary">다음블록</a></c:if>
	  <c:if test="${pag < totPage}"><a href="BoardList.bo?pag=${totPage}&pageSize=${pageSize}" class="page-item page-link text-decoration-none text-dark link-primary">마지막페이지</a></c:if>
	</div>
<!-- 블록페이지 끝 -->
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>