<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="@{/css/css/all.css}" rel="stylesheet">
<link href="@{/css/stars.css}" rel="stylesheet">
<link rel="stylesheet" href="resources/css/ind.css">
<title>리뷰 연습</title>
</head>
<body>
<%@ include file="inc/header.jsp" %>
 
<center>
<div >
    <h1>장 줄리안</h1>
    <p>장씨는 내 친구</p>
</div>

<div >
    <img src = 'resources/img/s1.png'  />
</div>
				
		
			<c:forEach begin="1" end="${rating }"> <!-- 디비에 저장된 별 불러오는것 -->
			⭐
			</c:forEach>
			</tr>
	</center>
<%@ include file="inc/footer.jsp" %>
</body>
</html>