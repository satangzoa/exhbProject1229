<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>티켓 상세정보</title>

</head>
<body>
<%@ include file="inc/header.jsp" %>
<div class="container">
    <h2 class="my-3 border-bottom pb-2">티켓 상세정보</h2>
           
            	<img src="/resources/img/s1.png">
                <table class="table table-bordered" style="height: 200px; width: 300px;">
                    <tr>
                        <td scope="col">상품명</td>
                        <td scope="col">${ticketName }</td>
                    </tr>
                    <tr >
                        <td >가격</td>
                        <td>${tprice }</td>
                    </tr>
                    <tr>
                        <td>상품소개</td>
                        <td>소개소개소개</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <form name="" method="post" action="cart_List">
                                <input type="hidden" name="productId" value="">
                                <select name="count">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                </select>&nbsp&nbsp&nbsp개 &nbsp&nbsp
                                <input type="submit" value="예매하기" class="btn btn-primary my-2">
                                
                            </form>
                        <input type="submit" value="상품목록" class="btn btn-primary my-2" >
                           
                        </td>
                    </tr>
                       
                </table>
               
           
    </div>
    <%@ include file="inc/footer.jsp" %>
</body>
</html>

 