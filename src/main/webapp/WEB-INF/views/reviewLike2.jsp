<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/board.js"></script>
<link rel="stylesheet" href="resources/css/ind.css">

<title>리뷰다</title>
</head>

<body>
	<%@ include file="inc/header.jsp" %>
	<center>
   <table width="75%" border="0" cellspacing="0" cellpadding="20">
      <div >
		    <h1>장 줄리안</h1>
		    <p>장씨는 내 친구</p>
		</div>
		
		<div >
		    <img src = 'resources/img/s1.png'  />
		</div>
                      <form>
                       <c:forEach items="${rList}" var="view">
                       <tr>
                              <td><span class="content_text01">리뷰번호:</span></td>
                              <td><input class="input_type01" type="text" name="rnum" value="${view.rnum}"></td>
                           </tr>
                        <tr>
                              <td><span class="content_text01">아이디:</span></td>
                              <td><input class="input_type01" type="text" name="rid" value="${view.rid}"></td>
                           </tr>
                            <tr>
                             <!--  <td><span class="content_text01"name="rating"  begin="1" end="${view.rating }"  >별점:⭐</span></td>-->
                        <!--    <td><input class="input_type01" type="text" name="rating"  begin="1" end="${view.rating }" >⭐</td>  -->
                        
                    <tr>   <td>  <c:forEach begin="1" end="${view.rating }"> ⭐ </c:forEach></td></tr>
			
			
                           </tr>
                           
                              <tr>
                              <td><span class="content_text01">리뷰:</span></td>
                              <td><input class="input_type01" type="text" name="rcontent" value="${view.rcontent}"></td>
                           </tr>
								   </c:forEach>	 
                             <tr> <td colspan="2" align="center">

                                 <input class="button_type01" type="button" value="리뷰쓰기"  onclick="script:window.location='reviewLike'">&nbsp;&nbsp; 
                                 <input class="button_type01" type="button" value="처음으로" onclick="script:window.location='index'">
                              </td>
                           </tr>
                        
                          
                        </form>
                          
                     </center>
                  </td>
               </tr>
            </table>
            </center>
         </td>
      </tr>
   </table>
   </center>
	<%@ include file="inc/footer.jsp" %>
</body>
</html>