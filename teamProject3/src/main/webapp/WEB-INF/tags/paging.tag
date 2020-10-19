<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ attribute name="paging" type="common.Paging" %>
<%@ attribute name="jsfunc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="product__pagination blog__pagination" style="position: static" align="center">
<c:if test="${paging.startPage>1}">
	<a href="javascript:${jsfunc}(${paging.startPage-1})"><li class="fa fa-long-arrow-left"></li></a>
</c:if>
<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
	<c:if test="${i != paging.page}">
		<a href="javascript:${jsfunc}(${i})">${i}</a>
	</c:if>
	<c:if test="${i == paging.page}">
		<a style="background: #7fad39;
	border-color: #7fad39;
	color: #ffffff;">${i} </a>
	</c:if>
	
</c:forEach>
<c:if test="${paging.endPage<paging.totalPageCount}">
	<a href="javascript:${jsfunc}(${paging.endPage+1})" ><li class="fa fa-long-arrow-right"></li></a>
</c:if>
 </div>

