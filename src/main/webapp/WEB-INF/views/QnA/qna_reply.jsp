<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../qt_project/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/reply_style.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
	<div>
		<h1>댓글등록</h1>
		<form method="post" action="qna_reply_ok" ><!-- onsubmit="return bw_check();" -->
			<%--답변글 히든값 --%>
			<input type="hidden" name="qa_postnb" value="${qa_postnb}" />
			<input type="hidden" name="rp_id" value="${rp_id}"/>
			<%--원본글과 답변글을 묶어주는 그룹  번호값 --%>
		
			<table class="qt-table3" border="1">
				<tr>
				   <td><textarea name="rp_content" id="rp_content" placeholder="댓글을입력하세요" rows="4"cols="50"></textarea>
				   </td>
			    </tr>		
			</table>

			<div class="reply_button">
				<input type="submit" value="등록" class="BtnforCss"/> 
				<input type="reset"  value="취소" class="BtnforCss" onclick="$('#rp_content').focus();" /> 
				<input type="button" value="목록" class="BtnforCss" onclick="location='QnA_qt';" />
			</div>
		</form>
</div>
</body>
</html>
<%@ include file="../qt_project/bottom_qt.jsp"%>