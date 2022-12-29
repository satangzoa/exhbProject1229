<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>전시회 예매</title>
</head>
<body>
    <main>
      <section id="main">
        <h2 id="board_title">자유게시판</h2>
        <div id="total_search">
          <div id="total">▷ 총 ${boardCount }개의 게시물이 있습니다.</div>
          <form action="search_list">
          <div id="search">
            <div id="select_img"></div>
            <div id="search_select">
              <select name="searchOption">
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="writer">글쓴이</option>
              </select>
            </div>
            <div id="search_input"><input type="text" name="searchKey"></div>
            <div id="search_btn"></div>
          </div>
          </form>
        </div> <!-- total search 끝 -->
        <table>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>일시</th>
            <th>조회수</th>
          </tr>
          <c:forEach items="${boardList}" var="boardDto">
          <tr>
            <td class="col1">${boardDto.rfbnum }</td>
            <td class="col2">
              <a href="board_view?rfbnum=${boardDto.rfbnum }">${boardDto.rfbtitle }</a>
              <c:if test="${boardDto.rfbreplycount != 0 }">              
              &nbsp;&nbsp;[${boardDto.rfbreplycount }]
              </c:if>
              <c:if test="${boardDto.filecount != 0 }">
              <a href="file_down?rfbnum=${boardDto.rfbnum }">
              &nbsp;<img width="15" src="${pageContext.request.contextPath}/resources/img/file.png">
              </a>
              </c:if>              
            </td>
            <td class="col3">${boardDto.rfbname }</td>
            <td class="col4">${boardDto.rfbdate }</td>
            <td class="col5">${boardDto.rfbhit }</td>
          </tr>
          </c:forEach>
        </table> <!-- 게시판 목록 테이블 끝 -->
        <div id="buttons">
          <div class="col1">◀ 이전 1 다음 ▶</div>
          <div class="col2">
            <img src="${pageContext.request.contextPath}/resources/img/list.png">
            <a href="board_write"><img src="${pageContext.request.contextPath}/resources/img/write.png"></a>
          </div>
        </div>
      </section> <!-- section main 끝 -->
    </main>
</body>
</html>