<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/notice_write_style.css">
<%@ include file="header.jsp"%>
<title>스프링 MVC 게시판 글쓰기</title>
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/notice.js"></script>

</head>
<body>
 
			  <h1>
 					 공&nbsp; 지&nbsp; 사&nbsp; 항&nbsp;
 														 </h1>
  
  <div class="noti-write">
  
    <form method="post" action="notice_write_ok" onsubmit="return write_check();" enctype="multipart/form-data">
  
      <table class="noti-table">
   
    <tr>
     <th>제목</th>
     <td><input name="no_title" id="no_title" size="108" class="noti-write"/></td>
    </tr>
    
    <tr>
     <th>글내용</th>
     <td>
     <textarea name="no_content" id="no_content" rows="35" cols="110"></textarea>
     </td>
    </tr>
    
   <tr>
     <th>파일첨부</th>
     <td><input type="file" name="no_filename" class="notice_file" /></td>
    </tr> 
   </table>
   
   <div class="noti-input">
     <input type="submit" value="글저장"  class="BtnNotice"/>
     <input type="reset" value="취소" onclick="$('#no_title').focus();" class="BtnNotice" />
     <input type="button" value="목록" onclick="location='board_qt?page=${page}';" class="BtnNotice" />
   </div>                           
 
    </form>
  </div>
</body>
<%@ include file="bottom_qt.jsp"%>
</html>
