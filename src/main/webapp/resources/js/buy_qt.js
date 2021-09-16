/**
 * 
 */
 

 
 function buy_check1234(){
 
 	
 	
 	$.ajax({
 	url:"payment",
 	type:"post",
 	dataType:"json",
 	data : {title: title},
 	success: function(data){
 		alert('성공');
 	}, error:function(e){
 	}
 	});
 }