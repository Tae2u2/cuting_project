<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<meta charset="UTF-8">
<title>큐팅메인페이지</title>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<script src="https://kit.fontawesome.com/a963872baf.js" crossorigin="anonymous"></script>

<% String result =  request.getParameter("result");
	if(result!=null){
		session.setAttribute("header", result);
	}
%>
</head>
<body>
<div class="startPage">
		<h1>"당신의 귀염둥이에게<br><span>베팅</span>하세요!"</h1>
			<p>100원으로 시작하는 합법 노름!<br>가진 게 돈 뿐인 랜선집사들 모여라!</p>
			<a href="">판벌리러가기<%=result %><script>document.write('${result}')</script></a>
			<br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>	
		<div class="homeImg">
			<img src="${path}/resources/images/bgbg.png" class="back-img">
			<img src="${path}/resources/images/homeimg.png" class="main-img">
		</div>
		<script>
		if (self.name != 'reload') {
	         self.name = 'reload';
	         self.location.reload(true);
	     }
	     else self.name = '';
</script>
</body>
<%@ include file="bottom_qt.jsp"%>
