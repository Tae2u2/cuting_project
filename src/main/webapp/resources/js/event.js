/**
*event.js
*/

	function w_check(){
	
	if($.trim($('#ev_title').val()) == '' ){
	alert('제목을 입력하세요');
	$('#ev_title').val('').focus();
	return false;
	}
	
	if($.trim($('#ev_content').val()) == ''){
	alert('내용을 입력하세요');
	$('#ev_content').val('').focus();
	return false;
	}
	}