<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrapper" >	
	<%@ include file="inc/header.jsp" %>
	
   	<!-- tab 메뉴-->
   	<div>
		   	<div id="exhiPosterWrap" class="mgt50">
		   		<h3>전체공연</h3>
				<ul class="nav nav-tabs mgt20" id="myTab" role="tablist">
				  <li class="nav-item" role="presentation">
				    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">뮤지컬</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">콘서트</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">연극</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">클래식/무용</button>
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
							<li>
								<div>
								  <img src="..." class="exhiPoster">
								
								</div>
								<div class="rv_btnset">
									<ul>
										<li><button type="button" class="btn btn-outline-secondary"><i class="fa-regular fa-heart"></i>좋아요</button></li>
										<li><button type="button" class="btn btn-primary">예매하기</button></li>
									</ul>
							
								</div>
							</li>
							<li>
								<div>
								  <img src="..." class="exhiPoster">
								
								</div>
								<div class="rv_btnset">
									<ul>
										<li><button type="button" class="btn btn-outline-secondary"><span></span>좋아요</button></li>
										<li><button type="button" class="btn btn-primary">예매하기</button></li>
									</ul>
							
								</div>
							</li>
							<li>
								<div>
								  <img src="..." class="exhiPoster">
								
								</div>
								<div class="rv_btnset">
									<ul>
										<li><button type="button" class="btn btn-outline-secondary"><span></span>좋아요</button></li>
										<li><button type="button" class="btn btn-primary">예매하기</button></li>
									</ul>
							
								</div>
							</li>
							<li>
								<div>
								  <img src="..." class="exhiPoster">
								
								</div>
								<div class="rv_btnset">
									<ul>
										<li><button type="button" class="btn btn-outline-secondary">좋아요</button></li>
										<li><button type="button" class="btn btn-primary">예매하기</button></li>
									</ul>
							
								</div>
							</li>
					
						</ul>
					</div>
				  </div>
				  <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">...</div>
				  <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">...</div>
				  <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">...</div>
				  <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">...</div>
				</div>
			</div>	
				<!-- //예매하기 -->
			<!-- //tab -->	
			
		   	<div id="eventWrap" class="mgt50">
			   	<h3 class="h3">이벤트</h3>
			   		<ul>
			   			<li>
			   				<div class="eventImg"></div>
			   				<div class="eventTitle">뮤지컬 〈물랑루즈!〉 아시아 초연 (Moulin Rouge! The Musical)</div>
			   				<div class="eventDate">2022.12.16 ~ 2023.03.05</div>
			   			</li>
			   			<li>
			   				<div class="eventImg"></div>
			   				<div class="eventTitle">뮤지컬 〈물랑루즈!〉 아시아 초연 (Moulin Rouge! The Musical)</div>
			   				<div class="eventDate">2022.12.16 ~ 2023.03.05</div>
			   			</li>
			   			<li>
			   				<div class="eventImg"></div>
			   				<div class="eventTitle">뮤지컬 〈물랑루즈!〉 아시아 초연 (Moulin Rouge! The Musical)</div>
			   				<div class="eventDate">2022.12.16 ~ 2023.03.05</div>
			   			</li>
			   		
		
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