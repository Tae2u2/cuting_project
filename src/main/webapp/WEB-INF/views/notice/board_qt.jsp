<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 목록</title>
<!--  <link rel="stylesheet" type="text/css" href="./resources/css/bbs.css" />-->
</head>
<body>
<form method="get" action="board_qt">
 <div id="bList_wrap">
  <h2 class="bList_title">자료실 목록</h2>
  <div class="bList_count">글개수 : <strong>${totalCount} 개</strong></div>
  <table id="bList_t">
   <tr>
    <th width="6%" height="26">번호</th>
    <th width="50%">제목</th>
    <th width="14%">글쓴이</th>
    <th width="17%">작성일</th>
    <th width="14%">조회수</th>
   </tr>
  
 
   
   <%-- 검색 후 페이징  --%>
    <c:if test="${(!empty find_field) && (!empty find_name)}">
    <c:if test="${page <= 1}">
     [이전]&nbsp;
    </c:if>
    <c:if test="${page >1}">
     <a href="bbs_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
    </c:if>
    
    <%-- 쪽번호 출력부분 --%>
    <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
     <c:if test="${a==page}"><${a}></c:if>
     
     <c:if test="${a != page}">
      <a href="bbs_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
     </c:if>
    </c:forEach>
    
    <c:if test="${page >= maxpage}">[다음]</c:if>
    
    <c:if test="${page < maxpage}">
       <a href="bbs_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
    </c:if>
   </c:if>
  </div>
  
   <div id="bList_menu">
    <input type="button" value="글쓰기" onclick="location='bbs_write?page=${page}';" />
    <c:if test="${(!empty find_field) && (!empty find_name)}"><%-- 검색필드와 검색어가 있는 경우 즉 검색하고 난 이후 실행 --%>
     <input type="button" value="전체목록" onclick="location='bbs_list?page=${page}';" />     
    </c:if>
   </div>
   
   <%-- 검색 기능--%>
   <div id="bFind_wrap">
    <select name="find_field">
     <option value="bbs_title" <c:if test="${find_field == 'bbs_title'}"> ${'selected'}</c:if>>제목</option>
     <option value="bbs_cont" <c:if test="${find_field == 'bbs_cont'}"> ${'selected'}</c:if>>내용</option>
    </select>
    <input name="find_name" id="find_name" size="14" value="${find_name}" />
    <input type="submit" value="검색" />
   </div>   
 </div>
 </form>
</body>
</html>



