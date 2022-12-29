<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>클래식기타 커뮤니티</title>
</head>
<body>
    <main>
      <section id="main">
        <img src="${pageContext.request.contextPath}/resources/img/comm.gif">
        <h2 id="board_title">자유게시판</h2>
        <div id="write_title"><h2>글쓰기</h2></div>
        <form action="writeOk" method="post" enctype="multipart/form-data">
        <table>
          <tr id="name">
            <td class="col1">이름</td>
            <td class="col2"><input type="text" name="rfbname"></td>
          </tr>
          <tr id="subject">
            <td class="col1">제목</td>
            <td class="col2"><input type="text" name="rfbtitle"></td>
          </tr>
          <tr id="content">
            <td class="col1">내용</td>
            <td class="col2"><textarea name="rfbcontent"></textarea></td>
          </tr>
          <tr id="upload">
            <td class="col1">업로드 파일</td>
            <td class="col2"><input type="file" name="files"></td>
          </tr>
        </table>
        <div id="buttons">
          <input type="image" src="${pageContext.request.contextPath}/resources/img/ok.png">
          <a href="board_list"><img src="${pageContext.request.contextPath}/resources/img/list.png"></a>
        </div>
        </form>
      </section> <!-- section main 끝 -->
    </main>
</body>
</html>