<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../qt_project/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/notice_cont_style.css">

<title>공시사항::내용</title>
</head>
<body>

	<div id ="nList_wrap">
	  <h1> 공지사항 </h1>
	  
	  <table class="noti-table">
	  
	    <tr>
	      <td class="notice_cont_td1"> 제목</td>
	      <td class="notice_cont_td1">${b.no_title }</td>
	    </tr>
		
		<tr class="notice_cont_2">
		  <td colspan="2" class="notice_cont_td2">작성일 &nbsp;:&nbsp; ${fn:substring(b.no_update,0,10)} 
		  &nbsp;&nbsp;&nbsp;조회수&nbsp;:&nbsp;  ${b.no_viewcnt}</td>
		
		</tr>
		<tr>
		  <td colspan="2" class="notice_cont_td3">${b.no_content}</td>
		</tr>
		<c:if test="${!empty b.no_filename}"><%--첨부 파일이 있는 경우 실행--%>
    	<tr>
     	<th>첨부파일</th> <td>
     	<img src="./resources/upload${b.no_filename}" class="image" alt="이미지" width="300" height="324">
     	<%-- ${b.no_filename} --%></td>
    	</tr>
    </c:if>	  
    
	  </table>
	  
	  <div class="notice_cont_button">
	  <%if(header.equals("admin")){%>
	 <input type="button" value="수정" class="BtnNotice" onclick="location='notice_cont?no_postnb=${b.no_postnb}&page=${page}&state=edit';" />
     <input type="button" value="삭제" class="BtnNotice" onclick="location='notice_cont?no_postnb=${b.no_postnb}&page=${page}&state=del';" />
     <%} %>
	 <input type="submit" value="목록" class="BtnNotice" onclick="location='board_qt?page=${page}';" /> 
	</div>
	</div>
	
	
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>
</html>