<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>상품 상세정보</title>

</head>
<body>
<%@ include file="../inc/header.jsp" %>
<div class="container">
    <h2 class="my-3 border-bottom pb-2">상품 상세정보</h2>
           
            	<img src="/resources/img/JJang.png">
                <table class="table table-bordered" style="height: 200px; width: 300px;">
                    <tr>
                        <td scope="col">상품명</td>
                        <td scope="col">짱구다</td>
                    </tr>
                    <tr >
                        <td >가격</td>
                        <td>20000원</td>
                    </tr>
                    <tr>
                        <td>상품소개</td>
                        <td>짱구인형은 역시 귀엽다</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <form name="" method="post" action="cart_List">
                                <input type="hidden" name="productId" value="">
                                <select name="amount">
                                    <c:forEach begin="1" end="10" var="i">
                                       <!-- <option value="">${i}</option>-->
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                        <option value="">5</option>
                                        <option value="">6</option>
                                        <option value="">7</option>
                                        <option value="">9</option>
                                        <option value="">10</option>
                                    </c:forEach>
                                </select>&nbsp&nbsp&nbsp개 &nbsp&nbsp
                                <input type="submit" value="장바구니에 담기" class="btn btn-primary my-2">
                                
                            </form>
                        
                           
                        </td>
                    </tr>
                </table>
                  <input type="submit" value="상품목록" class="btn btn-primary my-2">
           
    </div>
    <%@ include file="../inc/footer.jsp" %>
</body>
</html>

 