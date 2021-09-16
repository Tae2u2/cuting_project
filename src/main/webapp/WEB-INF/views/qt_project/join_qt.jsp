<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<meta charset="UTF-8">
<title>큐팅: 환영합니다!</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/join_qt_style.css">
<script src="${path}/resources/js/jquery.js"></script>
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<script type="text/javascript" src="${path}/resources/js/mail.js"></script>
<script type="text/javascript" src="${path}/resources/js/join_qt.js"></script>
<script>

</script>
</head>
<body>
	<div class="joinContainer">
		<div class="joinDogImg">
			<img src="${path}/resources/images/cat.png">
		</div>
		<div class="join-container">
			<form name="f" method="post" action="join_ok"	onsubmit="return join_check();">
				<div class="title">
					<h2>회원가입</h2>
				</div>
				<div class="regform">
				
					<div class="joinbox">
						<span>*이름</span><br>
						<input class="name_1" type="text" name="info_name" id="info_name" placeholder="이름를 입력하세요"><br>
					</div>
					
					<div class="joinbox">
						<span>*닉네임</span><br>
						<input class="nickname" type="text" name="info_nickname" id="info_nickname" placeholder="사용할 닉네임을 입력하세요"><br>
					</div>
					
					<div class="joinbox">
						<span>*아이디</span><br>
						<div class="id_d">
							<input type="text" name="info_id" id="info_id" placeholder="아이디를 입력하세요"/>
							<input type="button" id="id_check_button" onclick="id_check()" value="중복확인"/>
						</div>
					</div>
					
					<div class="joinbox">
						<span>*비밀번호</span><br>
						<input type="password" name="info_pw" id="info_pw" placeholder="비밀번호를 입력하세요(4-12)">
						<input type="password" name="info_pw_check" id="info_pw_check" placeholder="비밀번호를 한번 더 입력하세요">
					</div>

				<!-- 	<div class="joinbox">
						<span>*비밀번호확인</span><br>
						<input type="password" name="pwdc" id="pwdcf" placeholder="비밀번호를 확인하세요">
					</div>
					-->
					<div class="joinbox">
						<input type="text" name="info_bday" id="info_bday" placeholder="생년월일을 입력하세요(ex19990101)">
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
						<input class="number2" type="tel" name="info_phonenumber" id="info_phonenumber"><a> -</a>
					 <!--    <input class="number3" type="tel" name="phone3" id="phone3" maxlength="4"> -->
					</div>
					</div>
					
					<div class="joinbox">
						<span>Email</span><br>
						<input class="email" type="text" name="info_email" id="info_email" placeholder="이메일을 입력하세요">
						<input class="buttons" id="emailCheck" type="button" value="인증번호 전송" onclick="emailSend()" style=width:60px;>
						<input class="email" type="text" name="check_email" id="au_check_email" placeholder="인증번호 입력"/>
						<input type="button" id="check_email" onclick="checkmail()" value="인증번호입력"/>
					</div>
					
             	  
					<br>
					<div>
						 <button>취소</button>
						<input type="submit" value="회원가입"/>
						<input type="button" id="asdf" onclick="join_check()" value="테스트1"/>
					</div>
				</div>
			</form>
		</div>
	</div>
		
</body>
<%@ include file="bottom_qt.jsp"%>