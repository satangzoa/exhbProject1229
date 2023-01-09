package com.Exhibition.home.Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.Exhibition.home.dao.IDao;
import com.Exhibition.home.dto.*;

@Controller
public class MainController {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	@RequestMapping (value ="join")
	public String join () {
		
		return "join_form";
	}
	
	@RequestMapping (value ="joinOk")
	public String joinOk (HttpServletRequest request, HttpSession session, Model model) {
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		int joinFlag = dao.memberJoin(mid, mpw, mname, mid);
		// joinFlag 가 1 이면 회원가입 성공, 아니면 실패
		//System.out.println("가입성공여부"+ joinFlag);
		
		if(joinFlag == 1 ) { //회원가입 성공시 바로 로그인 진행
			session.setAttribute("memberId", mid);
			session.setAttribute("memberName", mname);
		
			model.addAttribute("mid", mid);
			model.addAttribute("mname",mname );
			
			return "joinOk";
		} else { //회원가입 실패
				return "joinFail";
		}
	
	}
	
	
	@RequestMapping (value ="login")
	public String login () {
		
		return "login";
	}
	
	@RequestMapping (value = "logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "index";
	}
	
	
	@RequestMapping (value = "loginOk")
	public String loginOk(HttpServletRequest request, Model model, HttpSession session) {
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int checkIdFlag = dao.checkId(mid); 
		//로그인하려는 아이디 존재시 1, 로그인하려는 아이디 존재하지 않으면 0이 반환
		int checkIdPwFlag = dao.checkIdAndPW(mid, mpw);
		//로그인하려는 아이디와 비밀번호가 모두 일치하는 데이터가 존재하면 1 아니면 0이 반환
		
		model.addAttribute("checkIdFlag",checkIdFlag);
		model.addAttribute("checkIdPwFlag",checkIdPwFlag);
		
		
		
		if(checkIdPwFlag == 1) {   //로그인실행
			session.setAttribute("memberId", mid);
			MemberDto memberDto = dao.getMemberInfo(mid);
			model.addAttribute("memberDto", memberDto);
			model.addAttribute("mid",mid);
		}

		return "loginOk";
	}
	
	@RequestMapping(value = "/mypage")
	public String memberModify(Model model, HttpSession session) {
		
		String sessionId = (String) session.getAttribute("memberId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		MemberDto memberDto = dao.getMemberInfo(sessionId);
		
		model.addAttribute("memberDto", memberDto);
		
		return "memberModify";
	}
	
	@RequestMapping(value = "/memberModifyOk")
	public String memberModifyOk(HttpServletRequest request,  Model model) {
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.memberModify(mid, mpw, mname, memail);
		
		MemberDto memberDto = dao.getMemberInfo(mid);//수정된 회원정보 다시 가져오기
		
		model.addAttribute("memberDto", memberDto);
		
		return "memberModifyOk";
	}
	
	
	@RequestMapping(value = "/buy")
	public String buy() {
		
		return "buy";
	}
	
	@RequestMapping(value = "/store")
	public String store() {
		
		return "store";
	}
	@RequestMapping (value ="MainStore")
	public String MainStore() {
		
		return "MainStore";
	}
	
	
//	@RequestMapping(value = "test")
//	public String test(Model model, HttpServletResponse response) throws IOException {
//			
//		IDao dao = sqlSession.getMapper(IDao.class);		
//		
//		BuyDto buyDto = dao.joinTest("tiger");
//		
//		System.out.println(buyDto.getMemberDto().getMid());
//		
//		model.addAttribute("buyInfo", buyDto);
//		
//		//특정 페이지로 이동전에 자바스크립트 경고창 띄우기
////		response.setContentType("text/html; charset=UTF-8");
////        PrintWriter out = response.getWriter();
////        out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
////        out.flush(); 
//		
//		return "test";
//	}
	
	@RequestMapping (value ="cart")
	public String cart() {
		
		return "cart";
	}
	
	@RequestMapping (value ="/")
	public String home () {
		
		return "redirect:index";
	}


	@RequestMapping (value ="index")
	   public String home (Model model,HttpServletRequest request,HttpSession session, HttpServletResponse response) throws IOException {
	      
	      IDao dao = sqlSession.getMapper(IDao.class);
	      List<ShowDto> showboardDtos = dao.showList2();
	      
//	      ArrayList<ShowDto> eventboardDtos = dao.eventList();
	      
//	      ArrayList<FileDto> fileDtolist = dao.fileList(); // 파일리스트 불러오는것 근데 안됨
	      
	      model.addAttribute("showList",showboardDtos);
//	      model.addAttribute("eventList",eventboardDtos);
	      
	      return "index";
	   }
	
	
}
