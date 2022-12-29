<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>상품 목록</title>
</head>
<body>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 목록</title>
</head>
<body>
<%@ include file="inc/header.jsp" %>
    <h2>상품목록</h2>
    <table border="1">
        <tr>
            <th>상품ID번호</th>
            <th>상품이미지</th>
            <th>상품명</th>
            <th>가격</th>
        </tr>
        <c:forEach var="row" items="${list}">
        <tr>
            <td>
                ${pro.productId}
            </td>
            <td>
                <a href="${path}/shop/product/detail/${pro.productId}">
                    <img src="${path}/images/${pro.productUrl}" width="120ox" height="110px">
                </a>
            </td>
            <td>
                <a href="${path}/shop/product/detail/${pro.productId}">${pro.productName}</a>
            </td>
            <td>
                <fmt:formatNumber value="${pro.productPrice}" pattern="###,###,###"/>
            </td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>
    <h2>상품목록</h2>
    <table border="1">
        <tr>
            <th>상품ID번호</th>
            <th>상품이미지</th>
            <th>상품명</th>
            <th>가격</th>
        </tr>
        <c:forEach var="row" items="${list}">
        <tr>
            <td>
                ${pro.productId}
            </td>
            <td>
                <a href="${path}/shop/product/detail/${pro.productId}">
                    <img src="${path}/images/${pro.productUrl}" width="120ox" height="110px">
                </a>
            </td>
            <td>
                <a href="${path}/shop/product/detail/${pro.productId}">${pro.productName}</a>
            </td>
            <td>
                <fmt:formatNumber value="${pro.productPrice}" pattern="###,###,###"/>
            </td>
        </tr>
        </c:forEach>
    </table>
    <%@ include file="inc/footer.jsp" %>
</body>
</html>