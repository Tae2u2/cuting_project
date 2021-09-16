<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../qt_project/header.jsp"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title></title>

<!--   <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link rel="stylesheet" href="resources/css/hot2.css">
<script src="${path}/resources/js/all.min.js"></script>
<script src="${path}/resources/js/hot3.js"></script>
</head>
<body>


	<h1>오늘의 노름</h1>
	<div class="best">
		<ul>
			<li><a href="#" onclick="location.href='hot'">DAY</a></li>
			<li><a href="#" onclick="location.href='hot1'">WEEK</a></li>
			<li><a href="#" onclick="location.href='hot2'">MONTH</a></li>
		</ul>
	</div>


	<div class="sliderWrap controls">
		<ul class="basic_slider">

			<c:if test="${!empty h1list}">
				<c:forEach var="h1" items="${h1list}">

					<li><img src="${path}/resources/upload${h1.gb_filename}"
						alt="day1">
						<figcaption>
							<h3>${h1.gb_title}</h3>
							<p>${h1.gb_content}</p>

						</figcaption> <a href="#"></a></li>


				</c:forEach>
			</c:if>
			
			 <c:if test="${empty h1list}">
			 <li><img src="resources/images/picketcat.png" alt="no image"></li>
			<li><img src="resources/images/picketcat.png" alt="no image"></li>
			 <li><img src="resources/images/picketcat.png" alt="no image"></li>
			
			 
			 
			 </c:if>
		</ul>
	</div>





	<section class="layered-card">
		<div class="image_class">
			<img class="hot_qt-servimg" src="resources/images/picketcat.png">
		</div>
		<div class="text_class">
			<p class="explain_qt">
				귀여운 사진을 가지고싶다면 <br> 지금 베팅하세요! 소정의 돈으로 누릴수있는 찬스입니다!
			</p>

			<a href="#" onclick="location.href='enter_nr'" class="hot_qt-cta">배팅시작</a>
		</div>


	</section>
		
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>
</html>