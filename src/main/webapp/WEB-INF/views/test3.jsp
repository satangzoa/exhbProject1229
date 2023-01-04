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
	회원아이디 : ${ticketConfirm.emember.mid }<br>
	회원이름 : ${ticketConfirm.emember.mname }<br>
	티켓이름 : ${ticketConfirm.memberDto.ticketName }<br>
	
	티켓가격 : ${ticketConfirm.price }<br>
	티켓수량 : ${ticketConfirm.count }<br>
</body>
</html>