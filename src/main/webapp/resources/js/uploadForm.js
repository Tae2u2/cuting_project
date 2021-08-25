
function uploadForm_check(){
 
 	if($.trim($('.title_area').val()) == ''){
      alert('글내용을 입력하세요!');
      $('.title_area').val('').focus();
      return false;
    } 
 
    if($.trim($('.textbox').val()) == ''){
      alert('글내용을 입력하세요!');
      $('.textbox').val('').focus();
      return false;
    } 
    
    
 }