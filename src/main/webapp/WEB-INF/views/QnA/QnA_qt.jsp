<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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

	<table class="qt-table">
		<tr>
			<th colspan="0.5">번호</th>
			<th>구분</th>
			<th colspan="2" >제목</th>
			<th>글쓴이</th>
			<th colspan="0.5">조회수</th>
			<th>게시날짜</th>
		</tr>

		<% if(header != null){ %>
		<tr>
			<c:if test="${!empty qnalist}">
				<c:forEach var="qna" items="${qnalist}">
					<tr>
						<th colspan="0.5">${qna.qa_postnb}</th>
						<th>
						<c:if test="${qna.qa_category eq '88'}">[Q&A]</c:if>
						<c:if test="${qna.qa_category eq '99'}">[신고합니다]</c:if>
						</th>
						<th colspan="2"><a href="/controller/qna_cont?qa_postnb=${qna.qa_postnb}">${qna.qa_title}</a>&nbsp;&nbsp;</th>
						<th><%=header %></th>
						<th colspan="0.5">${qna.qa_viewcnt}</th>
						<th>${qna.qa_upload}</th>
					</tr>
				</c:forEach>
			</c:if>
		</tr>

		<c:if test="${empty qnalist}">
			<tr>
				<th colspan="7">게시물이 없습니다!</th>
			</tr>
		</c:if>

		<tr>
			<th colspan="7"><input id="writeBtn" type="button" value="글쓰기"
				onclick="location='QnA_write';" /></th>
		</tr>
		<%} %>

	</table>
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>