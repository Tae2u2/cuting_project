/**
 * 
 */


var dice;
var eid;
function emailSend(){
var getEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if($('#info_email').val()==""){
		alert("이메일 입력해라");
	}
	
	else if(!getEmail.test($('#info_email').val())){
		alert("이메일 똑바로 입력해라 진짜");
	}
	
	else{
	
	var email=$('#info_email').val();
		console.log(email);
	
	console.log('입력 이메일' + $('#info_email').val());
		
		$.ajax({
			type:"POST",
			url:"emailcheck",
			data:{"email":email},
			dataType:'json',
			success : function(data){
				alert(data.result);
				dice=data.dice;
			},error : function(e){
				alert('오류입니다. 잠시 후 다시 시도해주세요.');
			}
		});
	}
	
}


function checkmail(){
	var emailcheck=$('#au_check_email').val();
		console.log(emailcheck);
		alert(dice);
	if(emailcheck==dice){
		alert("인증에 성공하였습니다.")
		$('#emailCheck').attr("disabled",true);
		$('#info_email').attr("readonly",true);
		
		$('#au_check_email').hide();
		$('#check_email').hide();
	}
	else{
		alert("인증에 실패하였습니다.")
	}
}


	
	

