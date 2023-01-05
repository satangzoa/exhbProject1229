<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="@{/css/css/all.css}" rel="stylesheet">
<link href="@{/css/stars.css}" rel="stylesheet">
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
					
				
		<center>						
			<table border="0" cellspacing="0" cellpadding="10">
			<form action="comment2" method="get" name="board_frm">
			<tr>
				<td><span class="form-contro1">아 이 디 : </span></td>
				<td><input class="form-control summernote" type="text" name="rid" value="${memberId }" readonly="readonly"></td>
			</tr>
				<td><span class="form-control">질문내용 : </span></td>
				<td><textarea class="form-control summernote" rows="5" cols="30" name="rcontent" value="${rcontent }"></textarea></td>
			</tr>									
									
			<tr>
			<td colspan="2">
										
				<input class="btn btn-primary" type="submit" value="리뷰작성" >&nbsp;&nbsp;
				<input class="btn btn-primary" type="button" value="글목록" onclick="script:window.location='index'">
			</td>
			</tr>
			</form>							
			</table>
	</center>
<%@ include file="inc/footer.jsp" %>
</body>
</html>