<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ include file="header.jsp"%>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/board_qt_style.css">
<title>큐팅::공지사항</title>
</head>
<body>

<form method="get" action="board_qt">
<div id ="nList_wrap">
	<h1>공지사항</h1>
	
<table class="qt-table">

  <thead>
	<tr>
	  <th>번호</th>  <th>제목</th>  <th>작성일</th>  <th>조회수</th>
	</tr>
 </thead>

<tbody class="qt-notibody">	
      <c:if test="${!empty nlist}">
	  <c:forEach var="n" items="${nlist}">
	     <tr>
	      <td >${n.no_postnb}</td>
	      <td id="notice_td">
	        <a href="notice_cont?no_postnb=${n.no_postnb}&page=${page}&state=cont">${n.no_title}</a>
	      </td><%--get방식으로 no_postnb,page,state 각 네임피라미터에 번호,페이지번호,구분값 cont를 담아서전달  --%>
		  <td >${fn:substring(n.no_update,0,10)}</td><%--등록날짜에서 0이상 10미만사이의 년월일만 반환 --%> 
	  	  <td >${n.no_viewcnt}</td>
		  </tr>
	 </c:forEach>
	  	</c:if>
	
	<c:if test="${empty nlist}">
	  <tr>
	    <th colspan="5"> 자료실 목록이 없습니다. </th>
	  </tr>
	</c:if>
</tbody>
	
</table>
		<!-- 	<tr>
				<td>1</td>
				<td>큐팅운영정책(ver 1.0.0.1)</td>
				<td>운영자</td>
				<td>0</td>
			</tr>
			<tr>
				<td>2</td>
				<td>딜러수칙 위반 처벌사항</td>
				<td>감시자</td>
				<td>0</td>
			</tr>
			<tr>
				<td>3</td>
				<td>사진 업로드 관련 준수사항</td>
				<td>운영자</td>
				<td>0</td>
			</tr>
		</tbody> -->
		
<div class="notice_pa_f3">
		<div class="nlist_paging">
		<%--검색전 페이징(쪽나누기) --%>
		  <c:if test="${(empty find_field) && (empty find_name)}">
		    	<c:if test="${page<=1}">
		     	 	[이전]&nbsp;
		    	</c:if>
		   		<c:if test="${page >1}">
 					<a href="board_qt?page=${page-1}">[이전]</a>&nbsp;		    
 		  	   </c:if>
		 
		 <%--쪽번호 출력부분 --%>
		 <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
		   <c:if test="${a==page}"> <${a}> </c:if>
		   
		   <c:if test="${a !=page}">
		     <a href="board_qt?page=${a}">[${a}]</a> &nbsp;
		   </c:if>
		 </c:forEach>
		 
		<!--   int maxpage=(int)((double)totalCount/10+0.95); -->
		 <c:if test="${page >= maxpage}">[다음]</c:if>
		 <c:if test="${page < maxpage}">
		   <a href="board_qt?page=${page+1}">[다음]</a>
		 </c:if>
		  </c:if>
	
		
		<%--검색후 페이징 --%>
		<c:if test="${(!empty find_field) && (!empty find_name)}">
		  	<c:if test="${page <= 1}">
		    	[이전]&nbsp;
		  	</c:if>	  	
		  	<c:if test="${page >1}">
		    	<a href="board_qt?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
		 	 </c:if>
		  
	
		  <%--쪽번호 출력부분--%>
		  <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
		    <c:if test="${a==page}"><${a}> </c:if>
		    
		    <c:if test="${a!=page}">
		      <a href="board_qt?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
		    </c:if>
		  </c:forEach>
		  
		  <c:if test="${page >= maxpage }">[다음]</c:if>
		  
		  <c:if test="${page <maxpage }">
		    <a href="board_qt?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
		  </c:if>
		  
		</c:if>
		</div>
		
	<div id="nList_menu">
	<%--검색필드와 검색어가 있는 경우 즉 검색하고 난 이후 실행 --%>
	  <input type="button" value="글쓰기" onclick="location='notice_write?page=${page}';"/>
	  <c:if test="${(!empty find_field) && (!empty find_name)}">
	    <input type="button" value="전체목록" onclick="location='board_qt?page=${page}';"/>
	  </c:if>
	</div>	
	
	<%--검색 기능 --%>
<div id="nFind_wrap">
  <select name="find_field">
    <option value="no_title" <c:if test="${find_filed == 'no_title'}">${'selected'}</c:if>>제목</option>
    <option value="no_content" <c:if test="${find_field == 'no_content'}">${'selected'}</c:if>>내용</option>   
  </select>
  
  <input name="find_name" id="find_name" size="14" value="${find_name}"/>
  <input type="submit" value="검색"/>
</div>	

</div>

</div>
</form>
		</body>
				
		<%-- <tr>
			<th colspan="5">
				쪽번호 출력
			</th>
		</tr>
		<tr>
			<th colspan="5"><input type="button" value="글쓰기" onclick="" /></th>
		</tr> --%>


<%@ include file="bottom_qt.jsp"%>
		
		
		
		
		
		
		
		
		
		
		
