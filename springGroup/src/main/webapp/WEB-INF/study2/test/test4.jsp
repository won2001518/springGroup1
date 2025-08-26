<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>test4.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 WEB-INF 폴더에 위치한 test4.jsp파일 입니다.</h2>
  <p><img src="${ctp}/images/4.jpg" width="200px" /></p>
  <hr/>
  <p><a href="${ctp}/study2/TestMenu" class="btn btn-success">메뉴로이동</a></p>
</div>
<p><br/></p>
</body>
</html>