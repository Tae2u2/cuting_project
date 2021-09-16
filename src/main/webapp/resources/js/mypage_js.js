/**
 * 
 */

const tabBtn = document.querySelectorAll(".tab");

const tab=document.querySelectorAll(".tabShow");

function tabs(panelIndex) {
	tab.forEach(function(node) {
		node.style.display ="none";
	});
	tab[panelIndex].style.display = "block";
}
tabs(0);

$(".tab").click(function() {
			$(this).addClass("active").siblings().removeClass("active");
		});
		
		

$(function(){
	$('#charge').click(function(){
	alert('클릭했네?');
	$.ajax({
		url:'kakaoPay' ,
		dataType:'json',
		success:function(data){
			var box = data.next_redirect_pc_url;
			alert(box);
			window.open(box);
		},
		error:function(error){
		alert(error);
		}
		});
	});
});

function modifyinfo(){
	alert('수정하기 클릭');
	$("#info_name").removeAttr("readonly");
	$("#info_nickname").removeAttr("readonly");
	$("#info_birth").removeAttr("readonly");
	$("#info_phonenumber").removeAttr("readonly");
	$("#info_info_pw").removeAttr("readonly");
	$("#modib").hide();
	$("#hidebt").css({
            display: "inline"
        });

}

function modicheck(){
	var bool = confirm('입력한 정보를 저장하시겠습니까?');
	if(bool==true){
		return true;
	}
	else{
		return false;
	}
}


