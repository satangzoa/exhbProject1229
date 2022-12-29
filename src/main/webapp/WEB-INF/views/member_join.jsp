<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>
<form action="loginOk">
회원아이디<input type="text" name="muserid">
회원비밀번호<input type="text" name="mpw">
회원이름<input type="text" name="mname">
회원이메일<input type="text" name="memail">
<button type="submit">회원가입</button>
</form>
</body>
</html>