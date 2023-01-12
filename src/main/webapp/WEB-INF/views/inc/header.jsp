<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet" >
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
	<!--     Fonts and icons     -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
	<title>sEEvisit</title>
</head>
<body>
	<% 
		String sessionId = (String) session.getAttribute("memberId");
		//로그인중이라면 로그인한 아이디가 저장되고 비로그인 중이면 sessionId==null 임
	%>
	
	<nav class="navbar navbar-expand-lg bg-light">
	      <div class="container-fluid">
	        <a class="navbar-brand" href="/">Seevisit</a>
	        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
	          <span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
	          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	            <li class="nav-item">
	              <a class="nav-link active" aria-current="page" href="ticket">예매</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="store">스토어</a>
	            </li>
	             
	            <li class="nav-item">
	              <a class="nav-link" href="boardList">공연검색</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="event">이벤트</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="reviewList">리뷰</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="comment">한 마디 적고가</a>
	            </li>
	             <li class="nav-item">
	              <a class="nav-link" href="Han">한줄</a>
	            </li>
	             <li class="nav-item">
	              <a class="nav-link" href="reviewLike">좋아요</a>
	            </li>
	            <li class="nav-item">
	            <% if(sessionId == null) { %>
	              <a class="nav-link" sec:authorize="isAnonymous()"  href="login">
	              	로그인
	              </a>
	             <% } else { %> 
	              <a class="nav-link" sec:authorize="isAuthenticated()" href="logout">로그아웃</a>
	             <% } %> 
	            </li>
	            <% if(sessionId == null) { %>
	            <li class="nav-item">
             		<a class="nav-link" sec:authorize="isAnonymous()"  href="join">회원가입</a>
          		</li>
          		<% } else { %> 
          		<li class="nav-item">
             		<a class="nav-link" sec:authorize="isAnonymous()"  href="ticketConfirm">예매확인/취소</a>
          		</li>
          		<li class="nav-item">
             		<a class="nav-link" sec:authorize="isAnonymous()"  href="mypage">마이페이지</a>
          		</li>
          		<% } %>	
	          </ul>
	          <form class="d-flex" role="search">
	            <input class="form-control me-2" type="search" placeholder="Search" aria-label="검색해주세요">
	            <button class="btn btn-outline-success" type="submit">search</button>
	          </form>
	        </div>
	      </div>
    </nav>
</body>
</html>