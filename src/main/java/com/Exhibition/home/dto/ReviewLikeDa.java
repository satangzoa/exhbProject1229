package com.Exhibition.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewLikeDa {//mentlike
	
	private int lnum;//시퀀스 자동생성번호
	private int mnum;//게시판 글 번호
	private String mid;//리뷰쓴사람아이디

	private ReviewLike reviewlike;
}
