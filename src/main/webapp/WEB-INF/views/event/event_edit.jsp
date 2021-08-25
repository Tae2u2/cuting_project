<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div id="event_div">
  <form method="post" action="event_edit_ok" onsubmit="return w_check();">
  <input type="hidden" name="ev_postnb" value="${eb.ev_postnb}" /><%-- 히든은 브라우저 창에서 만들어 지지 않는다.하지만 피라미터 이름에 value속성값을 담아서 서버로 전달
  할때 유용하게 사용된다. 주의할 것은 브라우저 출력창에서 페이지 소스보기에서는 보인다.그러므로 보안상 중요한 내용을 전달할 때는 사용하면 안된다. --%>
  <input type="hidden" name="page" value="${page}" />
   제목:<input type="text" name="ev_title" id="ev_title" size="36" value="${eb.ev_title}" /><p>
   내용:<textarea rows="10" cols="36" name="ev_content" id="ev_content" >${eb.ev_content}</textarea><p>
  게시날짜:<input type="date" name="ev_update" id="ev_update" value="${eb.ev_update}" />
만료날짜:<input type="date" name="ev_exdate" id="end_exdate" value="${eb.ev_exdate}"/>
파일첨부:<input type="file" name="ev_filename" id="ev_filename"/><br/>"${eb.ev_filename}" 
   <input type="submit" value="수정" />
   <input type="reset" value="취소" onclick="$('#ev_title').focus();" />
   <input type="button" value="목록" onclick="location='/controller/event/event_qt?page=${page}';" />
   </form>
   </div>
</body>
</html>