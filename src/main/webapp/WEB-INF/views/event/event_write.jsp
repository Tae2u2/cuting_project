
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../qt_project/header.jsp"%>

<meta charset="UTF-8">
<title></title>
<script src="${path}/resources/js/jquery.js"></script>
<script src="../resources/js/event.js"></script>
 <link rel="stylesheet" href="${path}/resources/css/event_qt.css">
 
</head>
<body>
<div id="event_div">
<h2>이벤트 글쓰기</h2>
<form method="post" action="event_write_ok" onsubmit="return w_check();"  enctype="multipart/form-data">
제목:<input name="ev_title" id="ev_title" size="14"/><p>
내용:<textarea name="ev_content" id="ev_content" rows="8" cols="36"></textarea><p>
게시날짜:<input type="text" name="ev_update" id="ev_update"  size="14"/>
만료날짜:<input type="text" name="ev_exdate" id="ev_exdate"  size="14"/>
파일첨부:<input type="file" name="ev_filename" id="ev_filename"/>
<input type="submit" value="저장">
<input type="reset" value="취소" onclick="$('#ev_title').focus();"/>
<input type="button" value="목록" onclick="location='/event_qt?page=${page}';"/>
</form>
</div>
</body>

<%@ include file="../qt_project/bottom_qt.jsp"%>