<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="inc/header.jsp" %>
	<center>
	<section id="main">
        <h2 id="board_title">자유게시판</h2>
        <div id="total_search">
          <form action="search_list">
          <div id="search">
            <div id="search_select">
              <select name="searchOption">
                <option value="stitle">공연제목</option>
                <option value="slocation">공연위치장소</option>
                <option value="sprice">공연가격</option>
              </select>
            </div>
            <div id="search_input"><input type="text" name="searchKey"></div>
          </div>
          </form>
        </div> <!-- total search 끝 -->
	 </center>
<div id="wrapper" >		
   	<!-- tab 메뉴-->
   	<div>
		   	<div id="exhiPosterWrap">
		   		<h3 class="mgt50">전체공연</h3>
				<ul class="nav nav-tabs mgt20" id="myTab" role="tablist">
				  <li class="nav-item" role="presentation">
				    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">전체공연</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">콘서트</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">연극</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">아동/가족</button>
				  </li>
				 
				</ul>
				<!-- 예매하기 -->
				<div class="tab-content" id="myTabContent">
				  <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
					<div class="container">
						<ul class="reservationWrap">
							<c:forEach items="${showList}" var="showDto" begin="0" end="3" step="1">
								<li>
									<div>
									${showDto.stitle}<br>
									
									<!-- 포스터이미지 -->
								      <c:if test="${showDto.fileDto.fileextension =='jpg' or showDto.fileDto.fileextension =='png' or showDto.fileDto.fileextension =='bmp' or showDto.fileDto.fileextension =='gif'}">
							        	<img width="300" src="/resources/uploadfiles/${showDto.fileDto.filename}">
							        <!--	<img width="300" src="${pageContext.request.contextPath}/resources/uploadfiles/${showDto.fileDto.filename}">-->
							         </c:if>
							         <!-- 포스터이미지 -->
									</div>
									<div class="rv_btnset">
										<ul>
											<li>
											<button type="button" class="btn btn-outline-secondary">
												<i class="material-icons" style="font-size: 16px;">favorite</i>
													좋아요
											</button>
											</li>
											<li>
												<button type="button" class="btn btn-primary" onclick="script:window.location='ticket'"">예매하기</button>
												
											</li>
										</ul>
								
									</div>
								</li>
							</c:forEach>	
						</ul>
					</div>
				  </div>
				  <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">...</div>
				  <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">...</div>
				  <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">...</div>
				
				</div>
			</div>	
				<!-- //예매하기 -->
			<!-- //tab -->	
			
		   	<div id="eventWrap" class="mgt50">
			   	<h3 class="h3">이벤트</h3>
			   		<ul>
			   		<c:forEach items="${eventList}" var="EventBDto" begin="0" end="2" step="1">
			   			<li>
			   				<div class="eventImg"></div>
			   				<div class="eventTitle">${EventBDto.qcontent}</div>
			   				<div class="eventDate">${EventBDto.qdate}</div>
			   			</li>
			   		</c:forEach>
		
			   		</ul>
		   	</div>
		   	
		  
        
		   	<div id="goodsWrap" class="mgt50">
			   	<h3>굿즈판매</h3>
			   	<div class="goodslist">
			   		<p class="goodImg"></p>
			   		<div class="goodsText">굿즈판매입니다</div>
			   	</div>	
			   	<div class="goodslist">
			   		<p class="goodImg"></p>
			   		<div class="goodsText">굿즈판매입니다</div>
			   	</div>	
		   	</div>
   		</div>
   <%@ include file="inc/footer.jsp" %>
  </div> 	
</body>
</html>