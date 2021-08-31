<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/notice_cont_style.css">
<%@ include file="../qt_project/header.jsp"%>
<title>공시사항::내용</title>
</head>
<body>
<form method="get" action="board_qt">
	<div id ="nList_wrap">
	  <h1> 공지사항 </h1>
	  
	  <table class="qt-table">
	    <tr>
	      <td> 제목 : </td>
	      <td>${b.no_title }</td>
	    </tr>
		
		<tr>
		  <td>${b.no_update}</td>
		  <td>${b.no_viewcnt}
		</tr>
		<tr>
		  <td colspan="2">${b.no_content}</td>
		</tr>
			  
	  </table>
	
	</div>
	
	<input type="submit" value="목록"> 
	</form>
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>
</html>
