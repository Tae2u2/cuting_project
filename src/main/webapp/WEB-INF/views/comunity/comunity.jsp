<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../qt_project/header.jsp"%>
<meta charset="UTF-8">
<title>큐팅::함께소통하세요</title>
<script src="${path}/resources/js/jquery.js"></script>
<link rel="stylesheet" href="${path}/resources/css/comunity_style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/emojionearea/3.4.2/emojionearea.min.css">
</head>
<body>
        <h1>COMUNITY</h1>
        <div class="forLine">
        <div class="postAside">
            <ul class="hashtagList">
                <li><a href="#">#자유게시판</a></li>
                <li><a href="#">#자랑자랑</a></li>
                <li><a href="#">#헬프미아임초보</a></li>
                <li><a href="#">#댕댕이#말랑콩떡</a></li>
                <li><a href="#">#집사#고영희</a></li>
            </ul>
        </div> 
	        <div class="postContainer">
            <!--커뮤니티본체-->
            <table border="1" style="display: none;">
            <tr><th>번호</th> <td>${cm.cm_postnb}</td></tr>
            </table>

<!--수정모달 -->
    <div id="editBox" style="display: none;">
        <div class="editTitle"></div>
        <div class="editPostBox">
        <textarea required id="pt_content" name="pt_content" rows="9"></textarea>
        </div>
        <div class="forbtnLine">
        <button type="button" id="ptEditBtn" class="forBtnCss">수정</button>
        <button type="button" id="ptDelBtn" class="forBtnCss">삭제</button>
        <button type="button" id="ptCloseBtn" class="forBtnCss" onclick="editBoxClose();">닫기</button>
        </div>
    </div>
 
<!--글쓰는 박스-->
    <div class="postBox">
        <div class="postProfile">
            <input type="hidden" name="pt_id" id="pt_id" value="<%=header%>"/>
            <input type="hidden" name="pt_pw" id="pt_pw" value="<%=header%>"/>
            <input type="hidden" name="pt_title" id="pt_title" value="<%=header%>"/>
            <h4><i class="fas fa-paw"></i><%=header%>님! 큐팅에서 소통하세요!</h4>
        </div>
        <div class="postCategoryBox">
        <select name="pt_category" id="pt_category">
            <option value="77">자유게시판</option>
            <option value="66">자랑자랑</option>
            <option value="55">헬프미아임초보</option>
            <option value="44">댕댕이</option>
            <option value="33">고영희</option>
        </select>
        </div>
        <div class="postContentBox">
        <textarea required name="pt_content" id="pt_content" placeholder="당신의 귀여운 이야기를 나눠주세요!"></textarea>
        </div>
        <input type="file" id="pt_filename" name="pt_filename">
        <button id="postAddBtn">글쓰기</button>
    </div>
</div>
</div>

 <!--글목록-->
    <ul id="comunityZone">
    <li class="comunityList">
            <div class="comunityBox">
                <div class="userProfile">
                <p><i class="fas fa-paw"></i>${pt.pt_id}<small>${pt.pt_update}</small></p>
                <span>${pt.pt_category}</span>
                </div>
                <br>
                <hr>
                <p id="post-text">${pt.pt_content}</p>
                <button id="postEditBtn" class="forBtnCss">수정</button>
            </div>
        </li>
    </ul>
    
  <script>
  const cm_postnb=${cm.cm_postnb};
  
   getAllList();// 목록함수 호출
   
   function getAllList(){
     $.getJSON("/controller/posting/all/"+cm_postnb,function(data){//get으로 JSON데이터를 비동기식 jQuery 아작스함수 $.getJSON()으로 
    	 //읽어와서 data매개변수에 저장
    	 const str="";
     $(data).each(function(){//each()함수로 반복
    	 str += "<li data-pt_postnb='"+this.pt_postnb+"' class='comunityList'><div class='comunityBox'><div class='userProfile'><p><i class='fas fa-paw'></i>"
    	 +this.pt_id+"<small>"+this.pt_update+"</small></p><span>"+this.pt_category+"</span></div><br><hr><p id='post-text' class='com'>"
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
		  url:'/controller/posting',
		  headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"
		  },
		  dataType:'text',
		  data:JSON.stringify({
			  cm_postnb:cm_postnb,//번호
			  pt_id:ptId,//아이디
			  pt_pw:ptPw,
			  pt_category:ptCategory,
			  pt_title:ptTitle,
			  pt_update:ptUpdate,//날짜
			  pt_content:ptContent //댓글내용
		  }),
		  success:function(result){
			  if(result == 'success'){
				  alert('성공');
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
	   const ptContents=comunity.children('.com').text();//댓글내용	 
	  
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
		 url:'/controller/posting/'+ptPostnb,
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
		  url:'/controller/posting/'+ptPostnb,
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
</script>
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>