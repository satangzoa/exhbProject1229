package com.Exhibition.home.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping (value ="reviewList")
	public String reviewOk(Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		List<Ment2> rList = dao.reviewList();
		
		model.addAttribute("rList", rList);
		return "reviewOk";
	}
	
	@RequestMapping (value ="reviewOk")
	public String reviewOk(HttpServletRequest request, Model model) {
		
		String rating = request.getParameter("rating");
		String rid = request.getParameter("rid");
		String rcontent = request.getParameter("rcontent");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.writeReview(rating, rid, rcontent);
		return "redirect:reviewList";
	}
}





