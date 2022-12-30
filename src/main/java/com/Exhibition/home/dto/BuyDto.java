package com.Exhibition.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BuyDto { //장바구니 table cart

	private String cartId;//장바구니 아이디
	private String mid;//사용자 아이디
	private String productId;//상품아이디
	private int count;//수량

	private MemberDto memberDto;
}
