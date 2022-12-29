package com.Exhibition.home.dto;

import com.Exhibition.home.dto.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageDto {

	private int startPage;//현재 화면에서 보여질 시작 페이지 번호
	private int endPage;// 현재 화면ㅇ서 보여질 마지막 페이지 번호
	private boolean prev;
	private boolean next;
	private int total;//전체 페이지 개수 select
	
	private Criteria cri; //Criteria 값을 멤버변수로 가져온단
	
	public PageDto(Criteria cri, int total) { //정해져 있는 두 가지를 가져온다
		//만약에 총 57개의 글이 존재(total=57)
		// 1 2 3 4 5 next
		//prev 6 7 8 9 10 next
		//prev 11 12
		//
		this.cri = cri;//초기화
		this.total = total;//초기화
		
		this.endPage = (int) Math.ceil((cri.getPageNum()/5.0)) * 5;//Math.ceil 올림
		this.startPage = this.endPage -4;//시작페이지 구하기
		
		int realEnd =  (int) Math.ceil((total*1.0)/cri.getAmount());//total*1.0=실수로 맹글어준댜 실제로 존재하지 않음
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage >1;
		this.next = this.endPage < realEnd;
		//이전 , 다음 페이지 버튼 출력 여부 결정
	}

	private void ceil(int i) {
		// TODO Auto-generated method stub
		
	}
}
