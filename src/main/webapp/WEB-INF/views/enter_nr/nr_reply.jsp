<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../qt_project/header.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cuting :: ${en.gb_id}님의 ${en.gb_title} 이야기</title>
<script src="${path}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${path}/resources/js/nr_reply.js"></script>
<script type="text/javascript" src="${path}/resources/js/enter_photo.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="${path}/resources/css/nr_reply_style.css">

</head>
<body>
	<div class= "main">
	 <div class="container">
	 	<div class="imgbox">
	 	 <img src="./resources/upload${en.gb_filename}">
	 	</div>
	 	
	 	<div class="sec">
	 		<div class="sec1">
	 		<i class="fas fa-paw"></i><span class="a">${en.gb_id}</span>
	 		</div>
	 		<div class="sec2">
	 			<ul class="reply">
	 				<div class="writerID"><i class="fas fa-paw"></i><span class="b"><strong>${en.gb_id}</strong></span>
	 					<li>
	 						<div class="writerCont">
	 							${en.gb_content}
	 						</div>
	 					</li>
	 				</div>
	 				
	 				<ul class="reply" id="replyID">
	 					<%-- 답글 부분입니다. 아래쪽에 코딩이 있습니다. --%>	
	 				</ul>
	 			</ul>
	 			
	 			
	 			<div class="sec3">
	 				
	 				
	 				
	 				
	 				<%-- 하트 작업시작 --%>
						<c:choose>
						 	<%-- 로그인 상태일때  클릭되게--%>
							<c:when test="${gb_id != null}">
								<c:choose>
									
									<%-- 빈하트일때 --%>
									<c:when test="${likeflag == '0' or likeflag == null}">
									
									<span class="iconbox">
									<a idx="${en.gb_postnb}" href="javascript:" class="heart-click heart_icon${en.gb_postnb}">
										<button type="button" name="likeButton" class="b1"><i class="fas fa-heart fa-heart01"></i></button>
									</a>
									</span>
									</c:when>						
								<c:otherwise>
									
									
									<%-- 꽉찬 하트일때 --%>
									<span class="iconbox"><a idx="${en.gb_postnb}" href="javascript:" class="heart-click heart_icon${en.gb_postnb}">
										<button type="button" name="likeButton" class="b2"><i style="color:red" class="fas fa-heart fa-heart02"></i></button>
									</a></span>
											
								</c:otherwise>
							</c:choose>
						</c:when>
						
							<%-- 로그인 상태가아닐때 클릭안되게 --%>
							<c:otherwise>
								<span class="iconbox"><a href="javascript:" class="heart-notlogin">
										<button type="button" name="likeButton"><i class="fas fa-heart fa-heart03"></i></button>
									</a></span>
									
							
							</c:otherwise>
						</c:choose>
						
						<%-- 하트 작업 끝 --%>
	 					 				
								<%-- <button type="button" name="likeButton">
									<i class="fas fa-heart"></i>
								</button>--%>
							 
							<span class="iconbox"> 
								<button type="button" name="comment-button" class="comment" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt${en.gb_postnb}" id="likebox">좋아요  ${en.gb_likecnt}개 </span>
	 			
	 			</div>
	 			<div class="sec4">
	 				<div class="textbox">														
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." name="rp_content" class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시" id="replyAddBtn">게시</button>
						</div>
	 			</div>
	 		</div>
	 	</div>
	 </div>
	 <div class="md" style="display:none">
	 <div class="modalchang" style="width: 200px; height: 200px; background-color: yellow;"></div>
	 	<div><button>삭제</button></div>
	 </div>
	 
	 <div class="blank"></div>
	 <div class="relativePost">
	  <div class="namespace">
	  	<div class="namebox"><p><strong>${en.gb_id}</strong> 님의 게시물 더 보기</p></div>
	  </div>
	  
	  <div class="poster">
				<ul>
				
					<c:forEach items="${gblist}" var="gb">
					<c:if test="${en.gb_id == 'gb.gb_id'}">
					<li>
						<div class="aa">
							<a href="nr_cont?gb_postnb=${gb.gb_postnb}&state=reply">
								<img src="./resources/upload${gb.gb_filename}" class="image" alt="그림아보여라."/><!-- 이미지 클릭시 모달창 오픈 -->
							</a>
						</div>
					</li>
					</c:if>
					</c:forEach>
									
					
					
				</ul>
				
			</div>
	 </div>
</div>
	
	
<script>

// 왜 이부분이 nr_reply.js로 가게되면 작동이 안되는지 모르겠네요.. 실행이안되어 jsp단에 두었습니다.

var gb_postnb='${en.gb_postnb}'; //게시물번호

getAllList();//댓글 목록함수 호출 

function getAllList(){
  $.getJSON("${path}/replies/all/"+gb_postnb,function(data){//get으로 JSON데이터를 비동기식 jQuery 아작스함수 $.getJSON()으로 
     //읽어와서 data매개변수에 저장
     var str="";
  $(data).each(function(){//each()함수로 반복
	  str +=  "<div data-rno='"+this.rno+"'class='writerID'><i class='fas fa-paw'></i><span class='b'>"+this.rp_id+"</span>";
	  str +=	"<button type='button' class='removeReply removeReply2'><i class='fas fa-times'></i></button>";
	  str +=	"<li>";
	  str += 	"<div class='writerCont'>"+this.rp_content+"</div>";					 
	  str +=	"</li>";
	  str +=  "</div>";					
  });
  $('#replyID').html(str);//문자와 태그를 변경적용
  });      
}//getAllList()

//댓글추가
$('#replyAddBtn').on("click",function(){
	  var rp_id = '${gb_id}'
	  var rp_content = $('.tx').val()//댓글내용
	  
	  if(!rp_id){ //비로그인 시 댓글쓰지 못하게 권한제어
		  alert('로그인 후 이용이 가능합니다.')
		  location="login"
	  }
	  
	  $.ajax({
		  type:'post',//비동기식 자료 보내는 방식
		  url:'${path}/replies',
		  headers:{
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override":"POST"
		  },
		  dataType:'text',
		  data:JSON.stringify({
			 gb_postnb:gb_postnb,//게시판번호
			 rp_id:rp_id,//댓글작성자
			 rp_content:rp_content //댓글내용
		  }),
		  success:function(result){
			  if(result == 'success'){
				  alert('댓글이 등록되었습니다!');
				  location.reload();
				  getAllList();//댓글목록 함수 호출
			  }
		  }
	  });
});


//댓글삭제  ----->> 왜 클릭이벤트가 먹지않은건지 모르겠네요.

$('.removeReply2').on('click',function(){
	console.log('클릭됌');
	var reply = document.querySelector( '.writerID' );	
	var rno=reply.attr("data-rno");
	
	console.log(reply);
	console.log(rno);
 	
	 $.ajax({
 		type:'delete',
		url:'/asd/replies/'+rno,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"DELETE"
		},
		dataType:'text',
		success:function(result){
 			if(result == 'success'){
				alert('댓글이 삭제되었습니다!');
 				location.reload();
 				getAllList();
 			}
 		}
		
	 });


});

</script>	
	
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>