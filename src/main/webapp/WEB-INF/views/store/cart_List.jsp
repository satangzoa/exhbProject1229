<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>상품장바구니 목록</title>
</head>
<body>
    <div class="container">
    <h2 class="my-3 border-bottom pb-2">장바구니 확인</h2>
         
        <form name="" id="" method="post" action="">
            <table class="table table-bordered" >
                <tr>
                    <th scope="col">상품명</th>
                    <th scope="col">상품가격</th>
                    <th scope="col">수량</th>
                    <th scope="col">총금액</th>
                    <th scope="col">취소</th>
                </tr>
                <tr>
                    <td>
                       짱구베게
                    </td>
                    <td style="width: 80px" align="right">
                        <fmt:formatNumber pattern="###,###,###" value=""/>
                    </td>
                    <td>
                        <input type="number" style="width: 40px" name="amount" value="" min="1">
                        <input type="hidden" name="productId" value="">
                    </td>
                    <td style="width: 100px" align="right">
                        <fmt:formatNumber pattern="###,###,###" value=""/>
                    </td>
                    <td>
                        <a href="">삭제</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" align="right">
                        장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value=""/><br>
                        배송료 :<br>
                        전체 주문금액  :<fmt:formatNumber pattern="###,###,###" value=""/>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="count" value="">
            <button type="submit" id="" class="btn btn-primary my-2">수정</button>
        </form>
  <a href="buy">사러가기</a>
</body>
</html>