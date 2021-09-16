<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <script src="${path}/resources/js/jquery.js"></script>
​<%
	Object obj_header=session.getAttribute("header");
	String header=(String)obj_header;
%> 
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/header_style.css">
<script src="https://kit.fontawesome.com/a963872baf.js" crossorigin="anonymous"></script>
<link rel="shortcut icon" href="#">
</head>
<div class="menubar">
		<a href="/controller/"><img src="${path}/resources/images/logo2.png" class="logo"></a>

		<ul>
			<li class="active"><a href="about_qt">about큐팅</a>
				<div class="sub-menu-1">
					<ul>
						<li><a href="hot">Hot노름</a></li>
					</ul>
				</div></li>
			<li><a href="enter_nr">오늘의노름</a>
				<div class="sub-menu-1">
					<ul>
						<li><a href='#'>How to 노름</a></li>
						<li><a href='enter_nr'>노름판입장</a></li>
					</ul>
				</div></li>
			<li><a href="/controller/comunity?cm_postnb=1">COMUNITY</a></li>
			<li><a href="board_qt">공지사항</a>
				<div class="sub-menu-1">
					<ul>
						<li><a href="FAQ_qt">FAQ</a></li>
						<li><a href="QnA_qt">Q&A/신고</a></li>
						<li><a href="event_qt">EVENT</a></li>
					</ul>
				</div></li>
			<!-- <li><a href="">마이페이지</a>
				<div class="sub-menu-1">
					<ul>
						<li><a href='myinfo'>나의 정보</a></li>
						<li><a href='#'>찜목록</a></li>
						<li><a href='#'>결제페이지</a></li>
					</ul>
				</div>
				</li>-->
		</ul>
		
		<% if(header!=null){ %>
		<div class="mypageBox">
			<div class="mypageContent">
				<h2><%=header %>님!<br><span>환영합니다!</span></h2>
			</div>
			<ul class="memberNavi">
				<li><a href='myinfo'><i class="fas fa-user"></i>회원정보</a></li>
				<li><a href="checklist"><i class="fas fa-heart"></i>찜목록</a></li>
				<li><a href="#"><i class="far fa-credit-card"></i>결제페이지</a></li>
				<li><a href="#"><i class="far fa-list-alt"></i>나의노름관리</a></li>
				<li><a href='logout'><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
			</ul>
			<div class="memberToggle">
				<i class="fas fa-caret-down"></i>
			</div>
		</div>
		<%}else{ %>
	 	<div class="welcome">
			<a href="login">로그인</a> | <a href="join">회원가입</a>
		</div>
		<%} %>
		
		
		</div>
<script type="text/javascript" src="${path}/resources/js/header.js"></script>
