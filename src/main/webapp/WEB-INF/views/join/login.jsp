<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%@ include file="../inc/header.jsp" %>
		<div id="wrapper">
			<h5>회원 로그인</h5>
			<form action="loginOk" method="post">
				<div>
					<label class="form-label">아이디</label>
					<input type="text" name="mid" class="form-control">
				</div>
				<div>
					<label class="form-label">비밀번호</label>
					<input type="password" name="mpw" class="form-control">
				</div>			
				<input type="submit" value="로그인" class="btn btn-primary my-2">
			</form>	
		</div>
	  <%@ include file="../inc/footer.jsp" %>		
</body>
</html>