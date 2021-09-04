<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../qt_project/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="../resources/js/jquery.js"></script>
<script src="../resources/js/event.js"></script>
 <link rel="stylesheet" href="./resources/css/event_qt.css">

</head>
<body>
<div id="event_div">
  <form method="post" action="event_edit_ok" onsubmit="return w_check();" enctype="multipart/form-data">
  <input type="hidden" name="ev_postnb" value="${e.ev_postnb}" /><%-- 히든은 브라우저 창에서 만들어 지지 않는다.하지만 피라미터 이름에 value속성값을 담아서 서버로 전달
  할때 유용하게 사용된다. 주의할 것은 브라우저 출력창에서 페이지 소스보기에서는 보인다.그러므로 보안상 중요한 내용을 전달할 때는 사용하면 안된다. --%>
  <input type="hidden" name="page" value="${page}" />
제목:<input name="ev_title" id="ev_title" size="14" /><p>
내용:<textarea name="ev_content" id="ev_content" rows="8" cols="36"  ></textarea><p>
게시날짜:<input type="text" name="ev_update" id="ev_update"  size="14"   />
만료날짜:<input type="text" name="ev_exdate" id="ev_exdate"  size="14"  />
파일첨부:<input type="file" name="ev_filename" id="ev_filename"   />
<input type="submit" value="저장">
<input type="reset" value="취소" onclick="$('#ev_title').focus();"/>
<input type="button" value="목록" onclick="location='event_qt?page=${page}';"/>
   </form>
   </div>
</body>
<%@ include file="../qt_project/bottom_qt.jsp"%>
</html>