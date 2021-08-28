<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../qt_project/header.jsp"%>

<meta charset="UTF-8">
<title></title>
<script src="../resources/js/jquery.js"></script>
<script src="../resources/js/event.js"></script>
<link rel="stylesheet" href="./css/event_qt.css">

</head>
<body>
<div id="event_div">
<h2>이벤트 글쓰기</h2>
<form method="post" action="event_write_ok" onsubmit="return w_check();"  enctype="multipart/form-data">
제목:<input type="text" name="ev_title" id="ev_title" size="14"/><p>
내용:<input type="text" name="ev_content" id="ev_content" size="36"/><p>
게시날짜:<input type="date" name="ev_update" id="ev_update"/>
만료날짜:<input type="date" name="ev_exdate" id="ev_exdate"/>
파일첨부:<input type="file" name="ev_filename" id="ev_filename"/>
<input type="submit" value="저장">
<input type="reset" value="취소" onclick="$('#ev_title').focus();"/>
<input type="button" value="목록" onclick="location='cuting/event/event_qt?page=${page}';"/>
</form>
</div>
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>