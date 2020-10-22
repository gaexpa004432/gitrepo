<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>memberFavRecipe.jsp</title>
<style>
.center {
  position: absolute;
  display: inline-block;
  top: -40px; left: 95px;
  transform: translate(-50%, -50%);
}

/** Custom Select **/
.custom-select-wrapper {
  position: relative;
  display: inline-block;
  user-select: none;
}
  .custom-select-wrapper select {
    display: none;
    border-style: none;
}
  .custom-select {
    position: relative;
    display: inline-block;
}
    .custom-select-trigger {
      position: relative;
      display: block;
      width: 130px;
      padding: 0 84px 0 22px;
      font-size: 22px;
      font-weight: 300;
      color: #fff;
      line-height: 60px;
      background: #5c9cd8;
      border-radius: 4px;
      cursor: pointer;
    }
      .custom-select-trigger:after {
        position: absolute;
        display: block;
        content: '';
        width: 10px; height: 10px;
        top: 50%; right: 25px;
        margin-top: -3px;
        border-bottom: 1px solid #fff;
        border-right: 1px solid #fff;
        transform: rotate(45deg) translateY(-50%);
        transition: all .4s ease-in-out;
        transform-origin: 50% 0;
      }
      .custom-select.opened .custom-select-trigger:after {
        margin-top: 3px;
        transform: rotate(-135deg) translateY(-50%);
      }
  .custom-options {
    position: absolute;
    display: block;
    top: 100%; left: 0; right: 0;
    min-width: 100%;
    margin: 15px 0;
    border: 1px solid #b5b5b5;
    border-radius: 4px;
    box-sizing: border-box;
    box-shadow: 0 2px 1px rgba(0,0,0,.07);
    background: #fff;
    transition: all .4s ease-in-out;
    
    opacity: 0;
    visibility: hidden;
    pointer-events: none;
    transform: translateY(-15px);
  }
  .custom-select.opened .custom-options {
    opacity: 1;
    visibility: visible;
    pointer-events: all;
    transform: translateY(0);
  }
    .custom-options:before {
      position: absolute;
      display: block;
      content: '';
      bottom: 100%; right: 25px;
      width: 7px; height: 7px;
      margin-bottom: -4px;
      border-top: 1px solid #b5b5b5;
      border-left: 1px solid #b5b5b5;
      background: #fff;
      transform: rotate(45deg);
      transition: all .4s ease-in-out;
    }
    .option-hover:before {
      background: #f9f9f9;
    }
    .custom-option {
      position: relative;
      display: block;
      padding: 0 22px;
      border-bottom: 1px solid #b5b5b5;
      font-size: 18px;
      font-weight: 600;
      color: #b5b5b5;
      line-height: 47px;
      cursor: pointer;
      transition: all .4s ease-in-out;
    }
    .custom-option:first-of-type {
      border-radius: 4px 4px 0 0;
    }
    .custom-option:last-of-type {
      border-bottom: 0;
      border-radius: 0 0 4px 4px;
    }
    .custom-option:hover,
    .custom-option.selection {
      background: #f9f9f9;
    }
    
img.a {
		/*max-width : 100%;
		height : auto; */
		overflow:hidden;
		background-size : contain;
		max-width: 220px;
        min-width: 220px;
        max-height:190px;
        min-height:190px;
	}
</style>
</head>
<body>
<input type="hidden" name="fav" value="fr">
<section class="breadcrumb-section set-bg" data-setbg="/teamProject3/img/KakaoTalk_20201015_173926849.jpg" style="background-image:url('/teamProject3/img/sd.jpg')"> <!-- ì¬ê¸°ìë ì´ë¯¸ì§ ê²½ë¡ë¥¼ ë°ê¾¸ìë©´ ë©ëë¤. -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2 >즐겨찾기</h2>
                        <div class="breadcrumb__option">
                            <a href="/teamProject3/member/myPageMain.jsp">마이페이지</a>
                            <span >레시피</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<section class="blog spad">
<%@include file="/member/myPageMenu.jsp" %>
	<div class="col-lg-8 col-md-9">
        <div class="container">
            <div class="row">
                <!-- <div class="col-lg-8 col-md-7"> -->
                <div class="center">
				    <select name="sources" id="sources" class="custom-select sources" onchange="if(this.value) location.href=(this.value);" placeholder="Source Type">
					    <option value="${pageContext.request.contextPath}/favList.do?fav=fs"
					    		<c:if test="${fav == 'fs'}">selected='selected'</c:if>>즐겨찾는 식당</option>
					    <option value="${pageContext.request.contextPath}/favList.do?fav=fr"
					    		<c:if test="${fav == 'fr'}">selected='selected'</c:if>>즐겨찾는 레시피</option>
				    </select>
				</div>
                    <div class="row">
                    	<c:forEach items="${fr}" var="fr">
	                        <div class="col-lg-6 ">
	                            <div class="blog__item">
	                                <div class="blog__item__pic">
	                                    <img class="a" src="images/${fr.main_img}" alt="">
	                                </div>
	                                <div class="blog__item__text">
	                                    <ul>
	                                       <%-- <li><i class="fa fa-calendar-o"></i>${fr.recipe_date}</li> --%>
	                                       <!--  <li><i class="fa fa-comment-o"></i> 5</li> -->
	                                    </ul>
	                                    <h5><a href="${pageContext.request.contextPath}/recipeView.do?recipe_number=${fr.recipe_number}">${fr.recipe_name}</a></h5>
	                                    <%-- <p>${fr.recipe_content}</p> --%>
	                                    <a href="${pageContext.request.contextPath}/recipeView.do?recipe_number=${fr.recipe_number}" class="blog__btn">자세히보기<span class="arrow_right"></span></a>
	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>
                    </div>
                <!-- </div> -->
            </div>
        </div>
    <div class="col-lg-8 col-md-7">    
	    <form name = "pageFrm">
			<input type="hidden" name="p" value="1">
			<input type="hidden" name="fav" value="fr">
			<my:favTag paging="${paging}" jsfunc="gopage"/>
		</form>
	</div>
    </div>
</section>
	
<script>
function gopage(p) {
	pageFrm.p.value = p;
	pageFrm.submit();
	//location.href="deptSelectAll?p=" + p;
}
</script>
</body>
</html>