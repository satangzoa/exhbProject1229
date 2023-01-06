<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/board.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha512-rxThY3LYIfYsVCWPCW9dB0k+e3RZB39f23ylUYTEuZMDrN/vRqLdaCBo/FbvVT6uC2r0ObfPzotsfKF9Qc5W5g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/datepicker.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/jquery-ui.css">
<title>예약뷰페이지</title>

<style>
.checked {
  color: orange;
}
</style>

</head>

<body>

<%@ include file="inc/header.jsp" %>
	<div id="wrapper" class="boardWrap">
		<div class="board_title">
		 	<h4>${showView.stitle}</h4>
		 	<div class="star">
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star"></span>
				<span class="fa fa-star"></span>
				<span>9.1</span>
			</div>
		</div>
		<div class="show_detail">	
			 <div class="show_poster">
			 	<!-- 포스터이미지 -->
			      <c:if test="${fileDto.fileextension =='jpg' or fileDto.fileextension =='png' or fileDto.fileextension =='bmp' or fileDto.fileextension =='gif'}">
		        	<img width="300" src="${pageContext.request.contextPath}/resources/uploadfiles/${fileDto.filename}">
		         </c:if>
		         <!-- 포스터이미지 -->
				<ul class="likes">
					<li><i class="material-icons">favorite</i></li>
					<li>50</li>
					<li>좋아요</li>
				</ul>
			</div>
			<div class="pright-area">
				 <ul class="show_text">
				 	<li>장소 : ${showView.slocation}</li>
				 	<li>공연기간 : ${showView.sdday}</li>
				 	<li>공연시간 : ${showView.stime}</li>
				 	<li>관람연령 : ${showView.sage}</li>
				 	<li>가격 : ${showView.sprice} </li>
				 </ul>
				 <!-- 달력 -->
				
				 <button type="submit" class="btn btn-outline-dark" style="padding:8px 24px;font-size:20px;board:2px solid">예약하기</button>
				<table border="0" cellspacing="0" cellpadding="10">
                        <form action="review2" method="post" >
                           <tr>
                              <td><span class="content_text01">아이디:</span></td>
                              <td><input class="input_type01" type="text" name="rid" value="${memberId}"></td>
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
				 
			 </div>
			 
			 <div id="datepicker"></div>
		 </div>

	<!-- tab컨텐츠 -->
	<nav class="showview_tab clear mgt50">
	  <div class="nav nav-tabs" id="nav-tab" role="tablist">
	    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">관람후기</button>
	    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">캐스팅정보</button>
	    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">판매정보</button>
	    <button class="nav-link" id="nav-disabled-tab" data-bs-toggle="tab" data-bs-target="#nav-disabled" type="button" role="tab" aria-controls="nav-disabled" aria-selected="false">공연정보</button>
	  </div>
	</nav>
	<div class="tab-content" id="nav-tabContent">
	  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
		관람후기
	 </div>
	  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">캐스팅정보</div>
	  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">판매정보</div>
	  <div class="tab-pane fade" id="nav-disabled" role="tabpanel" aria-labelledby="nav-disabled-tab" tabindex="0">공연정보</div>
	</div>
	</div>
	<!-- tab컨텐츠 -->


<%@ include file="inc/footer.jsp" %>
</body>
</html>