<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>sha.jsp</title>
  <script>
    'use strict';
    
    let str = '';
    function shaCheck() {
    	let pwd = myform.pwd.value;
    	if(pwd.trim() == "") {
    		alert("비밀번호를 입력하세요");
    		myform.pwd.focus();
    		return false;
    	}
    	
    	$.ajax({
    		url  : 'ShaOk.st',
    		type : 'post',
    		data : {pwd : pwd},
    		success:function(pwd) {
    			str += pwd + "<br/>";
    			demo.innerHTML = str;
    		},
    		error : function() { alert("전송오류"); }
    	});
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>비밀번호 암호화 연습(SHA)</h2>
  <form name="myform" method="post">
    <div class="input-group">
      <div class="input-group-text">비밀번호</div> 
    	<input type="password" name="pwd" id="pwd" value="1234" class="form-control"/>
    	<input type="button" value="비밀번호암호화" onclick="pwdCheck()" class="btn btn-success me-2"/>
    </div>
  </form>
</div>
<p><br/></p>
</body>
</html>