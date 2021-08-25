/**
 * 
 */

function check(){
	if (f.idf.value==""){
		alert("아이디를 입력하세요!!")
		f.idf.focus()
		return false;
	}	
	if (f.pwd_1.value==""){
		alert("비밀번호를 입력하세요!!")
		f.pwd_1.focus()
		return false;
	}
	if (f.pwdc.value==""){
		alert("비밀번호를 입력하세요!!")
		f.pwdc.focus()
		return false;
	}
	if (f.name_.value==""){
		alert("이름을 입력하세요!!")
		f.name_.focus()
		return false;
	}
		if (f.nickname_.value==""){
		alert("닉네임을 입력하세요!!")
		f.nickname_.focus()
		return false;
	}

	}