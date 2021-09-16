<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp"%>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/mypay_style.css">
<title>큐팅::결제목록을 확인하세요</title>
</head>
<body>
	<h1>구매내역</h1>
	<div class="mypayBody">

		<div class="mypayCard">
		<c:if test="${!empty bylist}">
			<c:forEach var="by" items="${bylist}">
			<div class="mypayImg">
				<img src="./resources/upload${by.by_filename}">
			</div>
			
			<div class="mypayContent">
				<h2>${by.by_title}<small>${by.by_purchase}원</small></h2>
				<p>판매자 : ${by.by_sid}</p>
				<p>${by.by_date}</p>
			</div>
			</c:forEach>
			</c:if>
		</div>
	</div>
	
</body>
<%@ include file="bottom_qt.jsp"%>