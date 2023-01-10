<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회예매</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reservation.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<script type="text/javascript">


      <!--      달력 추가 js 시작       -->
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#pickDate" ).datepicker({
            	 showOn: "button",
                 buttonImage:"${pageContext.request.contextPath }/resources/img/r.png",
                 buttonImageOnly: true,
            	 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 minDate: 0,
                 maxDate: "+10Y",                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( rday ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", rday );
                 }    
 
            });
            $( "#endDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 
                 maxDate: "+2Y",                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( rday ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", rday );
                 }    
 
            });    
    });
    
   
    <!--      달력 추가 js 끝       -->

</script>


</head>
<body>
<%@ include file="../inc/header.jsp" %>
   <center>
   <form action ="ticketingOk?num=${param.num}" method="post"> 
   <input type="hidden" value="${ticket.tnum }" name="tnum">
   <table width="75%" border="0" cellspacing="0" cellpadding="20">
      <tr>
         <td class="titlebox">

            <span class="title01">예매 페이지</span>
         </td>
      </tr>
      <tr>
         <td>
            <center>
            <table width="80%" border="0" cellspacing="0" cellpadding="10">
               <tr class="contentbox">
                  <td class="content">
                     <center>
                     <table border="0" cellspacing="0" cellpadding="10">
                        <form action="reservationOk" method="post" name="reservation_frm">
                           <tr>
                              <td><span class="content_text01">아이디:</span></td>
                              <td><input class="input_type01" type="text" name="mid" value="${memberId}"></td>
                           </tr>
                           <tr>
                              <td><span class="content_text01">전시회이름:</span></td>
                              <td><input class="input_type01" type="text" name="ticketName" value="${ticket.ticketName}"></td>
                           </tr>
                           
                              <td><span class="content_text01">관람날짜:</span>&nbsp;&nbsp;</td>
                              <td>
                                 <input class="input_type01" id="pickDate" type="text" name="rday">&nbsp;
                                 </td>
                                  <tr>
                              <td><span class="content_text01">가격:</span></td>
                              <td><input class="input_type01" type="text" name="price" value="${ticket.price}">
                         <select name="count">
                                       <!-- <option value="">${i}</option>-->
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                </select>장 &nbsp&nbsp
									 </td>
									 
                           <tr>
                              <td colspan="2" align="center">

                                 <input class="button_type01" type="submit" value="예매하기"  >&nbsp;&nbsp; 
                                 <input class="button_type01" type="button" value="예매취소" onclick="script:window.location='index'">
                              </td>
                           </tr>
                        </form>
                     </table>
                     </center>
                  </td>
               </tr>
            </table>
            </center>
         </td>
      </tr>
      </form>
   </table>
   </center>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>