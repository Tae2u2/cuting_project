<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내용보기폼</title>
<%@ include file="../qt_project/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/nr_cont_style.css">
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script type="text/javascript" src="${path}/resources/js/buy_qt.js"></script>
</head>
<script>
var msg='${result}';

if(msg.contains("잔액")){
	  alert('잔액이 부족합니다!');
}
</script>
<body>
	<c:set var="id" value='${en.gb_id}'/>
	<c:set var="filename" value='${en.gb_filename}'/>
	<c:set var="postnb" value='${en.gb_postnb}'/>
	<%
		String id = (String)pageContext.getAttribute("id");
		String filename = (String)pageContext.getAttribute("filename");
		String postnb = pageContext.getAttribute("postnb").toString();
	%>
	
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
<<<<<<< HEAD
				<a href="#"><button type="button" class="ggim">장바구니</button></a>
				<form method="post" action="payment"><button type="submit" class="buy">구매하기</button>
				<input type='hidden' name="id" value=<%=id %>/>
				<input type='hidden' name="filename" value=<%=filename %>/>
				<input type='hidden' name="postnb" value=<%=postnb %>/>
				</form>
=======
			
			
			<form method="post" action="insert.do">
				<input type="hidden" name="gb_postnb" value="${en.gb_postnb}">
				<input type="submit" value="장바구니" class="ggim">
			</form>
				
				<a href="#"><button type="button" class="buy">구매하기</button></a>
>>>>>>> branch 'master' of https://github.com/Tae2u2/cuting_project.git
			</div>
		</div>
	</div>
	
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>
