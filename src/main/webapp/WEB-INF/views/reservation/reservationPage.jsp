<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="inc/header.jsp" %>
    <style>
        .input-group {
            margin-bottom : 15px
        }
        .img-div {
            margin-bottom : 10px
        }
        .fieldError {
            color: #bd2130;
        }
    </style>

<div id="wrapper">
    <form action="" method="post" name="join_frm" >

        <p class="h2">
            상품 등록
        </p>

        <input type="hidden" >

        <div class="form-group">
            <select  class="custom-select">
                <option value="SELL">판매중</option>
                <option value="SOLD_OUT">품절</option>
            </select>
        </div>

        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">상품명</span>
            </div>
            <input type="text"  class="form-control" placeholder="상품명을 입력해주세요">
        </div>
        <p  class="fieldError"></p>

        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">가격</span>
            </div>
            <input type="number" class="form-control" placeholder="상품의 가격을 입력해주세요">
        </div>
        <p  class="fieldError"></p>

        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">재고</span>
            </div>
            <input type="number"  class="form-control" placeholder="상품의 재고를 입력해주세요">
        </div>
        <p  class="fieldError"></p>

        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">상품 상세 내용</span>
            </div>
            <textarea class="form-control" aria-label="With textarea" ></textarea>
        </div>
        <p  class="fieldError"></p>

        <div >
            <div class="form-group" >
                <div class="custom-file img-div">
                    <input type="file" class="custom-file-input" name="itemImgFile">
                    <label class="custom-file-label" text="상품이미지 "></label>
                </div>
            </div>
        </div>

        <div >
            <div class="form-group">
                <div class="custom-file img-div">
                    <input type="file" class="custom-file-input" name="itemImgFile">
                    <input type="hidden" name="itemImgIds" >
                    <label class="custom-file-label":text=" : '상품이미지' "></label>
                </div>
            </div>
        </div>

        <div  style="text-align: center">
            <button action="" type="submit" class="btn btn-primary">저장</button>
            <button action="" type="submit" class="btn btn-primary">수정</button>
        </div>
        
        </div>
       

    </form>

</div>

</html>