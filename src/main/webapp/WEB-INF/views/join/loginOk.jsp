<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../inc/header.jsp" %>
	<table width="80%" border="0" cellspacing="0" cellpadding="10">
					<tr class="contentbox">
						<td class="content">
						<%
							int checkIdFlag = Integer.parseInt(request.getAttribute("checkIdFlag").toString()) ;
							int checkIdPwFlag = Integer.parseInt(request.getAttribute("checkIdPwFlag").toString()) ;
							if(checkIdFlag == 0){
			
						%>
						<script type="text/javascript">
							alert("입력하신 아이디는 존재하지 않습니다. 다시 확인해주세요");
							history.go(-1);
						</script>
						<%
							} else if(checkIdPwFlag == 0){
						%>
						<script type="text/javascript">
							alert("입력하신 비밀번호가 일치하지 않습니다.다시 확인해주세요");
							history.go(-1);
						</script>
						<%
							}
						%>
						
							${mid }님 로그인 하셨습니다. 반갑습니다.<br>
							${memberDto.mname }님의 가입일은 [${memberDto.mdate }] 입니다
						</td>
					</tr>
				</table>
<%@ include file="../inc/footer.jsp" %>				
</body>
</html>