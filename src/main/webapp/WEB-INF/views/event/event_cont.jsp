<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

  
<%@ include file="../qt_project/header.jsp"%>
<meta charset="UTF-8">
<title>큐팅::이벤트에 참여하세요</title>
 
<link rel="stylesheet" href="${path}/resources/css/event_qt.css">
</head>
<body>
<div class="event_qt-post">
	<section class="event_qt-section">
		<div class="event_qt-img">
			<img class="event_qt-servimg" src="${path}/resources/upload${e.ev_filename}" class="image">
		</div>
		<div class="event_qt-info">
			<div class="event_qt-date">
				<span>${fn:substring(e.ev_update,0,10)}~${fn:substring(e.ev_exdate,0,10)}</span>
			</div>
			<h1 class="event_qt-title">${e.ev_title}</h1>
			<p class="event_qt-text">
				${e.ev_content}
					</p>

				<input type="button" value="목록" class="event_qt-cta" onclick="location='event_qt?page=${page}';" />
				<%if(header.equals("admin")) {%>
				<input type="button" value="수정" class="event_qt-cta" onclick="location='event_cont?no=${e.ev_postnb}&page=${page}&state=edit';" />
				<input type="button" value="삭제" class="event_qt-cta" onclick="location='event_del?no=${e.ev_postnb}&page=${page}';" />
				<%} %>
																				
			
			
		</div>
	</section>
	</div>
</body>
</html>
<%@ include file="../qt_project/bottom_qt.jsp"%>