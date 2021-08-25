<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp"%>
<title>큐팅::자주묻는질문</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/FAQ_style.css">
</head>
<body>
<!-- main content -->
	<div class="accordion">
		<div>
			<input type="checkbox" name="qt_accordion" id="section1"
				class="accordion__input"> <label for="section1"
				class="accordion__label"> Q1 . 질문어쩌고</label>
			<div class="accordion__a">
				<p>질문에 대한 답변</p>
			</div>
		</div>
		
		<div>
			<input type="checkbox" name="qt_accordion" id="section2"
				class="accordion__input"> <label for="section2"
				class="accordion__label"> Q2 . 질문어쩌고</label>
			<div class="accordion__a">
				<p>질문에 대한 답변</p>
			</div>
		</div>

		<div>
			<input type="checkbox" name="qt_accordion" id="section3"
				class="accordion__input"> <label for="section3"
				class="accordion__label"> Q3 . 질문어쩌고</label>
			<div class="accordion__a">
				<p>질문에 대한 답변</p>
			</div>
		</div>
		<div>
			<input type="checkbox" name="qt_accordion" id="section4"
				class="accordion__input"> <label for="section4"
				class="accordion__label"> Q4 . 질문어쩌고</label>
			<div class="accordion__a">
				<p>질문에 대한 답변</p>
			</div>
		</div>
	</div>
	</body>
	
<!-- footer begin -->

<%@ include file="bottom_qt.jsp"%>
