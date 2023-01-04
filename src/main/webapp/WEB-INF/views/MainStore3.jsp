<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
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
								<form action="memberModifyOk" method="post" name="join_frm">
									<tr>
										<td><span class="content_text01">아 이 디 : </span></td>
										<td><input class="input_type01" type="text" name="eid" value="${exhi.eid }" readonly="readonly"></td>
									</tr>
									
									
									<tr>
										<td><span class="content_text01">이&nbsp;&nbsp;&nbsp;&nbsp;름 : </span></td>
										<td><input class="input_type01" type="text" name="ename" value="${exhi.ename }"></td>
									</tr>
									<tr>
										<td><span class="content_text01">가격 : </span></td>
										<td><input class="input_type01" type="text" name="eprice" value="${exhi.eprice }"></td>
									</tr>
									<tr>
										<td><span class="content_text01">전시회소개 : </span></td>
										<td><input class="input_type01" type="text" name="eintro" value="${exhi.eintro}"></td>
									</tr>
									<tr>
										<td colspan="2">
											<input class="button_type01" type="button" value="예매하기" onclick="">&nbsp;&nbsp;
											<input class="button_type01" type="button" value="처음으로" onclick="script:window.location='index'">
										</td>
									</tr>
								</form>							
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