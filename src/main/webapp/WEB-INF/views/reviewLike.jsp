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
<link rel="stylesheet" type="text/css" th:href="@{/css/bootstrap.min.css}">
<style type="text/css">

</style>
<title>리뷰다</title>
<script >

</script>
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
                        <form action="reviewLike2" method="post" >
                  
                   <input style="width: 124px; height: 58px;"
					class="btn btn-outline-danger" id=""  name="liker"  font size="5px" value="♥"  >
					
									
						
                    <!--        <button type="button" class="btn btn-outline-secondary" id="">
						<i class="material-icons" style="font-size: 16px;">♥</i>
									좋아요
						</button>
						
				  	<a href=""  class="btn btn-primary my-2">
			   			♥<span class="badge text-bg-secondary"  text="" id="liker"></span>
			   		</a>-->  
						
                           <tr>
                              <td><span class="content_text01">아이디:</span></td>
                              <td><input class="input_type01" type="text" name="rid" value="${memberId}"></td>
                           </tr>
                           <div name="myform" id="myform" method="post"  >
							   <fieldset>
							        <legend></legend>
							        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
							        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
							        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
							        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
							        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
							    </div>
                              <tr>
                              <td><span class="content_text01">리뷰:</span></td>
                              <td><input class="input_type01" type="text" name="rcontent" value="${rcontent}"></td>
                           </tr>
									 
                              <td colspan="2" align="center">

                                 <input class="button_type01" type="submit" value="리뷰쓰기"  >&nbsp;&nbsp; 
                                 <input class="button_type01" type="button" value="리뷰취소" onclick="script:window.location='index'">
                              </td>
                           </tr>
                        </form>
                     </table>
	</center>
	<%@ include file="inc/footer.jsp" %>
</body>
</html>