<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/uploadForm_style.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>업로드폼</title>
<%@ include file="header.jsp" %>
</head>
<body>
<form method="post" action="uploadForm_ok" onsubmit="return uploadForm_check();" enctype="multipart/form-data">
	<div class="forLineUp">
	<h1>나만의 글 쓰기</h1>
	
	
	<div class="write-post-container">
		<div class="user-profile">
			<i class="fas fa-paw"></i>
			<div>
				<p><script>document.write('${gb_id}')</script></p>
			</div>		
		</div>
		<div class="select-box-container">
		 카테고리 선택: <select>
		  <option>강아지</option>
		  <option>고양이</option>
		  <option>친구들</option>
		 </select>
		</div>
		<div class="title_box">
		 글제목 : <input type="text" class="title_area">
		</div>
		<!-- 글쓰는 폼 -->
		<div class="post-input-container">
			<textarea rows="3" class="textbox" placeholder="당신의 귀여운 이야기를 자랑해주세요!"></textarea>
			<div class="add-post-links">
				<a href="#"><i class="far fa-smile-wink"></i>오늘어때요?</a>
				<a href="#"><i class="fas fa-image"></i>사진첨부</a>
				<input type="file" id="add-file" accept=".jpg, .jpeg, .png">
				<input type="submit" name="post-Btn" id="post-Btn" value="글쓰기">
			</div>
		</div>
		
		</div>
		
	</div>
</form>
</body>
<%@ include file="bottom_qt.jsp" %>