<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/join.js"></script>
<title>전시회 예매</title>
</head>
<body>
	<%@ include file="inc/header.jsp" %>
	<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox">
				<span class="title01">전시회 예매</span>
			</td>
		</tr>
		<tr>
			<td class="titlebox">
				<span class="title02">시회 시회 시회</span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
				<table width="80%" border="0" cellspacing="0" cellpadding="10">
					<tr class="contentbox">
						<td class="content">
							<center>						
							<table border="0" cellspacing="0" cellpadding="10">
									<tr>
										<td colspan="2" align="center"><span class="content_text01">회원 정보 수정 완료</span></td>
									</tr>
									<tr>
										<td><span class="content_text01">아 이 디 : </span></td>
										<td>${memberDto.mid }</td>
									</tr>									
									<tr>
										<td><span class="content_text01">비밀번호 : </span></td>
										<td>${memberDto.mpw }</td>
									</tr>
									<tr>
										<td><span class="content_text01">이&nbsp;&nbsp;&nbsp;&nbsp;름 : </span></td>
										<td>${memberDto.mname }</td>
									</tr>
									<tr>
										<td><span class="content_text01">이 메 일 : </span></td>
										<td>${memberDto.memail }</td>
									</tr>
									
									<tr>
										<td colspan="2">
											<input class="button_type01" type="button" value="정보수정" onclick="script:window.location='mypage'">&nbsp;&nbsp;
											<input class="button_type01" type="button" value="수정취소" onclick="script:window.location='index'">
										</td>
									</tr>
														
							</table>
							</center>							
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