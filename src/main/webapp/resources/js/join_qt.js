/**
 * 
 */
function id_check(){
	var getId = RegExp(/^[A-Za-z0-9]{4,10}$/);
	if($("#info_id").val() == ""){
	alert("공백 확인");
	}
	else if(!getId.test($('#info_id').val())){
	alert("아이디는 영문+숫자 조합만 가능합니다.");
	}
	else{
	var id=$('#info_id').val();
	console.log(id);
	var objdata={"id":id};
	
	$.ajax({
		type:"POST",
		url:"idcheck",
		data:{"id":id},
		dataType:'json',
		success : function(data){
			alert(data.code);
			var check=data.code;
			if(check.includes('가능')){
				var result = confirm("입력한 아이디를 사용하시겠습니까?");
				if(result == true){
					$('#id_check_button').attr("disabled",true);
					$('#info_id').attr("readonly",true);
				}
			}
		}, error : function(){
			alert("연결오류");
		}
		});
	}
}

function join_check(){
	alert("버튼눌렀똥?");
	var getName=RegExp(/^[가-힣]+$/); //이름 검사
	var getNickName=RegExp(/[~!@#$%^&*()_+|<>?:{}]/);//특수문자 체크
	var getPw=RegExp(/^[a-zA-Z0-9]{4,12}$/);//비밀번호 4-12
	var getPn=RegExp(/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/);//휴대폰 번호
	var getBd=RegExp(/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
	
	if($('#info_name').val() == "" && $('#info_nickname').val() =="" && $('#info_pw').val()=="" && $('#info_pw_check').val() =="" && $('#info_phonenumber').val() == "" && $('#info_bday').val() == ""){
	alert("공란이 있습니다 확인해 주세용");
	return false;
	}
	
	if(!getName.test($('#info_name').val())){
		alert("형식에 맞게 입력해주세요");
		$("#info_name").focus();
		return false;
	}
	
	if(getNickName.test($('#info_nickname').val())){
		alert("특수문자 사용 불가");
		$("#info_nickname").focus();
		return false;
	}
	
	if(!$('#id_check_button').prop("disabled")){
		alert("아이디 중복체크 하세용");
		return false;
	}
	
	if(!getPw.test($('#info_pw').val())){
		alert("비밀번호는 4-12자 사이의 영문 숫자 조합만 가능합니다");
		$('#info_pw').focus();
		return false;
	}
	
	if($('#info_pw').val()!=$('#info_pw_check').val()){
	 	alert("비밀번호 재입력 확인");
	 	$('#info_pw_check').focus();
	 	return false;
	}
	
	if(!getPn.test($('#info_phonenumber').val())){
		alert("올바른 핸드폰 번호를 입력하세요");
		$('#info_phonenumber').focus();
		return false;
	}
	
	if(!getBd.test($('#info_bday').val())){
		alert("올바른 생년월일을 입력하세요");
		$('#info_bday').focus();
		return false;
	}
	
	if(!$('#emailCheck').prop("disabled")){
		alert("이메일 인증 하세용");
		return false;
	}
	
	return true;
}