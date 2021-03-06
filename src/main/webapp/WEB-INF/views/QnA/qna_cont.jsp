<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ include file="../qt_project/header.jsp" %>
<script src="../resources/js/jquery.js"></script>
<link rel="stylesheet" href="${path}/resources/css/reply_style.css">
<meta charset="UTF-8">
<title>큐팅::묻고답하기</title>
</head>
<body>
	<h1><a href="QnA_qt">Q&A</a> | <a href="QnA_qt">신고하기</a></h1>
	<c:if test="${qna.qa_delflag==0}">
	<table class="qt-table" border="1">
  <tr>
   <th colspan="3">내용보기</th>
  </tr>
  <tr>
   <th colspan="0.2">제목</th> 
   <td colspan="1.8">${qna.qa_title}</td> <td>조회수 | ${qna.qa_viewcnt}</td>
  </tr> 
  <tr>
  <th colspan="3">${qaContent}</th> 
  </tr>
  <tr>
   <th colspan="3">
   <%if(header.equals("admin")) {%>
    <input type="button" value="관리자 답글" class="BtnforCss" onclick="location='/controller/qna_reply?qa_postnb=${qna.qa_postnb}';" />
    <%} %>
    <input type="button" value="수정" class="BtnforCss" onclick="location='/controller/qna_edit?qa_postnb=${qna.qa_postnb}';" />
    <input type="button" value="삭제" class="BtnforCss" onclick="location='/controller/qna_del?qa_postnb=${qna.qa_postnb}';" />
    <input type="button" value="목록" class="BtnforCss" onclick="location='QnA_qt';" />
   </th>
  </tr>
  
 
 </table>
</c:if>
  	
 
 	 <table class="qt-table2" >
<c:choose>
 <c:when test="${empty rlist}">
 <tr><th colspan="5">댓글이 없습니다.</tr>
 </c:when>

 <c:when test="${!empty rlist}">
		<div class="rp_list">
		<span class="rp_write2">댓글 LIST</span> <img src="${path}/resources/images/like.png" width="35" height="35"> 
		</div>
  			
 	<c:forEach var="rp" items="${rlist}" > <%--  begin="0" end="8"--%>
 	 		
 	 	 <tr>
   			<th class="reply_250"><span class="reply_left">${rp.rp_update}<br/> id: <%=(String)header %>  </span>
   			<%-- ${rp.rp_content} --%></th>

 	 		<td colspan="10" class="rp_content">${rp.rp_content}</td>
 	 		
 	 		
 	 		
 			<th class="reply_250">
 			 <input type="button" value="수정" class="BtnforCss2" onclick="location='/controller/reply_edit?rp_postnb=${rp.rp_postnb}';" />
 			 <input type="button" value="삭제" class="BtnforCss2" onclick="location='/controller/reply_del?rp_postnb=${rp.rp_postnb}';"/>
 			</th>	
 							
 		</tr>
 	</c:forEach>
 </c:when>
</c:choose>

	</table>
 	
 	
 	
 	
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>
