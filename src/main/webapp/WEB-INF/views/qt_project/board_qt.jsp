<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/board_qt_style.css">
<title>큐팅::공지사항</title>
</head>
<body>
	<h1>공지사항</h1>
	<table class="qt-table">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>큐팅운영정책(ver 1.0.0.1)</td>
				<td>운영자</td>
				<td>0</td>
			</tr>
			<tr>
				<td>2</td>
				<td>딜러수칙 위반 처벌사항</td>
				<td>감시자</td>
				<td>0</td>
			</tr>
			<tr>
				<td>3</td>
				<td>사진 업로드 관련 준수사항</td>
				<td>운영자</td>
				<td>0</td>
			</tr>
		</tbody>
		<tr>
			<th colspan="5">
				<%-- 쪽번호 출력 --%>
			</th>
		</tr>
		<tr>
			<th colspan="5"><input type="button" value="글쓰기" onclick="" /></th>
		</tr>
	</table>
</body>
<%@ include file="bottom_qt.jsp"%>