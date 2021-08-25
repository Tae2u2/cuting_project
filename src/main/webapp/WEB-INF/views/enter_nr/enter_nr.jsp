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
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="./resources/css/enter_nr.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="./resources/js/enter_photo.js"></script>
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
		
		<a href="#"><button type="button" onclick="location='uploadForm';" class="add_photo"><i class="fas fa-plus"></i></button></a>

		<div class="tab-content">
		
		<!-- 강아지 탭메뉴공간입니다. ul 줄이라 생각하면되고 li는 한 줄안에 3개씩들어가는 구성품입니다. -->
			<div class="tab-pane fade show active" id="dog">
				<ul>
					<!-- 1번째사진 -->
					<li>
						<div class="aa">
							<img src="./resources/images/photo_dog01.png" alt="dog01 Image" class="image image01">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart01"></i></button>
								<button type="button" name="comment-button" class="image01"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="./dogphoto01_bet.jsp">
								<!-- <button type="button" name="enter_betting" class="enter_bt">배팅</button> -->
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기" onclick="location='dogphoto01_bet';"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>

					<!-- 2번째사진 -->
					<li>
						<div class="aa">
							<img src="./resources/images/photo_dog02.png" alt="dog02 Image" class="image image02">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart02"></i></button>
								<button type="button" name="comment-button" class="image02"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#dogphoto02_bet">
								<div class="pad">
									<button type="button" name="enter_betting"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>
					
					<!-- 3번째사진 -->
					<li>
						<div class="aa">
							<img src="./resources/images/photo_dog03.png" alt="dog03 Image" class="image image03">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart03"></i></button>
								<button type="button" name="comment-button" class="image03"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#dogphoto03_bet">
								<div class="pad">
									<button type="button" name="enter_betting"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>
				</ul>

				<ul>
					<!-- 4번째사진 -->
					<li>
						<div class="aa">
							<img src="./resources/images/photo_dog04.jpg" alt="dog04 Image" class="image image04">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart04"></i></button>							
								<button type="button" name="comment-button" class="image04"><i class="fas fa-comment fa-flip-horizontal"></i></button>							
								<a href="#dogphoto04_bet">
								<div class="pad">
									<button type="button" name="enter_betting"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>

					<!-- 5번째사진 -->
					<li>
						<div class="aa">
							<img src="./resources/images/photo_dog05.JPG" alt="dog05 Image" class="image image05">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart05"></i></button>
								<button type="button" name="comment-button" class="image05"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#dogphoto05_bet">
								<div class="pad">
									<button type="button" name="enter_betting"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>

					<!-- 6번째사진 -->
					<li>
						<div class="aa">
							<img src="./resources/images/photo_dog06.JPG" alt="dog06 Image" class="image image06">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart06"></i></button>
								<button type="button" name="comment-button" class="image06"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#dogphoto06_bet">
								<div class="pad">
									<button type="button" name="enter_betting"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>
				</ul>
			
				<ul>
					<!-- 7번째사진 -->
					<li>
						<div class="aa">
							<img src="./resources/images/photo_dog07.png" alt="dog07 Image" class="image image07">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart07"></i></button>
								<button type="button" name="comment-button" class="image07"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#dogphoto07_bet">
								<div class="pad">
									<button type="button" name="enter_betting"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>

					<!-- 8번째사진 -->
					<li>
						<div class="aa">
							<img src="./resources/images/woong11.jpg" alt="dog08 Image" class="image image08">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart08"></i></button>
								<button type="button" name="comment-button" class="image08"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#dogphoto08_bet">
								<div class="pad">
									<button type="button" name="enter_betting"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>

					<!-- 9번째사진 -->
					<li>
						<div class="aa">
							<img src="./resources/images/woong36.jpg" alt="dog09 Image" class="image image09">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart09"></i></button>
								<button type="button" name="comment-button" class="image09"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#dogphoto09_bet">
								<div class="pad">
									<button type="button" name="enter_betting"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>

				</ul>
			</div>

		<!-- 고양이 탭메뉴공간입니다. ul 줄이라 생각하면되고 li는 한 줄안에 3개씩들어가는 구성품입니다. -->
			<div class="tab-pane fade" id="cat">
				<ul>
					<!-- 1번째사진 -->
					<li>
						<div class="aa">
							<img src="images/photo_cat001.jpg" alt="cat001 Image" class="image image001">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart001"></i></button>
								<button type="button" name="comment-button" class="image001"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#catphoto001_bet">
								<!-- <button type="button" name="enter_betting" class="enter_bt">배팅</button> -->
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>

					<!-- 2번째사진 -->
					<li>
						<div class="aa">
							<img src="images/photo_cat002.jpg" alt="cat002 Image" class="image image002">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart002"></i></button>
								<button type="button" name="comment-button" class="image002"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#catphoto002_bet">
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>

					<!-- 3번째사진 -->
					<li>
						<div class="aa">
							<img src="images/photo_cat003.jpg" alt="cat002 Image" class="image image003">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart003"></i></button>
								<button type="button" name="comment-button" class="image003"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#catphoto003_bet">
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>
				</ul>

				<ul>
					<!-- 4번째사진 -->
					<li>
						<div class="aa">
							<img src="images/photo_cat004.jpg" alt="cat004 Image" class="image image004">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart004"></i></button>
								<button type="button" name="comment-button" class="image004"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#catphoto004_bet">
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>

					<!-- 5번째사진 -->
					<li>
						<div class="aa">
							<img src="images/photo_cat005.png" alt="cat005 Image" class="image image005">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart005"></i></button>
								<button type="button" name="comment-button" class="image005"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#catphoto005_bet">
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>

					<!-- 6번째사진 -->
					<li>
						<div class="aa">
							<img src="images/photo_cat006.png" alt="cat006 Image" class="image image006">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart006"></i></button>
								<button type="button" name="comment-button" class="image006"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#catphoto006_bet">
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>
				</ul>

				<ul>
					<!-- 7번째사진 -->
					<li>
						<div class="aa">
							<img src="images/photo_cat007.jpg" alt="cat007 Image" class="image image007">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart007"></i></button>
								<button type="button" name="comment-button" class="image007"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#catphoto007_bet">
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>

					<!-- 8번째사진 -->
					<li>
						<div class="aa">
							<img src="images/photo_cat008.jpg" alt="cat008 Image" class="image image008">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart008"></i></button>
								<button type="button" name="comment-button" class="image008"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#catphoto008_bet">
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>

					<!-- 9번째사진 -->
					<li>
						<div class="aa">
							<img src="images/photo_cat009.png" alt="cat009 Image" class="image image009">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart009"></i></button>
								<button type="button" name="comment-button" class="image009"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#catphoto009_bet">
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>
				</ul>
				
			</div>

		<!-- 다른 동물 친구들 탭메뉴공간입니다. ul 줄이라 생각하면되고 li는 한 줄안에 3개씩들어가는 구성품입니다. -->	
			<div class="tab-pane fade" id="friends">
				<ul>
					<!-- 1번째사진 -->
					<li>
						<div class="aa">
							<img src="images/photo_friend0001.jpg" alt="friends0001 Image" class="image image0001">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart0001"></i></button>
								<button type="button" name="comment-button" class="image0001"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#friendsphoto0001_bet">
								<!-- <button type="button" name="enter_betting" class="enter_bt">배팅</button> -->
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>

					<!-- 2번째사진 -->
					<li>
						<div class="aa">
							<img src="images/photo_friend0002.jpg" alt="friends0002 Image" class="image image0002">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart0002"></i></button>
								<button type="button" name="comment-button" class="image0002"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#friendsphoto0002_bet">
								<!-- <button type="button" name="enter_betting" class="enter_bt">배팅</button> -->
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>

					<!-- 3번째사진 -->
					<li>
						<div class="aa">
							<img src="images/photo_friend0003.jpg" alt="friends0003 Image" class="image image0003">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart0003"></i></button>
								<button type="button" name="comment-button" class="image0003"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#friendsphoto0003_bet">
								<!-- <button type="button" name="enter_betting" class="enter_bt">배팅</button> -->
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>
				</ul>
				
				<ul>
					<!-- 4번째사진 -->
					<li>
						<div class="aa">
							<img src="images/photo_friend0004.jpg" alt="friends0004 Image" class="image image0004">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart0004"></i></button>
								<button type="button" name="comment-button" class="image0004"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#friendsphoto0004_bet">
								<!-- <button type="button" name="enter_betting" class="enter_bt">배팅</button> -->
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>

					<!-- 5번째사진 -->
					<li>
						<div class="aa">
							<img src="images/photo_friend0005.jpg" alt="friends0005 Image" class="image image0005">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart0005"></i></button>
								<button type="button" name="comment-button" class="image0005"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#friendsphoto0005_bet">
								<!-- <button type="button" name="enter_betting" class="enter_bt">배팅</button> -->
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>

					<!-- 6번째사진 -->
					<li>
						<div class="aa">
							<img src="images/photo_friend0006.JPG" alt="friends0006 Image" class="image image0006">

							<div class="bb">
								<button type="button" name="likeButton"><i class="fas fa-heart fa-heart0006"></i></button>
								<button type="button" name="comment-button" class="image0006"><i class="fas fa-comment fa-flip-horizontal"></i></button>
								<a href="#friendsphoto0006_bet">
								<!-- <button type="button" name="enter_betting" class="enter_bt">배팅</button> -->
								<div class="pad">
									<button type="button" name="enter_betting" value="배팅하러가기"><i class="fab fa-bitcoin"></i></button>
								</div>		
								</a>					
							</div>
						</div>
					</li>
				</ul>
			</div>
			
			<!-- 강아지 포토1번 -->
			<div class="pr_enter_photo enter_photo01">

				<img src="./images/photo_dog01.png" alt="dog01 Image">
				<div class="pr_enph enph01">

					<div class="pr_en1-1 enph01-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Bulgogy(작성자닉네임이 들어갈자리)</span>
					</div>
					<div class="pr_en1-2 enph01-02">
						<ul class="pr_en1-ul1 enph01_ul01">
							<div class="pr_en1-com1 enph01_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph01_ul02">
								<div class="pr_en1-com2 enph01_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph01_ul02">
								<div class="pr_en1-com2 enph01_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph01_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart01"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" class="comment comment01" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 강아지 포토2번-->
			<div class="pr_enter_photo enter_photo02">

				<img src="./images/photo_dog02.png" alt="dog02 Image">
				<div class="pr_enph enph02">

					<div class="pr_en1-1 enph02-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Taccoyakky</span>
					</div>
					<div class="pr_en1-2 enph02-02">
						<ul class="pr_en1-ul1 enph02_ul01">
							<div class="pr_en1-com1 enph02_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph02_ul02">
								<div class="pr_en1-com2 enph02_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph02_ul02">
								<div class="pr_en1-com2 enph02_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph02_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart02"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
										<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 강아지 포토3번-->
			<div class="pr_enter_photo enter_photo03">

				<img src="./images/photo_dog03.png" alt="dog03 Image">
				<div class="pr_enph enph03">

					<div class="pr_en1-1 enph03-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Ice-ggunManDo</span>
					</div>
					<div class="pr_en1-2 enph03-02">
						<ul class="pr_en1-ul1 enph03_ul01">
							<div class="pr_en1-com1 enph03_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph03_ul02">
								<div class="pr_en1-com2 enph03_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph03_ul02">
								<div class="pr_en1-com2 enph03_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph03_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart03"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 강아지 포토4번-->
			<div class="pr_enter_photo enter_photo04">

				<img src="./images/photo_dog04.jpg" alt="dog04 Image">
				<div class="pr_enph enph04">

					<div class="pr_en1-1 enph04-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Marushaw</span>
					</div>
					<div class="pr_en1-2 enph04-02">
						<ul class="pr_en1-ul1 enph04_ul01">
							<div class="pr_en1-com1 enph04_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph04_ul02">
								<div class="pr_en1-com2 enph04_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph04_ul02">
								<div class="pr_en1-com2 enph04_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph04_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart04"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 강아지 포토5번-->
			<div class="pr_enter_photo enter_photo05">

				<img src="./images/photo_dog05.JPG" alt="dog05 Image">
				<div class="pr_enph enph05">

					<div class="pr_en1-1 enph05-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Ssanta:D</span>
					</div>
					<div class="pr_en1-2 enph05-02">
						<ul class="pr_en1-ul1 enph05_ul01">
							<div class="pr_en1-com1 enph05_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph05_ul02">
								<div class="pr_en1-com2 enph05_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph05_ul02">
								<div class="pr_en1-com2 enph05_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph05_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart05"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button> 
							</span> <span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 강아지 포토6번-->
			<div class="pr_enter_photo enter_photo06">

				<img src="./images/photo_dog06.JPG" alt="dog06 Image">
				<div class="pr_enph enph06">

					<div class="pr_en1-1 enph06-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Ganghyeonguk</span>
					</div>
					<div class="pr_en1-2 enph06-02">
						<ul class="pr_en1-ul1 enph06_ul01">
							<div class="pr_en1-com1 enph06_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph06_ul02">
								<div class="pr_en1-com2 enph06_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph06_ul02">
								<div class="pr_en1-com2 enph06_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph06_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart06"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button> 
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 강아지 포토7번-->
			<div class="pr_enter_photo enter_photo07">

				<img src="./images/photo_dog07.png" alt="dog07 Image">
				<div class="pr_enph enph07">

					<div class="pr_en1-1 enph07-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Elon Musk</span>
					</div>
					<div class="pr_en1-2 enph07-02">
						<ul class="pr_en1-ul1 enph07_ul01">
							<div class="pr_en1-com1 enph07_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph07_ul02">
								<div class="pr_en1-com2 enph07_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph07_ul02">
								<div class="pr_en1-com2 enph07_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph07_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart07"></i>
								</button>
							</span> 
							<span class="iconbox">
								 <button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 강아지 포토8번-->
			<div class="pr_enter_photo enter_photo08">

				<img src="./images/woong11.jpg" alt="dog08 Image">
				<div class="pr_enph enph08">

					<div class="pr_en1-1 enph08-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>GangTae2</span>
					</div>
					<div class="pr_en1-2 enph08-02">
						<ul class="pr_en1-ul1 enph08_ul01">
							<div class="pr_en1-com1 enph08_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph08_ul02">
								<div class="pr_en1-com2 enph08_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph08_ul02">
								<div class="pr_en1-com2 enph08_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph08_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart08"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 강아지 포토9번-->
			<div class="pr_enter_photo enter_photo09">

				<img src="./images/woong36.jpg" alt="dog09 Image">
				<div class="pr_enph enph09">

					<div class="pr_en1-1 enph09-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>GangTae2</span>
					</div>
					<div class="pr_en1-2 enph09-02">
						<ul class="pr_en1-ul1 enph09_ul01">
							<div class="pr_en1-com1 enph09_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph09_ul02">
								<div class="pr_en1-com2 enph09_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph09_ul02">
								<div class="pr_en1-com2 enph09_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph09_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart09"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>


			<!-- 고양이 포토1번 -->
			<div class="pr_enter_photo enter_photo001">

				<img src="./images/photo_cat001.jpg" alt="cat001 Image">
				<div class="pr_enph enph001">

					<div class="pr_en1-1 enph001-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>NangMan-GGoyang2</span>
					</div>
					<div class="pr_en1-2 enph001-02">
						<ul class="pr_en1-ul1 enph001_ul01">
							<div class="pr_en1-com1 enph001_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph001_ul02">
								<div class="pr_en1-com2 enph001_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph001_ul02">
								<div class="pr_en1-com2 enph001_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph001_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart001"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 고양이 포토2번-->
			<div class="pr_enter_photo enter_photo002">

				<img src="./images/photo_cat002.jpg" alt="cat002 Image">
				<div class="pr_enph enph002">

					<div class="pr_en1-1 enph002-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Chloe</span>
					</div>
					<div class="pr_en1-2 enph002-02">
						<ul class="pr_en1-ul1 enph002_ul01">
							<div class="pr_en1-com1 enph002_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph002_ul02">
								<div class="pr_en1-com2 enph002_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph002_ul02">
								<div class="pr_en1-com2 enph002_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph002_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart002"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 고양이 포토3번-->
			<div class="pr_enter_photo enter_photo003">

				<img src="./images/photo_cat003.jpg" alt="cat003 Image">
				<div class="pr_enph enph003">

					<div class="pr_en1-1 enph003-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>LeeSSu</span>
					</div>
					<div class="pr_en1-2 enph003-02">
						<ul class="pr_en1-ul1 enph003_ul01">
							<div class="pr_en1-com1 enph003_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph003_ul02">
								<div class="pr_en1-com2 enph003_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph003_ul02">
								<div class="pr_en1-com2 enph003_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph003_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart003"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 고양이 포토4번-->
			<div class="pr_enter_photo enter_photo004">

				<img src="./images/photo_cat004.jpg" alt="cat004 Image">
				<div class="pr_enph enph004">

					<div class="pr_en1-1 enph004-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Cellas</span>
					</div>
					<div class="pr_en1-2 enph004-02">
						<ul class="pr_en1-ul1 enph004_ul01">
							<div class="pr_en1-com1 enph004_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph004_ul02">
								<div class="pr_en1-com2 enph004_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph004_ul02">
								<div class="pr_en1-com2 enph004_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph004_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart004"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 고양이 포토5번-->
			<div class="pr_enter_photo enter_photo005">

				<img src="./images/photo_cat005.png" alt="cat005 Image">
				<div class="pr_enph enph005">

					<div class="pr_en1-1 enph005-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Steeve</span>
					</div>
					<div class="pr_en1-2 enph005-02">
						<ul class="pr_en1-ul1 enph005_ul01">
							<div class="pr_en1-com1 enph005_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph005_ul02">
								<div class="pr_en1-com2 enph005_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph005_ul02">
								<div class="pr_en1-com2 enph005_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph005_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart005"></i>
								</button>
							</span> 
							<span class="iconbox">
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 고양이 포토6번-->
			<div class="pr_enter_photo enter_photo006">

				<img src="./images/photo_cat006.png" alt="cat006 Image">
				<div class="pr_enph enph006">

					<div class="pr_en1-1 enph006-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Akaps</span>
					</div>
					<div class="pr_en1-2 enph006-02">
						<ul class="pr_en1-ul1 enph006_ul01">
							<div class="pr_en1-com1 enph006_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph006_ul02">
								<div class="pr_en1-com2 enph006_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph006_ul02">
								<div class="pr_en1-com2 enph006_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph006_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart006"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 고양이 포토7번-->
			<div class="pr_enter_photo enter_photo007">

				<img src="./images/photo_cat007.jpg" alt="cat007 Image">
				<div class="pr_enph enph007">

					<div class="pr_en1-1 enph007-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Vela</span>
					</div>
					<div class="pr_en1-2 enph007-02">
						<ul class="pr_en1-ul1 enph007_ul01">
							<div class="pr_en1-com1 enph007_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph007_ul02">
								<div class="pr_en1-com2 enph007_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph007_ul02">
								<div class="pr_en1-com2 enph007_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph007_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart007"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 고양이 포토8번-->
			<div class="pr_enter_photo enter_photo008">

				<img src="./images/photo_cat008.jpg" alt="cat008 Image">
				<div class="pr_enph enph008">

					<div class="pr_en1-1 enph008-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Aroma</span>
					</div>
					<div class="pr_en1-2 enph008-02">
						<ul class="pr_en1-ul1 enph008_ul01">
							<div class="pr_en1-com1 enph008_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph008_ul02">
								<div class="pr_en1-com2 enph008_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph008_ul02">
								<div class="pr_en1-com2 enph008_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph008_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart008"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span>
							 <span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 고양이 포토9번-->
			<div class="pr_enter_photo enter_photo009">

				<img src="./images/photo_cat009.png" alt="cat009 Image">
				<div class="pr_enph enph009">

					<div class="pr_en1-1 enph009-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Aroma</span>
					</div>
					<div class="pr_en1-2 enph009-02">
						<ul class="pr_en1-ul1 enph009_ul01">
							<div class="pr_en1-com1 enph009_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph009_ul02">
								<div class="pr_en1-com2 enph009_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph009_ul02">
								<div class="pr_en1-com2 enph009_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph009_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart009"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button> 
							</span>
							 <span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>


			<!-- 친구들 포토1번 -->
			<div class="pr_enter_photo enter_photo0001">

				<img src="./images/photo_friend0001.jpg" alt="friends0001 Image">
				<div class="pr_enph enph0001">

					<div class="pr_en1-1 enph0001-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Aroma</span>
					</div>
					<div class="pr_en1-2 enph0001-02">
						<ul class="pr_en1-ul1 enph0001_ul01">
							<div class="pr_en1-com1 enph0001_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph0001_ul02">
								<div class="pr_en1-com2 enph0001_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph0001_ul02">
								<div class="pr_en1-com2 enph0001_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph0001_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart0001"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 친구들 포토2번 -->
			<div class="pr_enter_photo enter_photo0002">

				<img src="./images/photo_friend0002.jpg" alt="friends0002 Image">
				<div class="pr_enph enph0002">

					<div class="pr_en1-1 enph0002-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Im._.Rabbit</span>
					</div>
					<div class="pr_en1-2 enph0002-02">
						<ul class="pr_en1-ul1 enph0002_ul01">
							<div class="pr_en1-com1 enph0002_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph0002_ul02">
								<div class="pr_en1-com2 enph0002_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph0002_ul02">
								<div class="pr_en1-com2 enph0002_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph0002_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart0002"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 친구들 포토3번 -->
			<div class="pr_enter_photo enter_photo0003">

				<img src="./images/photo_friend0003.jpg" alt="friends0003 Image">
				<div class="pr_enph enph0003">

					<div class="pr_en1-1 enph0003-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Aroma</span>
					</div>
					<div class="pr_en1-2 enph0003-02">
						<ul class="pr_en1-ul1 enph0003_ul01">
							<div class="pr_en1-com1 enph0003_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph0003_ul02">
								<div class="pr_en1-com2 enph0003_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph0003_ul02">
								<div class="pr_en1-com2 enph0003_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph0003_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart0003"></i>
								</button>
							</span> 
							<span class="iconbox">
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 친구들 포토4번 -->
			<div class="pr_enter_photo enter_photo0004">

				<img src="./images/photo_friend0004.jpg" alt="friends0004 Image">
				<div class="pr_enph enph0004">

					<div class="pr_en1-1 enph0004-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Aroma</span>
					</div>
					<div class="pr_en1-2 enph0004-02">
						<ul class="pr_en1-ul1 enph0004_ul01">
							<div class="pr_en1-com1 enph0004_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph0004_ul02">
								<div class="pr_en1-com2 enph0004_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph0004_ul02">
								<div class="pr_en1-com2 enph0004_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph0004_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart0004"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 친구들 포토5번 -->
			<div class="pr_enter_photo enter_photo0005">

				<img src="./images/photo_friend0005.jpg" alt="friends0005 Image">
				<div class="pr_enph enph0005">

					<div class="pr_en1-1 enph0005-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Aroma</span>
					</div>
					<div class="pr_en1-2 enph0005-02">
						<ul class="pr_en1-ul1 enph0005_ul01">
							<div class="pr_en1-com1 enph0005_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph0005_ul02">
								<div class="pr_en1-com2 enph0005_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph0005_ul02">
								<div class="pr_en1-com2 enph0005_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph0005_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart0005"></i>
								</button>
							</span> 
							<span class="iconbox"> 
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 친구들 포토6번 -->
			<div class="pr_enter_photo enter_photo0006">

				<img src="./images/photo_friend0006.JPG" alt="friends0006 Image">
				<div class="pr_enph enph0006">

					<div class="pr_en1-1 enph0006-01">
						<button type="button" value="window_close" class="closeBt" onclick="clearInput()">
							<i class="fas fa-times"></i>
						</button>
						<i class="fas fa-crown"></i><span>Aroma</span>
					</div>
					<div class="pr_en1-2 enph0006-02">
						<ul class="pr_en1-ul1 enph0006_ul01">
							<div class="pr_en1-com1 enph0006_com01">글쓴이 내용1</div>
							<ul class="pr_en1-ul2 enph0006_ul02">
								<div class="pr_en1-com2 enph0006_com2">답글 1</div>
							</ul>
							<ul class="pr_en1-ul2 enph0006_ul02">
								<div class="pr_en1-com2 enph0006_com2">답글 2</div>
							</ul>
						</ul>

						<div class="pr_eniconbox enph0006_iconbox">
							<span class="iconbox">
								<button type="button" name="likeButton">
									<i class="fas fa-heart fa-heart0006"></i>
								</button>
							</span> 
							<span class="iconbox">
								<button type="button" name="comment-button" onclick="focusEvent()">
									<i class="fas fa-comment fa-flip-horizontal"></i>
								</button> </a>
							</span> 
							<span class="likecnt">좋아요 ${likeButton}개</span>
						</div>

						<div class="textbox">
							<form class="textform" method="post" action="#">
								<i class="far fa-keyboard"></i>
								<textarea placeholder="댓글 달기..." class="tx"
									style="height: 22px !important;"></textarea>
								<button type="submit" value="게시">게시</button>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	
</body>
<%@ include file="bottom_qt.jsp"%>