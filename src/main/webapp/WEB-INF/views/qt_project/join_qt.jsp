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

        <h1 class="title">회원가입</h1>
<form name="f" method="post" action="join_ok"	onsubmit="return join_check();">

    <div class="regform">
    
        <div class="joinbox">
            <span>*이름</span>
            <input required type="text" class="joinBoxCss" name="info_name" id="info_name" placeholder="이름를 입력하세요"><br>
        </div>
        
        <div class="joinbox">
            <span>*닉네임</span>
            <input required type="text" class="joinBoxCss" name="info_nickname" id="info_nickname" placeholder="사용할 닉네임을 입력하세요"><br>
        </div>
        
        <div class="joinbox">
            <span>*아이디</span>
            <div class="seloselo">
            <input required type="text" name="info_id" class="joinBoxCss" id="info_id" placeholder="아이디를 입력하세요"/>
            <small>아이디는 영문+숫자 조합만 가능합니다.</small>
            </div>
                <input type="button" id="id_check_button" class="buttons" onclick="id_check()" value="중복확인"/>
        </div>
        
        <div class="joinbox">
            <span>*비밀번호</span>
            <div class="seloselo">
            <input required type="password" name="info_pw" class="joinBoxCss" id="info_pw" placeholder="비밀번호를 입력하세요(4-12)">
            <small>비밀번호는 4-12자 사이의 영문 숫자 조합만 가능합니다</small>
            <br>
            <input type="password" name="info_pw_check" class="joinBoxCss" id="info_pw_check" placeholder="비밀번호를 한번 더 입력하세요">
            </div>
        </div>

        <div class="joinbox">
        <span>*생년월일</span>
            <input required type="text" name="info_bday" class="joinBoxCss" id="info_bday" placeholder="ex)19990101">
        </div>

        <div class="joinbox">
            <span>핸드폰번호</span>
            <input type="text" name="info_phonenumber" class="joinBoxCss" id="info_phonenumber" placeholder="ex)01012341234">
        </div>
 
        
        <div class="joinbox">
            <span>Email</span>
            <div class="seloselo">
            <div>
            <input type="text" name="info_email" class="joinBoxCss" id="info_email" placeholder="이메일을 입력하세요">
            <input class="buttons" id="emailCheck" type="button" value="인증번호 전송" onclick="emailSend()">
            </div>
            <div>
            <input type="text" name="check_email" class="joinBoxCss" id="au_check_email" placeholder="인증번호 입력"/>
            <input type="button" class="buttons" id="check_email" onclick="checkmail()" value="인증번호입력"/>
            </div>
        </div>
        </div>
        
       
        <br>
        <div>
             <button class="buttons">취소</button>
            <input type="submit" class="buttons" value="회원가입"/>
        </div>
    </div>
</form>
</div>
		
</body>
<%@ include file="bottom_qt.jsp"%>