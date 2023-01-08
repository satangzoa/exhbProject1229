<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/title.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css"> 
</head>
<body>
<%@ include file="inc/header.jsp" %>

	${mname } 님 회원 가입을 축하드립니다.<br>
	가입하신 아이디는 ${mid }입니다

<%@ include file="inc/footer.jsp" %>
</body>
</html>