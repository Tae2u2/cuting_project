<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../qt_project/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/reply_style.css">
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<div>
		<h1> 댓글수정</h1>
		<form method="post" action="reply_edit_ok" ><!-- onsubmit="return bw_check();" -->
			<%--답변글 히든값 --%>
			<input type="hidden" name="qa_postnb" value="${rp.qa_postnb}" />
			<input type="hidden" name="rp_postnb" value="${rp.rp_postnb}"/>
			
			<%--원본글과 답변글을 묶어주는 그룹  번호값 --%>
			<div>
		<p class="rp_image"><span class="rp_write">Comment</span><img src="${path}/resources/images/like.png" width="35" height="35">
		</p>
			<table class="qt-table3">
				<tr>
				   <td><textarea rows="5" cols="50" name="rp_content" id="rp_content" >${rp.rp_content}</textarea>
				   </td>
			    </tr>		
			</table>

			<div  class="reply_button">
				<input type="submit" value="수정" class="BtnforCss"/> 
				<input type="reset"  value="취소" class="BtnforCss" onclick="$('#rp_content').focus();" /> 
				<input type="button" value="뒤로" class="BtnforCss" onclick="location='qna_cont?qa_postnb=${rp.qa_postnb}';" />
			</div>
			</div>	
		</form>
	</div>
</body>
</html>
<%@ include file="../qt_project/bottom_qt.jsp"%>