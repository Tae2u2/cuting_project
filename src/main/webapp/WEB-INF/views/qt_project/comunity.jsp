<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="css/comunity_style.css">
<title>큐팅::함께소통하세요</title>
</head>
<body>
<!-- 이 페이지가 제가 제안하는 커뮤니티 UI입니다. 메인 부분은 트위터참고했고, 
	프로필사진 안한다고 해서 그냥 대충 이모티콘 발바닥 달았는데. 저부분 없이 그냥 바로 닉네임 날짜만 뜨게 해도 됨
	게시글에 좋아요나 댓글다는 그런것도 해야되는데 팀원분들이 싫다고 할 수 도 있으니까 일단 보류했습니다.
	사이드바 작업도 마찬가지 인데 	사이드 바 작업하면 카테고리가 세로로 들어가는 것 뿐이라 데이터구축에 큰영향은 없을 것 같습니다.

 -->
	<div class="forLineUp">
	<h1>COMUNITY</h1>
	<!-- 사이드바 추가예정 -->
	<div class="write-post-container">
		<div class="user-profile">
			<i class="fas fa-paw"></i>
			<div>
				<p>[닉네임]</p>
				<small>[카테고리 여기서 고르게]</small>
			</div>		
		</div>
		<!-- 글쓰는 폼 -->
		<div class="post-input-container">
			<textarea rows="3" placeholder="당신의 귀여운 이야기를 들려주세요!"></textarea>
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
		<img src="images/woong/woong5.jpg" class="post-img">
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

	<!-- 여기다가 페이징 할지 아니면 끝없이 로딩되게 할지 고민중-->
	<h3> 여기다가 쪽 나눌지 아니면 로딩되게 할지.</h3>
	</div>
</body>
<%@ include file="bottom_qt.jsp" %>