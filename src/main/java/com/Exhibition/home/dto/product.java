package com.Exhibition.home.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class product {//table product 상품테이블

	    private String productid;
	    private String productName; // 상품이름
	    private String productPrice; // 상품가격
	    private String productDesc; // 상품 상세정보
	    private String productUrl; // 상품이미지 경로
	    private MultipartFile productPhoto; // 상품이미지파일
}
