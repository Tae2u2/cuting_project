/**
 * 
 */
var dice;
var eid;
function emailSend(){
	
	
	
	var email=$('#mid').val();
		console.log(email);
	var objdata={"email":email};
	console.log('입력 이메일' + objdata);
		
		$.ajax({
			type:"POST",
			url:"emailcheck",
			data:objdata,
			success : function(data){
				alert(data.result);
				dice = data.dice;
			},error : function(e){
				alert('오류입니다. 잠시 후 다시 시도해주세요.');
			}
		});
	
	
}

function emailCertification(){
	var emailcheck=$('#emailcheck').val();
		console.log(emailcheck);
	if(emailcheck==dice){
		alert("인증에 성공하였습니다.")
		$("#join").removeAttr("disabled");
	}
	else{
		alert("인증에 실패하였습니다.")
	}
}
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
	
