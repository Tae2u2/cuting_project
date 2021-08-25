<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<meta charset="UTF-8">
<title>큐팅: 환영합니다!</title>
<link rel="stylesheet" type="text/css" href="../resources/css/join_qt_style.css">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<script src="../resources/js/jquery.js"></script>
</head>
<body>
	<div class="container">
		<div class="dogimg">
			<img src="../resources/images/cat.png">
		</div>
		<div class="join-container">
			<form name="f" method="post" action="join_ok.jsp"
				onsubmit="return check();">
				<div class="title">
					<h2>회원가입</h2>
				</div>
				<div class="regform">
				
					<div class="joinbox">
						<span>*이름</span><br>
						<input required class="name_1" type="text" name="name_" id="namef" placeholder="이름를 입력하세요"><br>
					</div>
					
					<div class="joinbox">
						<span>*닉네임</span><br>
						<input required class="nickname" type="text" name="nickname_" id="nicknamef" placeholder="사용할 닉네임을 입력하세요"><br>
					</div>
					
					<div class="joinbox">
						<span>*아이디</span><br>
						<div class="id_d">
							<input required type="text" name="idf" placeholder="아이디를 입력하세요">
							<input type="button" value="중복확인">
						</div>
					</div>
					
					<div class="joinbox">
						<span>*비밀번호</span><br>
						<input required type="password" name="pwd_1" id="pwdf" placeholder="비밀번호를 입력하세요">
					</div>

					<div class="joinbox">
						<span>*비밀번호확인</span><br>
						<input type="password" name="pwdc" id="pwdcf" placeholder="비밀번호를 확인하세요">
					</div>

					<div class="joinbox">
						<span>핸드폰번호</span><br>
						<div class="phone_select">
						<select class="number1" name="phone1">
							<option value="">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="012">018</option>
						</select><a> -</a>
						<input class="number2" type="tel" name="phone2" id="phone2" maxlength="9">
					
					</div>
					</div>
					
					<div class="joinbox">
						<span>Email</span><br>
						<input class="email" type="text" name="email" id="email" placeholder="이메일을 입력하세요">
					</div>
					
					<!-- 생년월일 / 추가 -->
					<br>
					<div>
						 <button>취소</button>
						<button>회원가입</button>
					</div>
				</div>
			</form>
		</div>
	</div>
		
</body>
<%@ include file="bottom_qt.jsp"%>