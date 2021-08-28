<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

  
<%@ include file="../qt_project/header.jsp"%>
<meta charset="UTF-8">
<title>큐팅::이벤트에 참여하세요</title>
<link rel="stylesheet" href="css/event_qt.css">
</head>
<body>
 <c:if test="${!empty blist}">
    <c:forEach var="b" items="${blist}">
	<div class="event_qt-post">
	<section class="event_qt-section">
		<div class="event_qt-img">
			<img class="event_qt-servimg" src="images/picketcat.png">
		</div>
		<div class="event_qt-info">
			<div class="event_qt-date">
				<span>${e.ev_update}~${e.ev_exdate}</span>
			</div>
			<h1 class="event_qt-title">${e.ev_title}</h1>
			<p class="event_qt-text">
				${e.ev_content}<br>
			</p>
			<!-- 커뮤니티로 이어지게 -->
			<a href="community.jsp" class="event_qt-cta">참여하기</a>
			
		</div>
	</section>
	</div>
	</c:forEach>
	</c:if>
	
	   <c:if test="${empty blist}">
  <div class="event_qt-post">
	<section class="event_qt-section">
		<div class="event_qt-img">
			<img class="event_qt-servimg" src="images/picketcat.png">
		</div>
		</section>
		</div>
   </c:if>

</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>