/**
 * notice.js
 */
 
 function write_check()
 {  
    
    if($.trim($('#no_title').val()) == '')
    {
      alert('글제목을 입력하세요!');
      $('#no_title').val('').focus();
      return false;
    } 

    
    if($.trim($('#no_content').val()) == '')
    {
      alert('글내용을 입력하세요!');
      $('#no_content').val('').focus();
      return false;
    } 
   
 }
