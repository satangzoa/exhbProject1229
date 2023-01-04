<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약페이지</title>
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

   <center>
   <table width="75%" border="0" cellspacing="0" cellpadding="20">
      <tr>
         <td class="titlebox">
            <span class="title01">예매 하기</span>
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
                        <input type="hidden" value="${view.qnum }" name="qnum">
                           <tr>
                              <td><span class="content_text01">회원 아이디</span></td>
                              <td><input class="input_type01" type="text" name="rid" value="${memberId}"></td>
                           </tr>
                            <tr>
                              <td><span class="content_text01">전시회 이름</span></td>
                              <td><input class="input_type01" type="text" name="ename" value="" ></td>
                           </tr>
                           <tr>
                              <td><span class="content_text01">전화번호</span></td>
                              <td><input class="input_type01" type="text" name="rphone">&nbsp;- 제외 입력</td>
                           </tr>
                           <tr>
                              <td><span class="content_text01">날짜</span></td>
                              <td>
                                 <input class="input_type01" id="pickDate" type="text" name="rday">&nbsp;
                                 </td>
                           </tr>
                           <tr>
                              <td><span class="content_text01">티켓가격</span></td>
                              <td><input class="input_type01" type="text" name="eprice" value="" ></td>
                           </tr>
                           <tr>
                              <td><span class="content_text01">매수</span></td>
                              <td><input class="input_type01" type="text" name="rlist" value="">
                              <select name="amount">
                                       <!-- <option value="">${i}</option>-->
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                        <option value="">5</option>
                                        <option value="">6</option>
                                        <option value="">7</option>
                                        <option value="">9</option>
                                        <option value="">10</option>
                                </select>&nbsp&nbsp장 &nbsp&nbsp</td>
                           </tr>
                           <tr>
                              <td colspan="3" align="center">
                                 <input class="button_type01" type="button" value="예약완료" onclick="reservationCheck()">&nbsp;&nbsp;
                                 <input class="button_type01" type="button" value="예약취소" onclick="script:window.location='index'">
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
   </table>
   </center>

</body>
</html>