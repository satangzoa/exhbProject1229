package com.Exhibition.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class exhi { //exhi

	private String eid;//전시회 아이디
	private String ename;//전시회 이름
	private int eprice;//전시회 가격
	private String eintro;//전시회 소개

	
}
