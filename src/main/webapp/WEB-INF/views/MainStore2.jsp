<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>상품 상세정보</title>

</head>
<body>
<%@ include file="inc/header.jsp" %>
<div class="container">
    <h2 class="my-3 border-bottom pb-2">상품 상세정보</h2>
           
            	<img src="/resources/img/p.png">
                <table class="table table-bordered" style="height: 200px; width: 300px;">
                    <tr>
                        <td scope="col">전시회</td>
                        <td scope="col">푸와 만나보아요</td>
                    </tr>
                    <tr >
                        <td >가격</td>
                        <td>20000원${exhi.eprice }</td>
                    </tr>
                    <tr>
                        <td>상품소개</td>
                        <td>푸는 우리의 친구${exhi.eintro }</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <form name="board_frm" method="post" action="reservationPage2">
                                <input type="hidden" name="eid" value=" ">
                                <select name="count" >
                                      
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                        <option value="">5</option>
                                        <option value="">6</option>
                                        <option value="">7</option>
                                        <option value="">9</option>
                                        <option value="">10</option>
                                </select>&nbsp&nbsp개 &nbsp&nbsp
                                <input type="submit" value="예매하기" class="btn btn-primary my-2">
                                
                            </form>
                        
                           
                        </td>
                    </tr>
                </table>
                  <input type="submit" value="처음으로" class="btn btn-primary my-2">
           
    </div>
    <%@ include file="inc/footer.jsp" %>
</body>
</html>

 