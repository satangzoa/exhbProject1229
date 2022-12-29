<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>클래식기타 커뮤니티</title>
</head>
<body>
      <article id="sub_banner">
        <ul>
          <li><img src="${pageContext.request.contextPath}/resources/img/banner1.png"></li>
          <li><img src="${pageContext.request.contextPath}/resources/img/banner2.png"></li>
          <li><img src="${pageContext.request.contextPath}/resources/img/banner3.png"></li>
        </ul>
      </article>
    </aside>
    <main>
      <section id="main">
        <img src="${pageContext.request.contextPath}/resources/img/comm.gif">
        <h2 id="board_title">자유게시판</h2>
        <div id="view_title_box">
          <span id="boardTitle">${rfbView.rfbtitle }</span>
          <span id="info">${rfbView.rfbname } | 조회수 : ${rfbView.rfbhit } | ${rfbView.rfbdate }</span>
        </div>
        <p id="view_content">
          ${rfbView.rfbcontent }
        </p>
        <form action="replyOk">
        <input type="hidden" name="rfbnum" value="${rfbView.rfbnum }">
        
        <p id="file_info">
        	※ 첨부파일 : 
        	<a href="${pageContext.request.contextPath}/resources/uploadfiles/${fileDto.filename}" download>
        	${fileDto.fileoriname }
        	</a>
        </p>       
        <c:if test="${fileDto.fileextension =='jpg' or fileDto.fileextension =='png' or fileDto.fileextension =='bmp' or fileDto.fileextension =='gif'}">
        	<br>
        	<img width="300" src="${pageContext.request.contextPath}/resources/uploadfiles/${fileDto.filename}">
        	<br>
        </c:if>
        <br>
        <!-- 해당글의 댓글 리스트 출력 -->
        <table border="1" cellpadding="0" cellspacing="0" width="750">
        	<c:forEach items="${replylist }" var="replyDto">
        	<tr>
        		<td width="100">
					${replyDto.rrid }        			
        		</td>
        		<td width=550>
        			${replyDto.rrcontent }<br><br>
        			${replyDto.rrdate }
        		</td>
        		<td>
        			<a href="replyDelete?rrnum=${replyDto.rrnum }&rfbnum=${rfbView.rfbnum }">삭제</a>
        		</td>
        		
        	</tr>
        	</c:forEach>
        </table>        
        <!-- 해당글의 댓글 리스트 끝 -->
        
        <!-- 댓글 입력란 -->
        <div id="comment_box">
          <img id="title_comment" src="${pageContext.request.contextPath}/resources/img/title_comment.gif">
          <textarea name="rrcontent"></textarea>
          <input type="image" id="ok_ripple" src="${pageContext.request.contextPath}/resources/img/ok_ripple.gif">
        </div>
        </form>
        <!-- 댓글 입력란 끝 -->
        <div id="buttons">
          <a href="delete?rfbnum=${rfbView.rfbnum }"><img src="${pageContext.request.contextPath}/resources/img/delete.png"></a>
          <a href="board_list"><img src="${pageContext.request.contextPath}/resources/img/list.png"></a>
          <a href="board_write"><img src="${pageContext.request.contextPath}/resources/img/write.png"></a>
        </div>
      </section> <!-- section main 끝 -->
    </main>
</body>
</html>