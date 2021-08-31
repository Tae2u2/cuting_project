<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../qt_project/header.jsp"%>
<script src="../resources/js/jquery.js"></script>

<link rel="stylesheet" href="${path}/resources/css/QnA_qt_style.css">
<meta charset="UTF-8">
<title>큐팅::묻고답하기</title>
</head>
<body>
	<h1>
		<a href="QnA_qt">Q&A</a> | <a href="QnA_qt">신고하기</a>
	</h1>
	
	<div class="qt-write-form">
		<form method="post" action="qna_edit_ok">
			<input type="hidden" name="bno" value="${eqna.qa_postnb}" />
			<input type="hidden" name="page" value="${page}" />
			<p>
			<label for="qq_title">제목 : </label><input required type="text" name="qa_title" id="qa_title" value="${eqna.qa_title}"/>
			<p>
				<label for="qa_content"></label>
				<textarea name="qa_content" id="qa_content">${eqna.qa_content}</textarea>
				
				<input type="submit" value="수정" class="BtnforCss" /> 
				<input type="reset" value="취소" class="BtnforCss"/>
				<input type="button" value="목록" class="BtnforCss" onclick="location='QnA_qt';" />

		</form>
	</div>
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>