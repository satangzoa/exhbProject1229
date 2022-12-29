package com.Exhibition.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BuyDto { //table tbl_cart

	private int cart_id;
	private int user_id;
	private int product_id;
	private int amount;
	
}
