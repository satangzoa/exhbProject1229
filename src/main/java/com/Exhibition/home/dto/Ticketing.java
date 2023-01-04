package com.Exhibition.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ticketing { //ticketing  예매한 티켓정보

	private int tnum;//티켓 번호
	private String mid; //사용자 아이디
	private String ticketName;//티켓이름
	private String rday; //티켓 사용날짜
	private String price;//티켓 가격
	private String count;//티켓 장수
	
	
	private MemberDto memberDto;
}

