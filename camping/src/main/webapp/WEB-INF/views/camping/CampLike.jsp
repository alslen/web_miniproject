<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/camping/common.jsp"%>
<%@ include file="/WEB-INF/views/user/menuBar.jsp"%>

<!------ 좋아요 많은 순 list 전체보기  ------->
<div class="container">
<c:forEach items="${likeList}" var="product">       
      <div class="row" style="width:350px; margin:10px; float:left; ">
        <div class="col-sm-3">
          <div class="card" style="border:1px solid grey; width:300px; height:410px;">
          	<div style="width:300px;height:300px;">
	          <c:forEach items="${product.picture}" var="pic" begin="0" end="0">
	           <a href="/detail/${product.camp_id}"><img class="card-img-top img" data-src="${i.count}" src="/image/${pic.pic_name}" alt="Card image" style="width:298px; height:298px;"></a> 
	          </c:forEach>
  			</div>
	        <div class="card-body">
		          <h4>${product.camp_title}</h4>
		          <p class="card-text">${product.address}</p>
	        </div>
          </div>
        </div>
      </div>
</c:forEach>
</div>

<div style="clear:both;"></div>
<%@ include file="../includes/footer.jsp"%>