<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>큐팅: 환영합니다!</title>
<link rel="stylesheet" type="text/css" href="../resources/css/qt_login_style.css">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
</head>
<body>
	<div class="loginContainer">
		<div class="dogimg">
			<img src="./resources/images/homeimg.png">
		</div>
		<div class="loginBox">
			<form class="hellogb" method="post" action="login_ok">
				<img class="chips" src="./resources/images/logo2.png">
				<h2>WELCOME</h2><!-- h2는 여기에만 써서 클래스 지정 안해도됨 -->
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i><!-- 이건 이모티콘 쓰는 법인데 위에 폰트어썸 스크립트가 추가되면 이렇게 사이트에서 제공하는 i태그를 바로바로 쓸수 있다 -->
					</div>
					<div>
						<h5>ID</h5>
						<input class="input" id="info_id" name="info_id" type="text"><!-- 이 인풋태그는 그대로 쓰면 그냥 선으로 네모박스가 나온다. css로 보통 그 모든 걸 없애고 커서만 둥둥 밑줄위에 떠있게 만드는 편이다. 연결된 클래스명을 찾아 보면 어떻게 없애는지 볼 수 있다 -->
					</div>
				</div>
				<div class="input-div two">
					<div class="i">
						<i class="fas fa-lock"></i>
					</div>
					<div>
						<h5>password</h5>
						<input class="input" id="info_pw" name="info_pw" type="password">
					</div>
				</div>
				<a href="#">아이디 찾기</a><a href="#">비밀번호 찾기</a> 
				<input type="submit" class="loginBtn" value="Login"> 
			</form>
		</div>
	</div>
	<script type="text/javascript" src="../resources/js/qt_login.js"></script>
</body>

<%@ include file="bottom_qt.jsp"%>