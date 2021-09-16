<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<meta charset="UTF-8">
<%@ include file="header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/checklist_style.css">
<title>큐팅::찜목록</title>
</head>
<body>
	<h1>찜목록</h1>

	<ul class="likelist_qt-wrapper">
		<div class="countbox">
			<span> 귀여움 지수 : ${map.count}</span>
		</div>
		<div class="likediv">
			<c:forEach var="cl" items="${map.list}">
				<li class="likelist_qt-card"><img
					src="./resources/upload${cl.gb_filename}" alt="">
					<div class="likelist_qt-content">
						<div class="likelist_qt-row">
							<div class="likelist_qt-detail">
								<span>${cl.gb_title}</span><!-- 제목공간 -->							
								<p>${cl.cldate}</p><!-- 내가 게시물 찜목록한 날짜 -->							
							</div>
							<div class="likelist_qt-button">

								<a href="nr_cont?gb_postnb=${cl.gb_postnb}&state=content"><button>보러가기</button></a>
								<a href="${path}/delete.do?clno=${cl.clno}"><button onclick="alrim()" class="aa">찜해제하기</button></a>
										
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
		</div>
	</ul>

<script>
function alrim(){
	alert('삭제되었습니다.');
}
</script>

</body>
<%@ include file="bottom_qt.jsp"%>
