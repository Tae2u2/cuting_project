<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../qt_project/header.jsp"%>
<script src="${path}/resources/js/jquery.js"></script>
<link rel="stylesheet" href="${path}/resources/css/QnA_qt_style.css">
<meta charset="UTF-8">
<title>큐팅::묻고답하기</title>
</head>
<body>
	<h1>
		<a href="QnA_qt">Q&A</a> | <a href="QnA_qt">신고하기</a>
	</h1>
	<div class="qt-write-form">
		<form method="post" action="QnA_write_ok">
			 <h3>작성자 : <%=header %></h3><br>
			 <p>
				<select name="chooseQorD" id="QorD-select">
					<option value="">--선택하세요--</option>
					<option value="Q&A">Q&A</option>
					<option value="declare">신고합니다</option>
				</select>
				<label for="qna-title">제목 : </label><input required type="text" name="qna-title" id="qna-title"/>
			<label for="qna-pass">비밀번호 : </label><input required maxlength="4" type="password" name="qna-pass"
					id="qna-pass" size="9" placeholder="●●●●" />
			<p>
			
		
			 <!--<label for="qna-writer">글쓴이:</label><input required type="text" name="qna-writer" id="qna-writer"/>-->
			<p>
				<label for="qna-content"></label>
				<textarea name="qna-content" id="qna-content" ></textarea>
			<p>
				<input type="submit" value="저장" id="submitBtn" class="BtnforCss"/>
				<input type="reset" value="취소" id="resetBtn" class="BtnforCss"/>
				<input type="button" value="목록" id="listBtn" class="BtnforCss"
					onclick="location='QnA_qt';" />
		</form>
	</div>
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>