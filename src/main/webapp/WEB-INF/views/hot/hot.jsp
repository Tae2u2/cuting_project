<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../qt_project/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<!--   <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

	<link rel="stylesheet" href="css/hot2.css">
		<script src="js/all.min.js"></script>
	
	<script src="./resources/js/hot3.js"></script>

</head>
<body>
	
	<h1>오늘의 노름</h1>
	<div class="best">
	<ul class="day_week_month">
	<li><a href="#">DAY</a></li>
	<li><a href="#">WEEK</a></li>
	<li><a href="#">MONTH</a></li>
	</ul>
	</div>


	<div class="sliderWrap controls">
		<ul class="basic_slider">

			<li><img src="woong1.jpg" alt="woong1">
				<figcaption>
					<h3>예시 제목</h3>
					<p>예시 내용입니다</p>
					<p>예시 등록날짜입니다</p>
				</figcaption> <a href="#"></a></li>
			<!-- a href 로 바꾸는건데 잘되는지 확인위해 img넣었습니다 -->
			<li><img src="woong2.jpg" alt="woong2">
				<figcaption>
						<h3>예시 제목</h3>
					<p>예시 내용입니다</p>
					<p>예시 등록날짜입니다</p>
				</figcaption> <a href="#"></a></li>
			<li><img src="woong3.jpg" alt="woong3">
				<figcaption>
					<h3>예시 제목</h3>
					<p>예시 내용입니다</p>
					<p>예시 등록날짜입니다</p>
				</figcaption> <a href="#"></a></li>


		</ul>
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

