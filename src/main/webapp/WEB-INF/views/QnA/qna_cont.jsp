<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../qt_project/header.jsp" %>
<script src="../resources/js/jquery.js"></script>
<link rel="stylesheet" href="../resources/css/QnA_qt_style.css">
<meta charset="UTF-8">
<title>큐팅::묻고답하기</title>
</head>
<body>
	<h1><a href="#">Q&A</a> | <a href="#">신고하기</a></h1>
	
	<table class="qt-table" border="1">
  <tr>
   <th colspan="2">내용보기</th>
  </tr>
  <tr>
   <th>제목</th> <td>${qna.qa_title}</td>
  </tr>
  <tr>
   <th>내용</th> <td>${qna.qa_content}</td>
  </tr>
  <tr>
   <th>조회수</th> <td>${qna.qa_viewcnt}</td>
  </tr>  
  <tr>
   <th colspan="2">
    <input type="button" value="수정" class="BtnforCss" onclick="location='/cuting/QnA/qna_edit?qa_postnb=${qna.qa_postnb}&page=${page}';" />
    <input type="button" value="삭제" class="BtnforCss" onclick="location='/cuting/QnA/qna_del?qa_postnb=${qna.qa_postnb}&page=${page}';" />
    <input type="button" value="목록" class="BtnforCss" onclick="location='/cuting/QnA/QnA_qt?page=${page}';" />
   </th>
  </tr>
 </table>
 
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>