<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 조인 연습 -->
	회원아이디 : ${buyInfo.mid }<br>
	이름 : ${buyInfo.memberDto.mname }<br>
	
	상품아이디 : ${buyInfo.productId }<br>
	수량 : ${buyInfo.count }<br>
</body>
</html>