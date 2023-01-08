package com.Exhibition.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewLike { //ment3 //시퀀스 ment3_seq
	
	private int rnum;//리뷰번호
	private String rating;//별점
	private String rid;//리뷰쓴사람아이디
	private String rcontent;//리뷰내용
	
}
