package com.Exhibition.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class REVIEWSTARLIKE {//REVIEWSTARLIKE //rivewStarLike_seq
	
	private int rnum;//시퀀스 자동생성번호
	private int tnum;//게시판 글 번호
	private int liker;//좋아요 여부
	
}
