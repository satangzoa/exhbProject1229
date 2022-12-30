package com.Exhibition.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QBoardDto {//aboard //qnum qid qname qcontent qemail qdate

	private int qnum;
	private String qid;
	private String qname;
	private String qcontent;
	private String qemail;
	private String qdate;
	
	
}
