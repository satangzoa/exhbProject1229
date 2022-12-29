<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>상품장바구니 목록</title>
</head>
<body>
    <h2>장바구니 확인</h2>
   
          
       
          <!-- <c:choose>
        <c:when test="${map.count == 0}">-->
            
        </c:when>
        <c:otherwise>

        장바구니가 비어있습니다.
        
      <!--  <form name="form1" id="form1" method="post" action="${path}/shop/cart/update.do">-->
        <form name="form1" id="form1" method="post" action="">
            <table border="1">
                <tr>
                    <th>상품명</th>
                    <th>단가</th>
                    <th>수량</th>
                    <th>금액</th>
                    <th>취소</th>
                </tr>
                <c:forEach var="row" items="" varStatus="i">
                <tr>
                    <td>
                       상품이름 ${row.productName}
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
                      <!--  <a href="${path}/shop/cart/delete.do?cartId=${row.cartId}">삭제</a>-->
                        <a href="${path}/shop/cart/delete.do?cartId=${row.cartId}">삭제</a>
                    </td>
                </tr>
                </c:forEach>
                <tr>
                    <td colspan="5" align="right">
                        장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value=""/><br>
                        배송료 : ${map.fee}<br>
                        전체 주문금액  :<fmt:formatNumber pattern="###,###,###" value=""/>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="count" value="">
            <button type="submit" id="btnUpdate">수정</button>
        </form>
        </c:otherwise>
    </c:choose>
  <!--  <button type="button" id="btnList">상품목록</button>-->
  <a href="buy">사러가기</a>
</body>
</html>