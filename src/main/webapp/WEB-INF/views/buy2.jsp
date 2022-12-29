<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>상품 상세정보</title>

</head>
<body>

    <h2>상품 상세정보</h2>
    <table border="1">
        <tr>
            <td>
             <!--    <img src="${path}/images/${vo.productUrl}" width="340" height="300"> -->
            </td>
            <td>
                <table border="1" style="height: 300px; width: 400px;">
                    <tr align="center">
                        <td>상품명</td>
                        <td>상품이름<!-- ${vo.productName} --></td>
                    </tr>
                    <tr align="center">
                        <td>가격</td>
                       <!--  <td><fmt:formatNumber value="<!--${vo.productPrice}" pattern="###,###,###"/></td>-->
                        <td><fmt:formatNumber value="" pattern="###,###,###"/></td>
                    </tr>
                    <tr align="center">
                        <td>상품소개</td>
                        <td><!--${vo.productDesc}--></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                           <!-- <form name="form1" method="post" action="<${path}/shop/cart/insert.do">-->
                            <form name="form1" method="post" action="">
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
                                </select>&nbsp;개
                                <input type="submit" value="장바구니에 담기">
                            </form>
                         <!--   <a href="${path}/shop/product/list.do">상품목록</a>-->
                            <a href="cart_List">상품목록</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>

 <!-- <form name="form1" method="post" action="${path}/shop/cart/insert.do">-->
<form name="form1" method="post" action="">

<!--상품을 장바구니에 추가시키기 위해 상품id번호, 수량을 form태그 전송-->
<input type="hidden" name="productId" value="">

<!--현재의 상품ID를 입력받기 위해 hidden속성으로 처리-->
<select name="amount">
    <c:forEach begin="1" end="10" var="i">
        <!--<option value="${i}">${i}</option>-->
        <option value="">사과</option>
        <option value="">바나나</option>
    </c:forEach>
</select>