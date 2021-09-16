

const inputs = document.querySelectorAll('.inputLog');


function focusFunc(){
	let parent = this.parentNode.parentNode;
	parent.classList.add('focus');
}

function blurFunc(){
	let parent = this.parentNode.parentNode;
	if(this.value == ""){
	parent.classList.remove('focus');
	}
		
}
	

inputs.forEach(inputLog => {
	inputLog.addEventListener('focus', focusFunc);
	inputLog.addEventListener('blur', blurFunc);
});

function findid(){
	var email = prompt("아이디를 입력하세요");
	
	if(email==null || email==''){
		alert("입력취소");
	}else{
		if(email.indexOf("@") == -1 || email.indexOf(".") == -1){
			alert("올바른 형식으로 입력해주세요");
		}
		else{
			alert("아작스 왜안됨?");
			$.ajax({
				type:'POST',
				url:'findId',
				data:{"email":email},
				dataType:'json',
				success:function(data){
					alert(data.result);
				},
				error:function(e){
					alert(e);
				}
				});
		}
	}
}


function findpw(){
	var id = prompt("아이디를 입력하세요");
	
	if(id==null || id==''){
		alert("입력취소");
	}else{
			alert("아작스 왜됨?");
			$.ajax({
				type:'POST',
				url:'findpw',
				data:{"id":id},
				dataType:'json',
				success:function(data){
					alert(data.result);
				},
				error:function(e){
					alert(e);
				}
				});
		
	}
}


