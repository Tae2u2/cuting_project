<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>dogphoto01</title>
<%@ include file="../qt_project/header.jsp"%>
<link rel="stylesheet" href="./resources/css/dogphoto01_bet_style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
	<div class="container">

        <div class="sec1">
            <img src="./resources/images/photo_dog01.png">
        </div>

        <div class="sec2">
            <div class="nickName"><i class="fas fa-crown"></i><span>작성자 ID</span> </div>
            <div class="writterComment">작성자 코멘트</div>
            <div class="likecnt">좋아요 ${likeButton}개</div>
            <div class="price">상품 가격 : 50 마일리지</div>
            <div class="buttonarea">
            <a href="#"><button type="button" class="ggim">장바구니</button></a>
            <a href="#"><button type="button" class="buy">구매하기</button></a>
            </div>
        </div>
    </div>
</body>
</html>