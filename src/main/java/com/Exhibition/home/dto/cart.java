package com.Exhibition.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class cart { //table cart 장바구니 테이블

	private String cartId; // 장바구니 번호
	private String userId; // 사용자 아이디
	private String userName; // 사용자 이름
	private int productId; // 상품 번호
	private String productName; // 상품 이름
	private int productPrice; // 상품 단가
	private int amount; // 구매 수량
	private int money; // 상품 가격
}
