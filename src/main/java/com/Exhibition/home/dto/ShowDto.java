package com.Exhibition.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShowDto {

	private int snum; //번호
	private String stitle; //공연제목
	private String slocation; //공연위치장소
	private String sdday; //공연날짜
	private String stime; //공연시간
	private String sage; //관람나이
	private String sprice; //공연가격
	private String userid;//글쓴이의 아이디
	private int filecount;//첨부된 파일 개수
	
	private FileDto fileDto; //join 한 파일 테이블
}
