/**
 * 
 */
//게시판 번호

   getAllList();// 목록함수 호출
   
   function getAllList(){
     $.getJSON("/controller/comunity/all/"+cm_postnb,function(data){//get으로 JSON데이터를 비동기식 jQuery 아작스함수 $.getJSON()으로 
    	 //읽어와서 data매개변수에 저장
    	 const str="";
     $(data).each(function(){//each()함수로 반복
    	 str += "<li data-pt_postnb='"+this.pt_postnb+"' class='comunityList'><div class='comunityBox'><div class='userProfile'><p><i class='fas fa-paw'></i>"
    	 +this.pt_id+"<small>"+this.pt_update+"</small></p><span>"+this.pt_category+"</span></div><br><hr><p id='post-text'>"
    	 +this.pt_content+"</p><button id='postEditBtn' class='forBtnCss'>수정</button></div></li>";
     });
     $('#comunityZone').html(str);//문자와 태그를 변경적용
     });	   
   }//getAllList()
   
   //추가
   $('#postAddBtn').on("click",function(){
	   const ptId=$('#pt_id').val();//댓글작성자
	   const ptPw=$('#pt_pw').val();
	   const ptTitle=$('#pt_title').val();
	   const ptCategory=$('#pt_category').val();
	   const ptUpdate=$('#pt_update').val();//날짜
	   const ptContent=$('#pt_content').val();//댓글내용
	   
	   $.ajax({
		  type:'post',//비동기식 자료 보내는 방식
		  url:'/controller/comunity',
		  headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"
		  },
		  dataType:'text',
		  data:JSON.stringify({
			  1:cm_postnb,//번호
			  pt_id:ptId,//아이디
			  pt_pw:ptPw,
			  pt_category:ptCategory,
			  pt_title:ptTitle,
			  pt_update:ptUpdate,//날짜
			  pt_content:ptContent //댓글내용
		  }),
		  success:function(result){
			  if(result == 'success'){
				  location.reload();//새로고침
				  getAllList();//댓글목록 함수 호출
			  }else{
				  alert('죄송합니다. 다시 시도해주세욤');
			  }
		  }
	   });
   });
   
   //댓글 수정화면
   $('#comunityZone').on('click','.comunityList #postEditBtn',function(){
	  const comunity=$(this).parent();//parent() 부모요소를 선택
	  const ptPostnb=comunity.attr("data-pt_postnb");//댓글번호
	   const ptContents=comunity.children('#post-text').text();//댓글내용	 
	  
	  $('.editTitle').html(ptPostnb);
	  $('#pt_content').val(ptContents);
	  $('#editBox').show('show');//댓글수정화면을 보이게 한다.
   });
   
   //댓글 수정화면 닫기
   function editBoxClose(){
	   $('#editBox').hide('slow');
   }
   
   
   //댓글 수정완료
   $('#ptEditBtn').on('click',function(){
	  const ptPostnb=$('.editTitle').html();//댓글번호
	  const ptContent=$('#pt_content').val();//수정 댓글 내용
	  
	  $.ajax({
		 type:'put',
		 url:'/controller/comunity/'+ptPostnb,
		 headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"PUT"
		 },
		 data:JSON.stringify({pt_content:ptContent}),
		 dataType:'text',
		 success:function(result){//비동기식 아작스로 받아오는 것이 성공시 호출되는 콜백함수, 받아온 데이터는 result매개변수에 저장
			 if(result == 'success'){
				 alert('수정성공!');
				 $('#editBox').hide('slow');//댓글 수정화면을 숨긴다.
				 getAllList();//댓글목록 함수 호출
			 }
		 }
	  });
   });
   
   //댓글삭제
   $('#ptDelBtn').on('click',function(){
	   const ptPostnb=$('.editTitle').html();//댓글번호
	   
	   $.ajax({
		  type:'delete',
		  url:'/controller/comunity/'+ptPostnb,
		  headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"DELETE"
		  },
		  dataType:'text',
		  success:function(result){
			  if(result=='success'){
				  alert('삭제!');
				  $('#editBox').hide('slow');
				  location.reload();//단축키 F5 즉 새로고침
				  getAllList();
			  }else{
				  alert('삭제실패 다시 시도해주세요!');				
			}
		  }
	   });
   });

