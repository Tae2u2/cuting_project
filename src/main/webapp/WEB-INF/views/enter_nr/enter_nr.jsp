<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>오늘의 노름</title>
<%@ include file="../qt_project/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/enter_nr.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="${path}/resources/js/enter_photo.js"></script>
</head>
<body>

	<div class="clear"></div>

	<div class="container">
		<div class="container_space">
			<div class="container_menu">

				<div class="container_tab">
					<ul class="nav nav-tabs">
						<li><a class="nav-link active" data-toggle="tab" href="#dog">강아지</a></li>
						<li><a class="nav-link" data-toggle="tab" href="#cat">고양이</a></li>
						<li><a class="nav-link" data-toggle="tab" href="#friends">그	외 친구들</a></li>
					</ul>
				</div>
				
					<form action="enter_nr" method="get" class="search_box">
						<div class="search_div">
							<select name="find_field">
								<option value="gb_id" <c:if test="${find_field == 'gb_id'}"> ${'selected'}</c:if>>작성자</option>
								<option value="gb_title" <c:if test="${find_field == 'gb_title'}"> ${'selected'}</c:if>>글제목</option>
								<option value="gb_content" <c:if test="${find_field == 'gb_content'}"> ${'selected'}</c:if>>글내용</option>
							</select>

							<input type="text" class="text_space" name="find_name" value="${find_name}" placeholder="검색해봐!">
						</div>
						
						<button type="submit">
							<i class="fas fa-search"></i>
						</button>
					</form>
			</div>
		</div>

		<div class="clear"></div>
		
		<a href="uploadForm"><button type="button" class="add_photo"><i class="fas fa-plus"></i></button></a>

		<div class="tab-content">
		
		<!-- 강아지 탭메뉴공간입니다. ul 줄이라 생각하면되고 li는 한 줄안에 3개씩들어가는 구성품입니다. -->
			<div class="tab-pane fade show active" id="dog">
				<ul>
					<%-- <c:forEach var="a" items="${hlist}">
						  하트번호: ${a.hno}<hr/>
						  자료실 게시물번호: ${a.gb_postnb}<hr/>
						  회원아이디: ${a.gb_id}<hr/>
						 하트선택: ${a.likeflag }<hr/>
						</c:forEach> --%>
					
					<c:forEach items="${gblist}" var="en">					
					
					<c:if test="${en.gb_category == '1' }">
					<li>
						<div class="aa">
							<a href="nr_cont?gb_postnb=${en.gb_postnb}&state=reply">
								<img src="./resources/upload${en.gb_filename}" class="image" alt="그림아보여라."/><!-- 이미지 클릭시 모달창 오픈 -->
							</a>
						</div>
						
						
						
						
						<div class="bb">
						
						<%-- 하트 작업시작 --%>
						
						
						<c:choose>
						 	<%-- 로그인 상태일때  클릭되게--%>
							<c:when test="${gb_id != null}">
							
								<c:choose>
									
									<%-- 빈하트일때 --%>
									<c:when test="${likeflag == '0' or likeflag == null}">
									<a idx="${en.gb_postnb}" href="javascript:" class="heart-click heart_icon${en.gb_postnb}">
										<button type="button" name="likeButton" class="b1"><i class="fas fa-heart fa-heart01"></i></button>
									</a>
									</c:when>						
								<c:otherwise>
									
									
									<%-- 꽉찬 하트일때 --%>
									
									<a idx="${en.gb_postnb}" href="javascript:" class="heart-click heart_icon${en.gb_postnb}">
										<button type="button" name="likeButton" class="b2"><i style="color:red" class="fas fa-heart fa-heart02"></i></button>
									</a>
											
								</c:otherwise>
							</c:choose>
							
						</c:when>
						
							<%-- 로그인 상태가아닐때 클릭안되게 --%>
							<c:otherwise>
								<a href="javascript:" class="heart-notlogin">
										<button type="button" name="likeButton"><i class="fas fa-heart fa-heart03"></i></button>
									</a>
									
							
							</c:otherwise>
						</c:choose>
						
						<%-- 하트 작업 끝 --%>
							
								<%-- <span class="likecnt${en.gb_postnb}">좋아요 ${en.gb_likecnt}개</span>--%>
								<%--<button type="button" name="likeButton"><i class="fas fa-heart fa-heart01"></i></button> --%>
								<a href="nr_cont?gb_postnb=${en.gb_postnb}&state=reply">
									<button type="button" name="comment-button" class="image01"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								</a>
								<a href="nr_cont?gb_postnb=${en.gb_postnb}&state=content">
									<div class="pad">
										<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
									</div>
								</a>
						</div>
					</li>
					</c:if>
					</c:forEach>
				</ul>
				
			</div>

		<!-- 고양이 탭메뉴공간입니다. ul 줄이라 생각하면되고 li는 한 줄안에 3개씩들어가는 구성품입니다. -->
			<div class="tab-pane fade" id="cat">
				<ul>
								
					<c:forEach items="${gblist}" var="en">					
					
					<c:if test="${en.gb_category == '2' }">
					<li>
						<div class="aa">
							<a href="nr_cont?gb_postnb=${en.gb_postnb}&state=reply">
								<img src="./resources/upload${en.gb_filename}" class="image" alt="그림아보여라."/><!-- 이미지 클릭시 모달창 오픈 -->
							</a>
						</div>
									
						<div class="bb">
						
						
						<%-- 하트 작업시작 --%>
							
						<c:choose>
						 	<%-- 로그인 상태일때  클릭되게--%>
							<c:when test="${gb_id != null}">
							
								<c:choose>
									
									<%-- 빈하트일때 --%>
									<c:when test="${likeflag == '0' or likeflag == null}">
									<a idx="${en.gb_postnb}" href="javascript:" class="heart-click heart_icon${en.gb_postnb}">
										<button type="button" name="likeButton" class="b1"><i class="fas fa-heart fa-heart01"></i></button>
									</a>
									</c:when>						
								<c:otherwise>
									
									
									<%-- 꽉찬 하트일때 --%>
									
									<a idx="${en.gb_postnb}" href="javascript:" class="heart-click heart_icon${en.gb_postnb}">
										<button type="button" name="likeButton" class="b2"><i style="color:red" class="fas fa-heart fa-heart02"></i></button>
									</a>
											
								</c:otherwise>
							</c:choose>
							
						</c:when>
						
							<%-- 로그인 상태가아닐때 클릭안되게 --%>
							<c:otherwise>
								<a href="javascript:" class="heart-notlogin">
										<button type="button" name="likeButton"><i class="fas fa-heart fa-heart03"></i></button>
									</a>
					
							</c:otherwise>
						</c:choose>
						
						<%-- 하트 작업 끝 --%>
							
								<%-- <span class="likecnt${en.gb_postnb}">좋아요 ${en.gb_likecnt}개</span> --%>
								<%--<button type="button" name="likeButton"><i class="fas fa-heart fa-heart01"></i></button> --%>
								<button type="button" name="comment-button" class="image01"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="nr_cont?gb_postnb=${en.gb_postnb}&state=content">
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
								</div></a>
						</div>
					</li>
					</c:if>
					</c:forEach>
				</ul>
				
			</div>

		<!-- 다른 동물 친구들 탭메뉴공간입니다. ul 줄이라 생각하면되고 li는 한 줄안에 3개씩들어가는 구성품입니다. -->	
			<div class="tab-pane fade" id="friends">
				<ul>
								
					<c:forEach items="${gblist}" var="en">					
					
					<c:if test="${en.gb_category == '3' }">
					<li>
						<div class="aa">
							<a href="nr_cont?gb_postnb=${en.gb_postnb}&state=reply">
								<img src="./resources/upload${en.gb_filename}" class="image" alt="그림아보여라."/><!-- 이미지 클릭시 모달창 오픈 -->
							</a>
						</div>
									
						<div class="bb">
						
						
						<%-- 하트 작업시작 --%>
							
						<c:choose>
						 	<%-- 로그인 상태일때  클릭되게--%>
							<c:when test="${gb_id != null}">
							
								<c:choose>
									
									<%-- 빈하트일때 --%>
									<c:when test="${likeflag == '0' or likeflag == null}">
									<a idx="${en.gb_postnb}" href="javascript:" class="heart-click heart_icon${en.gb_postnb}">
										<button type="button" name="likeButton" class="b1"><i class="fas fa-heart fa-heart01"></i></button>
									</a>
									</c:when>						
								<c:otherwise>
									
									
									<%-- 꽉찬 하트일때 --%>
									
									<a idx="${en.gb_postnb}" href="javascript:" class="heart-click heart_icon${en.gb_postnb}">
										<button type="button" name="likeButton" class="b2"><i style="color:red" class="fas fa-heart fa-heart02"></i></button>
									</a>
											
								</c:otherwise>
							</c:choose>
							
						</c:when>
						
							<%-- 로그인 상태가아닐때 클릭안되게 --%>
							<c:otherwise>
								<a href="javascript:" class="heart-notlogin">
										<button type="button" name="likeButton"><i class="fas fa-heart fa-heart03"></i></button>
									</a>
					
							</c:otherwise>
						</c:choose>
						
						<%-- 하트 작업 끝 --%>
							
								<%-- <span class="likecnt${en.gb_postnb}">좋아요 ${en.gb_likecnt}개</span> --%>
								<%--<button type="button" name="likeButton"><i class="fas fa-heart fa-heart01"></i></button> --%>
								<button type="button" name="comment-button" class="image01"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="nr_cont?gb_postnb=${en.gb_postnb}&state=content">
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
								</div></a>
						</div>
					</li>
					</c:if>
					</c:forEach>
				</ul>
			</div>
				
	
		</div>
	</div>
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>