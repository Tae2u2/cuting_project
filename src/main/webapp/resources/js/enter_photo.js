$(document).ready(function(){
	
	$('.heart-click').click(function(){ //로그인한 상태에서 하트를 클릭할때

	if($(this).children('button').attr('class')== "b1"){
	
	var gb_postnb = $(this).attr('idx');  // jsp에서 <a></a>에 게시물 번호값을 담아서 컨트롤 단에 넘겨줌
	console.log("heart-click");
	
	
	//만약 빈하트를 눌렀다면?
		console.log("빈하트출력"+gb_postnb); //아까 넘겨받은 게시물번호가 잘 받아졌는지 확인
		
		$.ajax({  //비동기식 아작스 활용해서 하트부분만 빈하트에서 -> 빨간하트로 바뀌고자 기획함.
			
			url : 'saveHeart.do',
			type : 'get',
			data : {
				gb_postnb: gb_postnb,
			},
			datatype: 'json',
			headers:{
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override":"GET"
		 	 },
			success : function(en,gb_likecnt){
				//location.reload();
				var heart = en.gb_likecnt;		
				//$('.likecnt'+gb_postnb).html(heart);
				 $('.likecnt'+gb_postnb).html( '좋아요 '+heart +'개');

				//console.log(en);
				//onsole.log(en.gb_likecnt);
				
				console.log('하트추가 성공');
				
			},
			error : function(){
				alert('서버 에러');
			}
			
		});
		//return heart;
		
		console.log('색깔있는 하트로 바껴라 얍');
		
		
		//색깔있는 하트로 바꾸기
		//$(this).html('<button type="button" name="likeButton"><i style="color:red" class="fas fa-heart fa-heart02"></i></button>');
		$('.heart_icon'+gb_postnb).html('<button type="button" name="likeButton" class="b2"><i style="color:red" class="fas fa-heart fa-heart02"></i></button>');
		
		
			
		
		
	}else if($(this).children('button').attr('class')== "b2"){

		//만약 빨간하트를 클릭했다면? 
		var gb_postnb = $(this).attr('idx');

		
		console.log("heart-click");
		console.log('빨간하트 클릭'+gb_postnb);
		
		$.ajax({
			
			url : 'removeHeart.do',
			type : 'get',
			data : {
				gb_postnb : gb_postnb,
			},
			datatype: 'json',
			headers:{
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override":"GET"
		 	 },
			success : function(en){
				//location.reload();
				var heart = en.gb_likecnt;   // heart 는 좋아요 갯수 출력하는 변수로 설정
				//$('.likecnt'+gb_postnb).html(heart); // 좋아요 갯수 표시
				$('.likecnt'+gb_postnb).html( '좋아요 '+heart +'개');
				
				console.log('하트삭제 성공');
			},
			error : function(){
				alert('서버 에러');
			}				
		});
		console.log('빈하트로 바껴라 얍!');
		
		//빈하트로 바꾸기
		//$(this).html('<button type="button" name="likeButton"><i class="fas fa-heart fa-heart01"></i></button>');
		$('.heart_icon'+gb_postnb).html('<button type="button" name="likeButton" class="b1"><i class="fas fa-heart fa-heart01"></i></button>');	

	}
	});
	

	//로그인을 하지 않은 상태에서 하트를 클릭시 로그인해야한다는 알림창이 뜨도록 설계
	$('.heart-notlogin').unbind('click');
	$('.heart-notlogin').click(function(){
		alert('로그인하셔야 이용할 수 있습니다.');
	});


	$(window).bind("pageshow",function (event){
		if(event.originalEvent.persisted || (window.performance && window.performance.navigation.type == 2)){
			console.log('BFCahe로부터 복원됌');
			$('.heart-click').css("pointer-events","none");
			location.reload();
		}
		else{
			console.log('새로열린페이지');
		}
	
	});
});
