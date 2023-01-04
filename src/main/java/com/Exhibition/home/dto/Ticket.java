package com.Exhibition.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ticket { //ticket 전시회 티켓 정보
	
	private String tnum;//티켓 번호
	private String mid; //티켓 아이디
	private String ticketName; //티켓이름
	private String count;//티켓 매수
	private String price;//티켓가격
	

}
