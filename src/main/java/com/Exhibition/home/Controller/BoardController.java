package com.Exhibition.home.Controller;

import java.util.ArrayList;
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
public class BoardController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/question")
	public String question(HttpSession session, Model model) {
			
		String sessionId = (String) session.getAttribute("memberId");
		
//		if(sessionId == null) {
//			model.addAttribute("memberId", "GUEST");
//		} else {
//			model.addAttribute("memberId", sessionId);
//		}
		model.addAttribute("memberId", sessionId);
		return "question";
	}
	
	
	@RequestMapping(value = "questionOk")
	public String writeQuestion(HttpServletRequest request, Model model) {
		
		String qid = request.getParameter("qid");
		String qname = request.getParameter("qname");
		String qcontent = request.getParameter("qcontent");
		String qemail = request.getParameter("qemail");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.writeQuestion(qid, qname, qcontent, qemail);
		
		return "redirect:event";
	}
	
//	@RequestMapping (value ="event")
//	public String event ( Model model,Criteria cri) {
//		IDao dao = sqlSession.getMapper(IDao.class);
//		
//		List<QBoardDto> qboardDtos = dao.questionList(cri);
//		
//		model.addAttribute("qdtos", qboardDtos);
//		
//		return "questionList";
//	}
	
	@RequestMapping(value = "event")//게시판
	public String list( Model model, Criteria cri,HttpServletRequest request) {//페이징해야하므로 Criteria 가져온다
		
		int pageNumInt=0;
		if(request.getParameter("pageNum") == null) {
			 pageNumInt =1;//1페이지부터 시작
			cri.setPageNum(pageNumInt);
		} else {
			 pageNumInt =Integer.parseInt(request.getParameter("pageNum"));
			 cri.setPageNum(pageNumInt);
		}
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int totalRecord = dao.boardAllCount();
		//cri.setPageNum();
		cri.setStartNum(cri.getPageNum()-1 * cri.getAmount()); 
		
		PageDto pageDto = new PageDto(cri, totalRecord); 

		List<QBoardDto> qboardDtos = dao.questionList(cri);
		
		model.addAttribute("pageMaker", pageDto);//pageMaker = pageDto
		model.addAttribute("qdtos", qboardDtos );
		model.addAttribute("currPage", pageNumInt );
		
		return "questionList";
	}
	
	@RequestMapping(value = "/questionView")
	public String questionView(HttpServletRequest request, Model model) {
		
		String qnum = request.getParameter("qnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		QBoardDto qBoardDto = dao.questionView(qnum);
		
		model.addAttribute("qdto", qBoardDto);
		model.addAttribute("qid", qBoardDto.getQid());
		
		return "questionView";
	}
	
	@RequestMapping(value = "questionModify")
	public String questionModify(HttpServletRequest request, Model model) {
		
		String qnum = request.getParameter("qnum");
		IDao dao = sqlSession.getMapper(IDao.class);
		
		QBoardDto qBoardDto = dao.questionView(qnum);
		
		model.addAttribute("qdto", qBoardDto);
		return "questionModify";
	}

	
	@RequestMapping(value = "questionModifyOk")
	public String questionModifyOk(HttpServletRequest request, Model model) {
		
		String qnum = request.getParameter("qnum");
		String qname = request.getParameter("qname");
		String qcontent = request.getParameter("qcontent");
		String qemail = request.getParameter("qemail");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.questionModify(qnum, qname, qcontent, qemail);
		
		return "redirect:event";
	}
	
	
	@RequestMapping(value = "questionDelete")
	public String questionDelete(HttpServletRequest request, Model model) {
		
		String qnum = request.getParameter("qnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.questionDelete(qnum);
	
		
		return "redirect:event";
	}
	

	@RequestMapping (value ="boardList")
	public String boardList(Model model, Criteria cri,HttpServletRequest request) {//페이징해야하므로 Criteria 가져온다
		
		int pageNumInt=0;
		if(request.getParameter("pageNum") == null) {
			 pageNumInt =1;//1페이지부터 시작
			cri.setPageNum(pageNumInt);
		} else {
			 pageNumInt =Integer.parseInt(request.getParameter("pageNum"));
			 cri.setPageNum(pageNumInt);
		}
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int totalRecord = dao.boardAllCount();
		//cri.setPageNum();
		cri.setStartNum(cri.getPageNum()-1 * cri.getAmount()); 
		
		PageDto pageDto = new PageDto(cri, totalRecord); 
		
		List<ShowDto> qboardDtos = dao.showList(cri);
		
		model.addAttribute("pageMaker", pageDto);//pageMaker = pageDto
		model.addAttribute("qdtos", qboardDtos );
		model.addAttribute("currPage", pageNumInt );
		

		return "boardList";
	}
	
	@RequestMapping(value = "search_list")
	public String search_list(HttpServletRequest request, Model model) {
		
		String searchOption = request.getParameter("searchOption");
		//title, content, writer 3개중에 한개의 값을 저장
		String searchKey = request.getParameter("searchKey");
		//유저가 입력한 제목/내용/글쓴이 에 포함된 검색 키워드 낱말
		IDao dao = sqlSession.getMapper(IDao.class);
		
		ArrayList<ShowDto> boardDtos = null;
		
		if(searchOption.equals("stitle")) {
			boardDtos = dao.ShowSearchTitleList(searchKey);			
		} else if(searchOption.equals("slocation")) {
			boardDtos = dao.ShowSearchLocarionList(searchKey);
		} else if(searchOption.equals("sprice")) {
			boardDtos = dao.ShowSearchSpriceList(searchKey);
		} 	
		
		
		model.addAttribute("boardList", boardDtos);
		
		return "boardList";
	}
	
	
}
