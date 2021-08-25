<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<title>큐팅메인페이지</title>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="./resources/css/style.css">
</head>
<body>
<div class="info">
			<h1>"당신의 귀염둥이에게<br><span>베팅</span>하세요!"</h1>
			<p>100원으로 시작하는 합법 노름!<br>가진 게 돈 뿐인 랜선집사들 모여라!</p>
			<a href="">판벌리러가기</a>
			<br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>	
		<div class="img-box">
			<img src="./resources/images/bgbg.png" class="back-img">
			<img src="./resources/images/homeimg.png" class="main-img">
		</div>
		<script>
  var msg='${result}';//자바스크립트에서 EL OR JSTL을 사용해서 컨트롤러에서 result속성 키이름에 저장된 값을 가져올 수 있다.
  
  if(msg=='success'){
	  alert('로그인 성공');
  }
 </script>
</body>
<%@ include file="bottom_qt.jsp"%>
