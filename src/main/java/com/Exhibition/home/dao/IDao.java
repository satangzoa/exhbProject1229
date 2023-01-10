package com.Exhibition.home.dao;

import java.util.ArrayList;
import java.util.List;

import com.Exhibition.home.dto.*;

public interface IDao {

	
	//회원관리
			public int memberJoin(String mid, String mpw, String mname, String meamil);//회원가입 INSERT
			public int checkId(String mid); // 아이디 존재여부 확인 SELECT
			public int checkIdAndPW(String mid,String mpw);//아이디와 비밀번호의 존재 및 일치 여부 SELECT 
			public MemberDto getMemberInfo(String mid);//아이디로 조회하여 회원정보 가져오기 SELECT
			public void memberModify(String mid, String mpw, String mname, String meamil);//아이디로 조회하여 회원정보 수정하기 UPDATE

	//질문게시판
			public void writeQuestion(String qid, String qname, String qcontent, String qemail);//질문하기 INSERT
			public List<QBoardDto> questionList(Criteria cri);//질문게시판 리스트 가져오기 SELECT
			public QBoardDto questionView (String qnum);//선택한 글 번호의 정보 가져오기 SELECT
			public void questionModify(String qnum,  String qname, String qcontent, String qemail );// 해당글 번호로 조회하여 질문 수정 UPDATE
			public void questionDelete(String qnum);//글삭제 DELETE
			public int boardAllCount();// 게시판 총 글의 개수 가져오기
			public BuyDto joinTest(String string);//조인테스트
			
			//장바구니
			
			//예매하기
			//예매
				//예매할 티켓 정보가져오기
			public Ticket tictekInfo(String tnum);
				
				//예매
			public int ticketing(String mid, String ticketName, String rday, String price , String count);
				
				//예매한 티켓 정보 가져오기//조인
			public List<Ticketing> ticketConfirm(String mid);
			
			//예매한 티켓 취소하기
			public void ticketDelete(String tnum);
			
		//리뷰다	
			
			//한 마디 적고가
			public int writeComment(String rid, String rcontent);
			
			//별점 달쟈
			public int writeMent(String rating,String rid, String rcontent);
			
			//리뷰에서 별점 보내보쟝
			public void writeReview(String rating, String rid, String rcontent);
			
			//리뷰 가져오기
			//public Ment2 getReview(String rnum);
			
			//리뷰에서 별점 결과 몽땅 가져오기
			public List<Ment2> reviewList();
			
			//public ShowDto joinTest(int snum);//조인테스트
			
			//메인에 이미지 뜨게하기
			public ArrayList<ShowDto> showList2();
			
			
			//리뷰에서 별점이랑 좋아요 보내보쟝2
			public int rivewLike(String rating, String rid, String rcontent);
			//리뷰에서 별점 결과 몽땅 가져오기2
			public List<ReviewLike> reviewList2();
			
			
			//좋아요 버튼 클릭
			public int likement(int mnum, String mid); 
			// 좋아요 여러번 방지
			public int likementCheck(String mid,int mnum);	
			
			//공연 검색 관련
			public ArrayList<ShowDto> ShowSearchTitleList(String searchKey);
			public ArrayList<ShowDto> ShowSearchLocarionList(String searchKey);
			public ArrayList<ShowDto> ShowSearchSpriceList(String searchKey);
			
			//공연정보 가져오기
			public List<ShowDto> showList(Criteria cri);
}




