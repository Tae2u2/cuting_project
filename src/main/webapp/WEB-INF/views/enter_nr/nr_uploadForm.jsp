<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/uploadForm_style.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script type="text/javascript" src="${path}/resources/js/uploadForm.js"></script>
<title>업로드폼</title>
<%@ include file="../qt_project/header.jsp"%>
</head>
<body>
<form method="post" action="uploadForm_ok" onsubmit="return upload_check();" enctype="multipart/form-data">
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
		 카테고리 선택: <select name="gb_category">
		  <option value="1" >강아지</option>
		  <option value="2" >고양이</option>
		  <option value="3" >친구들</option>
		 </select>
		</div>
		<div class="title_box">
		 글제목 : <input type="text" id="title_area" name="gb_title" required="required">
		</div>
		<!-- 글쓰는 폼 -->
		<div class="post-input-container">
			<textarea rows="3" id="textbox" name="gb_content" placeholder="당신의 귀여운 이야기를 자랑해주세요!" required="required"></textarea>
			<div class="add-post-links">
				<a href="#"><i class="far fa-smile-wink"></i>오늘어때요?</a>
				<a href="#"><i class="fas fa-image"></i>사진첨부</a>
				<input type="file" id="add-file" name="gb_filename" accept=".jpg, .jpeg, .png">
				<input type="submit" name="post-Btn" id="post-Btn" value="글쓰기">
			</div>
		</div>
		
		</div>
		
	</div>
</form>
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>