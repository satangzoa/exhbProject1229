package com.Exhibition.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ment2 { //ment2
	private int rnum;//리뷰번호
	private String rating;//별점
	private String rid;//리뷰쓴사람아이디
	private String rcontent;//리뷰내용
	
	
}
