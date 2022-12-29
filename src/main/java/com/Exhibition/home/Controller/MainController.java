package com.Exhibition.home.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Exhibition.home.dao.IDao;
import com.Exhibition.home.dto.*;

@Controller
public class MainController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping (value ="/")
	public String home () {
		
		return "index";
	}

	@RequestMapping(value = "/index")
	public String index1() {
		
		return "index";
	}
	
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
	
//	@RequestMapping (value ="show")
//	public String show () {
//		
//		return "/reservation/showview";
//	}
//	
//	
	
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
	
	@RequestMapping(value = "event")
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
	
	
	@RequestMapping (value ="reservationPage2")
	public String reservationPage () {
		
		return "reservationPage2";
	}
	
	@RequestMapping(value = "/buy")
	public String buy() {
		
		return "buy";
	}
	
	@RequestMapping(value = "/cart_List")
	public String cart_List() {
		
		return "cart_List";
	}
	
	
	 // 1. 장바구니 추가
//    @RequestMapping(value = "/cart_List")
//    public String insert(Model model, HttpSession session){
//        String userId = (String) session.getAttribute("userId");
//        vo.setUserId(userId);
//        // 장바구니에 기존 상품이 있는지 검사
//        int count = cartService.countCart(vo.getProductId(), userId);
//        count == 0 ? cartService.updateCart(vo) : cartService.insert(vo);
//        if(count == 0){
//            // 없으면 insert
//            cartService.insert(vo);
//        } else {
//            // 있으면 update
//            cartService.updateCart(vo);
//        }
//        return "redirect:cart_List";
//    }

    // 2. 장바구니 목록
//    @RequestMapping(value = "/cart_List")
//    public ModelAndView list(HttpSession session, ModelAndView mav){
//        String userId = (String) session.getAttribute("userId"); // session에 저장된 userId
//        Map<String, Object> map = new HashMap<String, Object>();
//        List<CartVO> list = cartService.listCart(userId); // 장바구니 정보 
//        int sumMoney = cartService.sumMoney(userId); // 장바구니 전체 금액 호출
//        // 장바구니 전체 긍액에 따라 배송비 구분
//        // 배송료(10만원이상 => 무료, 미만 => 2500원)
//        int fee = sumMoney >= 100000 ? 0 : 2500;
//        map.put("list", list);                // 장바구니 정보를 map에 저장
//        map.put("count", list.size());        // 장바구니 상품의 유무
//        map.put("sumMoney", sumMoney);        // 장바구니 전체 금액
//        map.put("fee", fee);                 // 배송금액
//        map.put("allSum", sumMoney+fee);    // 주문 상품 전체 금액
//        mav.setViewName("shop/cartList");    // view(jsp)의 이름 저장
//        mav.addObject("map", map);            // map 변수 저장
//        return mav;
//    }

    // 3. 장바구니 삭제
    @RequestMapping("deleteCart")
    public String delete(HttpServletRequest request, Model model){
        String user_id = request.getParameter("user_id");
    	
        IDao dao = sqlSession.getMapper(IDao.class);
        dao.questionDelete(user_id);
        
        return "redirect:cart_List";
    }

    // 4. 장바구니 수정
    @RequestMapping("modifyCart")
    public String update(HttpServletRequest request, Model model) {
       
    	String user_id = request.getParameter("user_id");
    	String amount = request.getParameter("amount");
    	String product_id = request.getParameter("product_id");

    	IDao dao = sqlSession.getMapper(IDao.class);
    	dao.modifyCart(user_id, amount, product_id);
    	
        return "redirect:cart_List";
    }
    
 // 1. 상품 전체 목록
    @RequestMapping("/productList")
    public String productList(Model model) {
    	IDao dao = sqlSession.getMapper(IDao.class);
    	
    	List<product> pro = dao.listProduct(null);
    	model.addAttribute("pro", pro);
    	
        return "productList";
    }
    
    // 2. 상품 상세보기
    @RequestMapping("/ProductPage")
    public String  ProductPage(Model model){
    	IDao dao = sqlSession.getMapper(IDao.class);
    	
    	List<product> proda = dao.listProduct(null);
    	model.addAttribute("proda", proda);
    	
        return "ProductPage";
    }

}