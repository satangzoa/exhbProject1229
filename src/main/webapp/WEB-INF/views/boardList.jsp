<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css">
<title>검색해보쟈</title>
</head>
<body>
	<%@ include file="inc/header.jsp" %>
	<center>
	
	<table width="90%" border="0" cellspacing="0" cellpadding="10">
		<tr>
			<td class="titlebox">
				<span class="title01">공연검색해보쟈</span>
			</td>
		</tr>
		<tr>
			<td class="titlebox">
				<span class="title02">공연공연공연</span>
			</td>
		</tr>
		<tr>
			<td>
		
				<center>
				<table width="90%" border="0" cellspacing="0" cellpadding="10">
					<tr class="contentbox">
						<td class="content">
							<br><br>
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
							<center>
							<table width="80%" border="0" cellspacing="0" cellpadding="10">
								<tr>
									<th class="board_title">번호</th>
									<th class="board_title">공연제목</th>
									<th class="board_title" >공연위치장소</th>
									<th class="board_title">공연날짜</th>
									<th class="board_title">공연시간</th>
									<th class="board_title">관람나이</th>
									<th class="board_title">공연가격</th>
								</tr>
								<c:forEach items="${qdtos }" var="qdto">
								<tr>
									<td class="board_content01">${qdto.snum }</td>
									<td class="board_content01">${qdto.stitle }</td>
									<td class="board_content01">${qdto.slocation }</td>
									<td class="board_content01">${qdto.sdday }</td>
									<td class="board_content01">${qdto.stime }</td>
									<td class="board_content01">${qdto.sage }</td>
									<td class="board_content01">${qdto.sprice }</td>
								</c:forEach>
								<tr>
									<td colspan="5" align="center">
										<c:if test="${pageMaker.prev }">
											<a href="boardList?pageNum=${pageMaker.startPage-5 }">Prev</a>&nbsp;&nbsp;&nbsp;
										</c:if>										
										<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="snum">
											<c:choose>
											<c:when test="${currPage == snum}">
											<u>${snum}</u>&nbsp;&nbsp;&nbsp;
											</c:when>
											<c:otherwise>
											<a href="boardList?pageNum=${snum}">${snum}</a>&nbsp;&nbsp;&nbsp;
											</c:otherwise>
											</c:choose>																					
										</c:forEach>
										<c:if test="${pageMaker.next }">
											<a href="boardList?pageNum=${pageMaker.startPage+5 }">Next</a>
										</c:if>	
									</td>
								</tr>	
								
							</table>
							</center>
							<br>						
						</td>						
					</tr>
					
				</table>
				</center>			
			</td>
		</tr>
	</table>
	</center>
	<%@ include file="inc/footer.jsp" %>
</body>
</html>