<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<meta charset="UTF-8">
<title>큐팅::큐팅에대하여</title>
<link rel="stylesheet" href="${path}/resources/css/about_qt_style.css">
</head>
<body>
	<h1>ABOUT 큐팅</h1>
	<br>
	<div class="about_qt-wrapper">
		<div class="about_qt-bar-container">
		<ul>
			<li class="step active" onclick="steps(0)">큐팅STORY</li>
			<li class="step" onclick="steps(1)">ABOUT큐팅	</li>			
			<li class="step" onclick="steps(2)">WITH큐팅	</li>			
		</ul>
		<div class="about_qt-line">
			<!--<div class="about_qt-process"></div>-->
		</div>
	</div>
	
	<div class="about_qt-content-section">
	<!-- 이건 적기만 하면 되니까 나중에 적을 예정 DB연결 필요없이 그냥 적는거라 완성 후 컨셉보고 적어서 마무리 예정 -->
		<div class="story about_qt-content">
			<h2>큐팅STORY</h2>
			<p>큐팅은 어쩌고 저짜고 탄생배경이나 이념 같은거 </p>
		</div>
		
		<div class="about about_qt-content">
			<h2>ABOUT큐팅</h2>
			<p>큐팅의 전체적인 운영방식, 수익구조와 영업구조에 대해 + 추후 성장에 대한 부분도 언급</p>
		</div>
		
			<div class="with about_qt-content">
			<h2>WITH큐팅</h2>
			<p>큐팅의 사회 순화적인 구조에 대해, 유기견보호센터와 도움.</p>
		</div>	
	</div>
	
</div>
</body>
<script type="text/javascript" src="${path}/resources/js/about_qt.js">
</script>
<%@ include file="bottom_qt.jsp"%>