
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

   
<%@ include file="../qt_project/header.jsp"%>
<meta charset="UTF-8">
<title>큐팅::이벤트에 참여하세요</title>
<link rel="stylesheet" href="./resources/css/event_qt.css">
</head>
<body>
 <c:if test="${!empty blist}">
    <c:forEach var="e" items="${blist}">
	<div class="event_qt-post">
	<section class="event_qt-section">
		<div class="event_qt-img">
			<img class="event_qt-servimg" src="${path}/resources/upload${e.ev_filename}" class="image">
		</div>
		<div class="event_qt-info">
			<div class="event_qt-date">
				<span>${fn:substring(e.ev_update,0,10)}~${fn:substring(e.ev_exdate,0,10)}</span>
			</div>
			<h1 class="event_qt-title"><a href="event_cont?no=${e.ev_postnb}&page=${page}&state=cont">${e.ev_title}</a></h1>
			<p class="event_qt-text">
				${e.ev_content}
					</p>
			<!-- 커뮤니티로 이어지게 -->
			<a href="#" class="event_qt-cta">참여하기</a>
			
		</div>
	</section>
 <input type="button" value="글쓰기" onclick="location='event_write?page=${page}';" class="BtnNotice"/>	</div>
	</c:forEach>
	</c:if>
	
	   <c:if test="${empty blist}">
  <div class="event_qt-post">
	<section class="event_qt-section">
		<div class="event_qt-img">
			<img class="event_qt-servimg" src="${path}/resources/images/picketcat.png">
		</div>
			<div class="event_qt-info">
		
			<p class="event_qt-text">
				게시물이 존재하지 않습니다!!!!
			</p>
			</div>
		
		</section>
		</div>
   </c:if>
   


</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>
