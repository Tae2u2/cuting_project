<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 자료실 수정 </title>
<%@ include file="../qt_project/header.jsp"%>
<script src="${path}/resources/js/jquery.js"></script>
<script src="${path}/resources/js/notice.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/notice_edit.css" />

</head>
<body>
 <div>
  <h1>자료실 수정</h1>
  <form method="post" action="notice_edit_ok" onsubmit="return write_check();" enctype="multipart/form-data">
   <%-- 파일 첨부 기능을 만드는 조건: 1. 폼태그 보내는 방식이 method=post이어야 한다.get은 안된다. 
                              2. 폼태그 내에 enctype="multipart/form-data"를 지정해야 한다. --%>
<input type="hidden" name="no_postnb" value="${b.no_postnb}"/>
<input type="hidden" name="page" value="${page}"/>

<table class="noti-table">
  <tr>
   <th>제목</th>
   <td><input name="no_title" id="no_title" size="108" value="${b.no_title}" class="noti-write"></td>
  </tr>
 
 <tr>
   <th>내용</th>
  
   <td><textarea name="no_content" id="no_content" rows="35" cols="110" >${b.no_content}</textarea></td>
  </tr>
  <tr>
     <th>파일첨부</th>
     <td><input type="file" name="no_filename" class="notice_image"/><br/>
     <c:if test="${!empty b.no_filename}">		
     <img src="./resources/upload${b.no_filename}" class="notice_image" alt="이미지" width="300" height="324"></c:if>
     <%-- ${b.no_filename} --%></td>
  </tr>    
  
</table>

  <div class="noti-input">
     <input type="submit" value="글수정" class="BtnNotice" />
     <input type="reset" value="취소" onclick="$('#no_title').focus();"  class="BtnNotice"/>
     <input type="button" value="목록" onclick="location='board_qt?page=${page}';" class="BtnNotice" />
   </div>     

  </form>
 </div>
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>
</html>