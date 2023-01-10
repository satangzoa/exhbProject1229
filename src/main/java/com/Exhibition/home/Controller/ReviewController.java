package com.Exhibition.home.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Exhibition.home.dao.IDao;
import com.Exhibition.home.dto.*;

@Controller
public class ReviewController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping (value ="comment")
	public String comment() {
		
		
		return "comment";
	}
	

	@RequestMapping (value ="comment2")
	public String comment2(HttpServletRequest request, Model model) {
		
		String rid = request.getParameter("rid");
		String rcontent = request.getParameter("rcontent");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.writeComment(rid, rcontent);
		return "comment2";
	}
	
	@RequestMapping (value ="Han")
	public String Han() {
		
		return "Han";
	}
	
	@RequestMapping (value ="Han2")
	public String Han2(HttpServletRequest request, Model model) {
		
		String rating = request.getParameter("rating");
		String rid = request.getParameter("rid");
		String rcontent = request.getParameter("rcontent");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.writeMent(rating,rid,rcontent);
		
		return "Han2";
	}
	


//	@RequestMapping (value ="review3")
//	public String review3(Model model) {
//		
//		IDao dao = sqlSession.getMapper(IDao.class);
//		
//		Ment2 ment2 = dao.getReview("3");
//		model.addAttribute("ment2", ment2);
//		model.addAttribute("rating",Integer.parseInt(ment2.getRating()));
////		
//		
//		return "review3";
//	}
	
//	@RequestMapping (value ="reviewOk")//리뷰 하나만 가져와서 실패
//	public String review(Model model) {
//		
//		IDao dao = sqlSession.getMapper(IDao.class);
//		List<Ment2> rList = dao.reviewList("3");//리뷰 하나만 가져온다
//		
//		model.addAttribute("rList", rList);
////		model.addAttribute("rating",Integer.parseInt(rList.get(0)));
//		//model.addAttribute("rating",Integer.parseInt(rList.getRating()));
//		return "reviewOk";
//	}
	
	@RequestMapping (value ="review")
	public String review() {
	
		return "review";
	}
	
	@RequestMapping (value ="reviewList")//리뷰 첫화면에 리스트가 뜨게해놓음
	public String reviewOk(Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		List<Ment2> rList = dao.reviewList();
		
		model.addAttribute("rList", rList);
		return "reviewOk";
	}
	
	@RequestMapping (value ="reviewOk")
	public String reviewOk(HttpServletRequest request, Model model)  {
		
		String rating = request.getParameter("rating");
		String rid = request.getParameter("rid");
		String rcontent = request.getParameter("rcontent");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.writeReview(rating, rid, rcontent);
		return "redirect:reviewList";
	}

//	@RequestMapping (value ="reviewLike")
//	public String reviewLike() {
//		
//		
//		return "reviewLike";
//	}
//	

//
	@RequestMapping (value ="reviewLike")
	public String reviewLike() {
	
		return "reviewLike";
	}

	
	@RequestMapping (value ="reviewLike2")//리뷰보내고 별점 가져온다
	public String reviewLike2(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String rating = request.getParameter("rating");
		String rid = request.getParameter("rid");
		String rcontent = request.getParameter("rcontent");
//		String liker = request.getParameter("liker");
//		
//		int rnum =  Integer.parseInt(request.getParameter("rnum")); 
//		
//		int rivewLikeCheck = dao.rivewLikeCheck(rid,rnum);
//		
//		if(rivewLikeCheck !=0) {
//			return " redirect:reviewLike";
//		} else {
//			dao.rivewLike(rating, rid, rcontent, liker);
//		}
//		dao.rivewLike(rating, rid, rcontent, liker);
	dao.rivewLike(rating, rid, rcontent);
		return "redirect:reviewList2";
	}
	
	@RequestMapping (value ="reviewList2")
	public String reviewOk2(Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		List<ReviewLike> rList = dao.reviewList2();
		
		model.addAttribute("rList", rList);
		return "reviewLike2";
	}
	

	@RequestMapping(value = "commentlike")//좋아요 확인하기
		public String commentlike(HttpServletRequest request, HttpSession session) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		String mid = (String) session.getAttribute("memberId");
		int lnum=Integer.parseInt(request.getParameter("lnum"));
		int mnum = Integer.parseInt(request.getParameter("mnum")); 
		
		int checkCount = dao.likementCheck(mid, mnum);
	
	
		if(checkCount != 0) {
			return String.format("redirerct:reviewLike?mnum=%s",mnum);
		
		}else {
			
			dao.likement(mnum, mid);
			
		}
		return String.format("redirerct:reviewLike2?mnum=%s",mnum);
	}
	

	@RequestMapping (value ="like")
	public String like() {
		
		
		return "like";
	}
	
}





