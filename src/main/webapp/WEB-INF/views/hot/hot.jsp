<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../qt_project/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<!--   <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link rel="stylesheet" href="${path}/resources/css/hot2.css">
<script src="${path}/resources/js/all.min.js"></script>
<script src="../resources/js/hot3.js"></script>

</head>
<body>
	
<h1>오늘의 노름</h1>
	<div class="best">
	<ul>
	<li><a href="#tabs-1">DAY</a></li>
	<li><a href="#tabs-2">WEEK</a></li>
	<li><a href="#tabs-3">MONTH</a></li>
	</ul>

<c:if test="${!empty hlist}">
    <c:forEach var="h" items="${hlist}">
	<div id="tabs-1">
	<div class="sliderWrap controls">
		<ul class="basic_slider1">

			<li><img src="${path}/resources/upload${h.gb_filename}" alt="day1">
				<figcaption>
					<h3>${h.gb_title}</h3>
					<p>${h.gb_content}</p>
					<p>${h.gb_update}</p>
				</figcaption> <a href="#"></a></li>
		
	 	


		</ul>
	</div>
	</div>
	</c:forEach>
	</c:if>
	
	
	<c:if test="${!empty h1list}">
    <c:forEach var="h1" items="${h1list}">
	<div id="tabs-2">
	<div class="sliderWrap controls">
		<ul class="basic_slider2">

			<li><img src="${path}/resources/upload${h.gb_filename}" alt="day1">
				<figcaption>
					<h3>${h1.gb_title}</h3>
					<p>${h1.gb_content}</p>
					<p>${h1.gb_update}</p>
				</figcaption> <a href="#"></a></li>
		
		


		</ul>
	</div>
	</div>
	</c:forEach>
	</c:if>


	<c:if test="${!empty h2list}">
    <c:forEach var="h2" items="${h2list}">
	<div id="tabs-3">
	<div class="sliderWrap controls">
		<ul class="basic_slider3">

			<li><img src="${path}/resources/upload${h2.gb_filename}" alt="woong1">
				<figcaption>
					<h3>${h2.gb_title}</h3>
					<p>${h2.gb_content}</p>
					<p>${h2.gb_title}</p>
				</figcaption> <a href="#"></a></li>
		
		


		</ul>
	</div>
	</div>
	</c:forEach>
	</c:if>
</div>

<section class="layered-card">
  			<div class="image_class">
  			<img class="hot_qt-servimg" src="images/picketcat.png">
  			</div>
  			<div class="text_class">
  			<p class="explain_qt">귀여운 사진을 가지고싶다면 <br>
  			지금 베팅하세요! 소정의 돈으로 누릴수있는 찬스입니다! </p>
  			
  			<a href="#" class="hot_qt-cta">배팅시작</a>
  			</div>
  		
  			
		</section>
		


</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>
</html>

