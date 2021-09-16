<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String result =  request.getParameter("result");
	if(result!=null){
		session.setAttribute("header", result);
	}
%>
<a href="board_qt">공지사항<%=result %></a>
<a href="event_qt">이벤트</a>
<a href="QnA_qt">qna</a>

</body>
<script>
		if (self.name != 'reload') {
	         self.name = 'reload';
	         self.location.reload(true);
	     }
	     else self.name = '';
</script>
</html>