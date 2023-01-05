package com.Exhibition.home.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.Exhibition.home.dao.IDao;
import com.Exhibition.home.dto.*;
@Controller
public class TicketController {

	@Autowired
	private SqlSession sqlSession;
	
	
//	@RequestMapping(value="/ticketing")
//	public String confirm() {
//		return "ticketing";
//	}
	
	@RequestMapping(value="/ticket")
	public String confirm() {
		
		
		return "ticket";
	}
	
	@RequestMapping(value="/ticketing")
	public String ticketing(HttpServletRequest request, Model model,HttpSession session) {
		
		String sessionId = (String) session.getAttribute("memberId");//아이디 가져오기
		String tnum = request.getParameter("tnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		Ticket ticket =dao.tictekInfo(tnum);
		
		model.addAttribute("memberId", sessionId);
		model.addAttribute("ticket", ticket);
		model.addAttribute("mid", ticket.getMid());
		
		
		return "ticketing";
	}
	
	
	@RequestMapping (value ="/ticketingOk")
	public String ticketingtest(HttpServletRequest request,Model model) {
		String id = request.getParameter("mid");
		String ticketName = request.getParameter("ticketName");
		String rday = request.getParameter("rday");
		String price = request.getParameter("price");
		String count = request.getParameter("count");
		
		
		IDao dao = sqlSession.getMapper(IDao.class);
		int joinFlag = dao.ticketing(id, ticketName,rday,price,count);
	
		 model.addAttribute("id",id);
		 model.addAttribute("ticketName",ticketName);
	    model.addAttribute("rday",rday);
		 model.addAttribute("price",price);
		model.addAttribute("count",count);
		
		return "ticketingOk";
	}
	
	

//	@RequestMapping(value="/ticketingOk")
//	public String ticketingOk(HttpServletResponse response,HttpSession session) {
//		return "ticketingOk";
//	}
//	
	
	
//	@RequestMapping(value="/ticketing") 되지만 실제 아이디만 가져오고 티켓이름.티켓가격을 못가져온다
//	public String ticketing(Model model, HttpSession session) {
//		
//		String sessionId = (String) session.getAttribute("memberId");
//		
//		IDao dao = sqlSession.getMapper(IDao.class);
//		
//		Ticket ticket = dao.geTicteckInfo(sessionId);
//	
//		model.addAttribute("ticket", ticket);
//		
//		return "ticketing";
//	}
//	
	
	
//	@RequestMapping(value="/ticketConfirm")
//	public String ticketConfirm(HttpServletRequest request, Model model) {
//		
//		IDao dao = sqlSession.getMapper(IDao.class);
//		
//		String mid = request.getParameter("mid");
//		
//		Ticketing tDto = dao.ticketConfirm(mid);
//		model.addAttribute("view", tDto);
//		return "ticketConfirm";
//	}
//	
	@RequestMapping(value = "ticketConfirm")
	public String test(Model model, HttpServletResponse response,HttpServletRequest request,HttpSession session) throws IOException {
			
		IDao dao = sqlSession.getMapper(IDao.class);		
		
		String mid = (String) session.getAttribute("memberId");
		
		List<Ticketing> ticketConfirmList =dao.ticketConfirm(mid);
		
		//System.out.println(ticketConfirmList.get(0).getTnum()); 잘가져오는지 확인한댜
		
		model.addAttribute("ticketConfirm", ticketConfirmList);
		
		
		return "ticketConfirm";
	}
	
	
	@RequestMapping(value="/ticketDelete")
	public String ticketDelete(HttpServletRequest request, Model model) {
		
		String tnum = request.getParameter("tnum");
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.ticketDelete(tnum);
		
		return "redirect:ticketConfirm";
	}
	
}
