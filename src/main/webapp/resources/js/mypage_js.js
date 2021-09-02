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
		url:'kakaopay' ,
		dataType:'json',
		success:function(data){
			var box = data.next_redirect_pc_url;
			window.open(box);
		},
		error:function(error){
		alert(error);
		}
		});
	});
});
	