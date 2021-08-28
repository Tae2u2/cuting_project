<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../qt_project/header.jsp" %>
<script src="../resources/js/jquery.js"></script>
<link rel="stylesheet" href="../resources/css/QnA_qt_style.css">
<meta charset="UTF-8">
<title>큐팅::묻고답하기</title>
</head>
<body>
	<h1><a href="QnA_qt">Q&A</a> | <a href="QnA_qt">신고하기</a></h1>
	
	<table class="qt-table" border="1">
  <tr>
   <th colspan="3">내용보기</th>
  </tr>
  <tr>
   <th colspan="0.2">제목</th> <td colspan="1.8">${qna.qa_title}</td> <td>조회수 | ${qna.qa_viewcnt}</td>
  </tr> 
  <th colspan="3">${qna.qa_content}</th> 
  <tr>
   <th colspan="3">
    <input type="button" value="수정" class="BtnforCss" onclick="location='/cuting/QnA/qna_edit?qa_postnb=${qna.qa_postnb}&page=${page}';" />
    <input type="button" value="삭제" class="BtnforCss" onclick="location='/cuting/QnA/qna_del?qa_postnb=${qna.qa_postnb}&page=${page}';" />
    <input type="button" value="목록" class="BtnforCss" onclick="location='/cuting/QnA/QnA_qt?page=${page}';" />
   </th>
  </tr>
 </table>
 
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>