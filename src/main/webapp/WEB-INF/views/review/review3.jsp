<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/board.js"></script>
<link rel="stylesheet" href="resources/css/ind.css">
<title>리뷰다</title>
</head>
<body>
	<%@ include file="../inc/header.jsp" %>
	리뷰성공!
	<c:forEach begin="1" end="${rating }"> <!-- 디비에 저장된 별 불러오는것 -->
			⭐
			</c:forEach>
	</center>
	<%@ include file="../inc/footer.jsp" %>
</body>
</html>