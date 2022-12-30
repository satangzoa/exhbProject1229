package com.Exhibition.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDto {//상품테이블 product

	private int pId;//상품 번호
	private String pname;//상품 이름
	private String pprice;//상품 가격

}
