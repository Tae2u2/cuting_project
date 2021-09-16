<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내용보기폼</title>
<%@ include file="../qt_project/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/nr_cont_style.css">
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

	<div class="container">
		<div class="sec1">
			<img src="./resources/upload${en.gb_filename}" alt="cont_image">
		</div>

		<div class="sec2">
			<div class="reform_del">
				<button type="button" alt="edit" onclick="location='nr_cont?gb_postnb=${en.gb_postnb}&state=modify';">
						<i class="far fa-edit"></i>
				</button> | <button type="button" alt="delete" onclick="location='nr_cont?gb_postnb=${en.gb_postnb}&state=del';">
						<i class="fas fa-trash-alt"></i>
					</button>
			</div>
			<div class="nickName">
				<i class="fas fa-crown"></i><span>${en.gb_id}</span>
			</div>
			<div class="writterComment">${en.gb_title}<br>${en.gb_content}</div>
			<div class="likecnt">조회수 : ${en.gb_viewcnt}</div>
			<div class="price">상품 가격 : 50 마일리지</div>
			<div class="buttonarea">
			
			
			<form method="post" action="insert.do">
				<input type="hidden" name="gb_postnb" value="${en.gb_postnb}">
				<input type="submit" value="장바구니" class="ggim">
			</form>
				
				<a href="#"><button type="button" class="buy">구매하기</button></a>
			</div>
		</div>
	</div>
	
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>
