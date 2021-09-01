<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/mypage_qt_style.css">
<script src="https://kit.fontawesome.com/a963872baf.js" crossorigin="anonymous"></script>
<title>큐팅::MyPage</title>
</head>
<body>

 <div class	="about_qt-container">
 	<div class ="about_qt-leftbox">
 		<nav class="about_qt-nav">
 			<a onclick="tabs(0)" class="tab active">
 			<i class="fas fa-user"></i>
 			</a>
 			<a onclick="tabs(1)" class="tab">
 			<i class="far fa-credit-card"></i>
 			</a>
 			<a onclick="tabs(2)" class="tab">
 			<i class="fas fa-heart"></i>
 			</a>
 			<a onclick="tabs(3)" class="tab">
 			<i class="far fa-list-alt"></i>
 			</a>
 		</nav>
 	</div>
 	
 	
 	 <div class="about_qt-rightbox">
 	 <form name="f" method="post" action="modify">
 		<div class="profile tabShow">
 		<h1 class="aboutH1">회원정보</h1>
 		<c:if test="${!empty ulist}">
 		<c:forEach var="u" items="${ulist}">
 		<h2>이름</h2>
 		<input type="text" class="input-qt" id="info_name" name="info_name" value="${u.info_name}">
 		<h2>닉네임</h2>
 		<input type="text" class="input-qt" name="info_nickname" id="info_nickname" value="${u.info_nickname}">
 		<h2>생년월일</h2>
 		<input type="date" class="input-qt" name="birth" value="${u.info_bday}" min="1930-01-01">
 	<!-- <label for="email"><h2>Email</h2></label>
		<input type="email" class="input-qt" pattern="@" size="30" required> -->
 		<h2>연락처</h2>
 		<input type="tel" class="input-qt" name="info_phonenumber" id="info_phonenumber" value="${u.info_phonenumber}">
 		<h2>아이디</h2>
 		<input type="text" class="input-qt" name="info_id" id="info_id" value="${u.info_id}" readonly>
 		<h2>비밀번호</h2>
 		<input type="password" class="input-qt" name="info_pw" id="info_pw" value="${u.info_pw}">
 		</c:forEach>
  </c:if>
 		<input type="submit" value="수정하기"/>
 		</div>
 		</form>
 		
 		<div class="payment tabShow">
 		<h1 class="aboutH1">결제정보</h1>
 		<c:if test="${!empty plist}">
 		<c:forEach var="p" items="${plist}">
 		<h2>현재 잔액</h2>
 		<h4>${p.pay_balance}원</h4>
 		<h2>결제내역</h2>
 		<!-- 테이블로 넣어야지 -->
 		<table> 		</table>
 		</c:forEach>
 		</c:if>
 		<button class="aboutBtn" id="charge" name="charge">충전하러 가기</button>
 		</div>
 		
 		<div class="heart tabShow">
 		<h1 class="aboutH1">찜목록관리</h1>
 		<!-- 버튼으로 연결할지/ 링크로 연결하고 연결전에 팝업 띄울지 고민중 -->
 		<button class="aboutBtn">찜한노름보러가기</button>
 		</div>
 		
 		<div class="mylist tabShow">
 		<h1 class="aboutH1">나의 노름 관리</h1> 		
 		<h2>딜러, ${u.info_name}의 노름</h2>
 		<!-- 테이블로 넣어야지 -->
 		<h2>${u.info_name}의 참여 노름</h2>
 		<!-- 테이블로 넣어야지 -->
 		<button class="aboutBtn">충전하러 가기</button>
 		</div>
 		
 	</div>
 </div>
</body>
<script type="text/javascript" src="./resources/js/mypage_js.js"></script>
<%@ include file="bottom_qt.jsp" %>