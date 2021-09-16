<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../qt_project/header.jsp" %>
<meta charset="UTF-8">
<title>큐팅::함께소통하세요</title>
<link rel="stylesheet" href="${path}/resources/css/comunity_style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/emojionearea/3.4.2/emojionearea.min.css">
</head>
<body>
	<div class="qt_aside">
	<ul>
		<li><a href="#">#자유게시판</a></li>
		<li><a href="#">#자랑자랑</a></li>
		<li><a href="#">#헬프미아임초보</a></li>
		<li><a href="#">#댕댕이#산책조아</a></li>
		<li><a href="#">#집사#캔따개</a></li>
	</ul>
</div>
	<div class="forLineUp">
	<h1>COMUNITY</h1>
	<!-- 사이드바 추가예정 -->
	<div class="write-post-container">
		<div class="user-profile">
			<i class="fas fa-paw"></i>
			<div>
				<p>[닉네임]</p>
				<small><select name="chooseComunity" id="comunity-select">
					<option value="freeCm">자유게시판</option>
					<option value="proudCm">자랑자랑</option>
				</select></small>
			</div>		
		</div>
		<!-- 글쓰는 폼 -->
		<div class="post-input-container">
			<textarea required id="comunityArea" rows="3" placeholder="당신의 귀여운 이야기를 들려주세요!"></textarea>
			
			
			<div class="add-post-links">
				<a href="#"><i class="far fa-smile-wink"></i>오늘어때요?</a>
				<a href="#"><i class="fas fa-image"></i>사진첨부</a>
				<input type="file" id="add-file" accept=".jpg, .jpeg, .png"><!-- input file태그 정확한 사용법 아직 헷갈림 더 공부해서 마무리하겠음 -->
				<input type="button" name="post-Btn" id="post-Btn" value="글쓰기">
			</div>
		</div>
		
	</div>
	
	<!-- 글내용 보여지는 곳 시작 -->
	<div class="post-container">
		<div class="user-profile">
			<i class="fas fa-paw"></i>
			<div>
				<p>[닉네임]</p>
				<span>[여기 글남긴 날짜랑 시간 들어가게]</span>
			</div>		
		</div>
		<p class="post-text">[글내용 안녕하세요 오늘은 날씨가 덥지만 그래도 입추가 지났다고 밤에는 선선하더라구요 밤에 강아지 산책시키기 좋은 날입니다. 다들 즐거운 산책하세요!]</p>
		<img src="${path}/resources/images/woong/woong5.jpg" class="post-img">
		<!-- 여기에 보통 좋아요 버튼이나 댓글 들어가는데  이거 한다고 하면 추가작업 하겠음-->

	</div>
	
	<div class="post-container">
		<div class="user-profile">
			<i class="fas fa-paw"></i>
			<div>
				<p>[닉네임]</p>
				<span>[여기 글남긴 날짜랑 시간 들어가게]</span>
			</div>		
		</div>
		<p class="post-text">[글내용]</p>
	</div>
	
	<div class="post-container">
		<div class="user-profile">
			<i class="fas fa-paw"></i>
			<div>
				<p>[닉네임]</p>
				<span>[여기 글남긴 날짜랑 시간 들어가게]</span>
			</div>		
		</div>
		<p class="post-text">[글내용]</p>
	</div>


	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/emojionearea/3.4.2/emojionearea.min.js"></script>
<script>
	$('#comunityArea').emojioneArea({
		pickerPosition: 'right';
	});
</script>
</body>
<%@ include file="../qt_project/bottom_qt.jsp" %>