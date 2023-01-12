<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 예매</title>


</head>
<body>
<%@ include file="inc/header.jsp" %>
<div align="center">
	<h3>[전시회 티켓 예매]</h3>
	<table border="1">
	
		<tr >
		<td ><img src = 'resources/img/s1.png' width='150' height='150' /></td> 
		<td><img src = 'resources/img/s6.png' width='150' height='150' /></td> 
		<td><img src = 'resources/img/s7.png' width='150' height='150' /></td>
		</tr>
		<tr align='center'>
		<td ><input type='button' value=' 예매하기'  onclick="location.href='ticketing?tnum=1'"/></td> 
		<td><input type='button' value=' 예매하기'   onclick="location.href='ticketing?tnum=2'"/> </td> 
		<td><input type='button' value=' 예매하기' onclick="location.href='ticketing?tnum=3'"/></td>
		</tr>
	
		
	</table>
</div>
<%@ include file="inc/footer.jsp" %>
</body>
</html>