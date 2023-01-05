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
				
		<center>						
			<table border="0" cellspacing="0" cellpadding="10">
			<form action="Han2" method="get" name="board_frm">
			<tr>
				<td><span class="form-contro1">아 이 디 : </span></td>
				<td><input class="form-control summernote" type="text" name="rid" value="${memberId }" readonly="readonly"></td>
			</tr>
			<div name="myform" id="myform" method="post"  >
			   <fieldset>
			        <legend>별점</legend>
			        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
			        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
			        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
			        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
			        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
			    </div>
				<td><span class="form-control">질문내용 : </span></td>
				<td><textarea class="form-control summernote" rows="5" cols="30" name="rcontent" value="${rcontent }"></textarea></td>
			</tr>									
									
			<tr>
			<td colspan="2">
										
				<input class="btn btn-primary" type="submit" value="리뷰작성" >&nbsp;&nbsp;
				<input class="btn btn-primary" type="button" value="처음으로" onclick="script:window.location='index'">
			</td>
			</tr>
			</form>							
			</table>
	</center>
<%@ include file="inc/footer.jsp" %>
</body>
</html>