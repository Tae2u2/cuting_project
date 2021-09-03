<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 자료실 삭제 </title>
<%@ include file="../qt_project/header.jsp"%>
<script src="${path}/resources/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/notice_del.css" />

 </head>

 
<body>

<div >
 <h1>자료삭제</h1>
 <form method="post" action="notice_del_ok" > 
   <input type="hidden" name="no_postnb" value="${b.no_postnb}" />
   <input type="hidden" name="page" value="${page}" />

   <!-- 
    <tr>
     <th>비밀번호</th>
     <td><input type="password" name="del_pwd" id="del_pwd" size="14" /></td>
    </tr>
 
 -->   
<table class="noti-table">
  <tr>
  <td colspan="2"><h3>삭제 하시겠습니까?</h3></td>
  </tr>
  <tr>
    <td><input type="submit" value="삭제" class="BtnNotice"/></td>
    <td><input type="reset" value="취소" class="BtnNotice" onclick="location='board_qt?page=${page}';" /> </td>
  </tr>
</table>
 </form>
 
</div>

</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>
</html>