<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<%@ include file="inc/header.jsp" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="@{/css/css/all.css}" rel="stylesheet">
<link href="@{/css/stars.css}" rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>review</title>
    <link rel="stylesheet" href="resources/css/ind.css">
</head>


<center>
	리뷰OK!
	
     
	 	<form action="reviewDelete" method="get" >
                       <c:forEach items="${rList}" var="view">
                       <tr>
                              <td><span class="content_text01">리뷰번호:</span></td>
                              <td><input class="input_type01" type="text" name="rnum" value="${view.rnum}"></td>
                           </tr>
                        <tr>
                              <td><span class="content_text01">아이디:</span></td>
                              <td><input class="input_type01" type="text" name="rid" value="${view.rid}"></td>
                           </tr>
                            <tr>
                              <td><span class="content_text01">별점:</span></td>
                               <td><input class="input_type01" type="text" name="rating"  begin="1" end="${view.rating }" >⭐</td>
                           </tr>
                           
                              <tr>
                              <td><span class="content_text01">리뷰:</span></td>
                              <td><input class="input_type01" type="text" name="rcontent" value="${view.rcontent}"></td>
                           </tr>
									 
                              <td colspan="2" align="center">

                                 <input class="button_type01" type="button" value="리뷰쓰기"  onclick="script:window.location='review'">&nbsp;&nbsp; 
                                 <input class="button_type01" type="button" value="처음으로" onclick="script:window.location='index'">
                              </td>
                           </tr>
                           </c:forEach>
                          
                        </form>
                       
	</center>
	<%@ include file="inc/footer.jsp" %>
</body>
</html>
