<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="./css/QnA_qt_style.css">
<meta charset="UTF-8">
<title>큐팅::묻고답하기</title>
</head>
<body>
	<h1><a href="">Q&A</a> | <a href="">신고하기</a></h1>
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
				<td>질문있습니다</td>
				<td>회원1</td>
				<td>0</td>
			</tr>
			<tr>
				<td>2</td>
				<td>질문있어요</td>
				<td>회원2</td>
				<td>0</td>
			</tr>
			<tr>
				<td>3</td>
				<td>질문3</td>
				<td>회원3</td>
				<td>0</td>
			</tr>
			
		</tbody>
		<tr>
   <th colspan="5">   
     <%-- 쪽번호 출력 --%>
     </th>
  </tr>  
  <tr>
   <th colspan="5" >
   <input type="button" value="글쓰기" onclick=""/></th>
  </tr>		
	</table>
</body>
<%@ include file="bottom_qt.jsp"%>