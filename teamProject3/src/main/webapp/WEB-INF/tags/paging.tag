<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ attribute name="paging" type="common.Paging" %>
<%@ attribute name="jsfunc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pagination">
<div id="divPaging">
<c:if test="${paging.startPage>1}">
	<div><a href="javascript:${jsfunc}(${paging.startPage-1})">◀</a></div>
</c:if>
<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
	<c:if test="${i != paging.page}">
		<div><a href="javascript:${jsfunc}(${i})">${i}</a></div>
	</c:if>
	<c:if test="${i == paging.page}">
		<div class="active">${i} </div>
	</c:if>
</c:forEach>
<c:if test="${paging.endPage<paging.totalPageCount}">
	<li><a href="javascript:${jsfunc}(${paging.endPage+1})">▶</a>
</c:if>
</div>
</div>