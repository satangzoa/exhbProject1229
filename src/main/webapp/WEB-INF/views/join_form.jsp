<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="inc/header.jsp" %>
	<div id="wrapper">
		<h5>회원가입</h5>
		<form action="joinOk" method="post" name="join_frm">
	
			<div>
				<label class="form-label">아이디</label>
				<input type="text" name="mid" class="form-control">
			</div>
			<div>
				<label class="form-label">비밀번호</label>
				<input type="password" name="mpw" class="form-control"></textarea>
			</div>
			<div>
				<label class="form-label">이름</label>
				<input type="text" name="mname" class="form-control" >
			</div>
			<div>
				<label class="form-label">이메일</label>
				<input type="text" name="memail" class="form-control">
			</div>
			<input type="submit" value="회원가입" class="btn btn-primary my-2" onclick="joinCheck()">
			<input type="text" value="취소" class="btn btn-primary" onclick="" style="width:60px">
		</form>
	</div>		
	<%@ include file="inc/footer.jsp" %>
</body>
</html>