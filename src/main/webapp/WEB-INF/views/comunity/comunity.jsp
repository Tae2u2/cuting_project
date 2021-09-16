<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../qt_project/header.jsp" %>
<meta charset="UTF-8">
<title>큐팅::함께소통하세요</title>
<link rel="stylesheet" href="${path}/resources/css/comunity_style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/emojionearea/3.4.2/emojionearea.min.css">
</head>
<body>
        <h1>COMUNITY</h1>
        <div class="forLine">
        <div class="postAside">
            <ul class="hashtagList">
                <li><a href="#">#자유게시판</a></li>
                <li><a href="#">#자랑자랑</a></li>
                <li><a href="#">#헬프미아임초보</a></li>
                <li><a href="#">#댕댕이#말랑콩떡</a></li>
                <li><a href="#">#집사#고영희</a></li>
            </ul>
        </div> 
	        <div class="postContainer">

<!--수정모달 -->
    <div id="editBox" style="display: none;">
        <div class="editTitle"></div>
        <div class="editPostBox">
        <textarea required id="pt_content" name="pt_content" rows="9"></textarea>
        </div>
        <div class="forbtnLine">
        <button type="button" id="ptEditBtn" class="forBtnCss">수정</button>
        <button type="button" id="ptDelBtn" class="forBtnCss">삭제</button>
        <button type="button" id="ptCloseBtn" class="forBtnCss" onclick="editBoxClose();">닫기</button>
        </div>
    </div>
 
<!--글쓰는 박스-->
<%if(header!=null){ %>
<form method="post" action="comunity_write"  enctype="multipart/form-data">
    <div class="postBox">
        <div class="postProfile">
            <input type="hidden" name="pt_id" id="pt_id" value="<%=header%>"/>
            <input type="hidden" name="pt_pw" id="pt_pw" value="<%=header%>"/>
            <input type="hidden" name="pt_title" id="pt_title" value="<%=header%>"/>
            <h4><i class="fas fa-paw"></i><%=header%>님! 큐팅에서 소통하세요!</h4>
        </div>
        <div class="postCategoryBox">
        <select name="pt_category" id="pt_category">
            <option value="77">자유게시판</option>
            <option value="66">자랑자랑</option>
            <option value="55">헬프미아임초보</option>
            <option value="44">댕댕이</option>
            <option value="33">고영희</option>
        </select>
        </div>
        <div class="postContentBox">
        <textarea required name="pt_content" id="pt_content" placeholder="당신의 귀여운 이야기를 나눠주세요!"></textarea>
        </div>
        <input type="file" id="pt_filename" name="pt_filename">
        <input type="submit" value="글쓰기" id="postAddBtn">
    </div>
    </form>
    <%} else{%>
        <div class="postBox">
        	<h4>큐팅의 가족이 되어 커뮤니티에 참여하세요!</h4>
        	<input type="button" id="goJoinBtn" value="회원가입하러가기" onclick="location='join'">
        </div>
        <%} %>
</div>
</div>

 <!--글목록-->
	<ul id="comunityZone">
		<c:if test="${!empty ptlist}">
			<c:forEach var="pt" items="${ptlist}">
				<li class="comunityList">
					<div class="comunityBox">
						<div class="userProfile">
							<p>
								<i class="fas fa-paw"></i>${pt.pt_id}<small>${pt.pt_update}</small>
							</p>
							<span> <c:if test="${pt.pt_category eq '77'}">#자유게시판</c:if>
								<c:if test="${pt.pt_category eq '66'}">#자랑자랑</c:if> <c:if
									test="${pt.pt_category eq '55'}">#헬프미아임초보</c:if> <c:if
									test="${pt.pt_category eq '44'}">#댕댕이</c:if> <c:if
									test="${pt.pt_category eq '33'}">#고영희</c:if>

							</span>
						</div>

						<hr>
						<p id="post-text">${pt.pt_content}</p>
						<c:if test="${not empty pt.pt_filename}">
						<div class="comunityImg">
						<img alt="imagePlease" src="${path}/resources/upload${pt.pt_filename}">
						</div>
						</c:if>
						<button id="postEditBtn" class="forBtnCss">수정</button>
					</div>
				</li>
			</c:forEach>
		</c:if>
	</ul>
</body>
<%@ include file="../qt_project/bottom_qt.jsp" %>