<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
​<%
	Object obj_header=session.getAttribute("header");
	String header=(String)obj_header;
%> 
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/header_style.css">
<script src="https://kit.fontawesome.com/a963872baf.js" crossorigin="anonymous"></script>
</head>
<div class="menubar">
		<img src="./resources/images/logo2.png" class="logo">
		<ul>
			<li class="active"><a href="">STORY</a>
				<div class="sub-menu-1">
					<ul>
						<li><a href='#'>about큐팅</a></li>
						<li><a href='#'>Hot노름</a></li>
					</ul>
				</div></li>
			<li><a href="">오늘의노름</a>
				<div class="sub-menu-1">
					<ul>
						<li><a href='#'>How to 노름</a></li>
						<li><a href='#'>노름판입장</a></li>
					</ul>
				</div></li>
			<li><a href="">COMUNITY</a></li>
			<li><a href="">공지사항</a>
				<div class="sub-menu-1">
					<ul>
						<li><a href='#'>공지사항</a></li>
						<li><a href='#'>FAQ</a></li>
						<li><a href='#'>Q&A/신고</a></li>
						<li><a href='#'>EVENT</a></li>
					</ul>
				</div></li>
			<li><a href="">마이페이지<%=header %></a>
				<div class="sub-menu-1">
					<ul>
						<li><a href='myinfo'>나의 정보</a></li>
						<li><a href='#'>찜목록</a></li>
						<li><a href='#'>결제페이지</a></li>
					</ul>
				</div></li>
		</ul>
		
		<% if(header!=null){ %>
		<div class="welcome">
			<a href="logout">로그아웃</a>
		</div>
		<%}else{ %>
	 	<div class="welcome">
			<a href="login">로그인</a> | <a href="join">회원가입</a>
		</div>
		<%} %>
		
		
		</div>

