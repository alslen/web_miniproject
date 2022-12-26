<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/camping/common.jsp"%>
<%@ include file="/WEB-INF/views/user/menuBar.jsp"%>

<div class="container">
<h3>찜한 캠핑장(${count})</h3>
<c:forEach items="${wlist}" var="wishlist">       
    <div class="container">
      <div class="row" style="width:350px; margin:10px; float:left; ">
        <div class="col-sm-3" >
          <div class="card" style="border:1px solid grey; width:300px; height:410px;">
          	<div style="width:300px;height:300px;">
	          <c:forEach items="${wishlist.camping.picture}" var="pic" begin="0" end="0">
	           <a href="/detail/${wishlist.camping.camp_id}"><img class="card-img-top img" data-src="${i.count}" src="/image/${pic.pic_name}" alt="Card image" style="width:298px; height:298px;"></a> 
	          </c:forEach>
	          </div>
  
	          <div class="card-body">
		          <h4>${wishlist.camping.camp_title}</h4>
		          <p class="card-text">${wishlist.camping.address}</p>
	          </div>
          </div>
        </div>
      </div>
    </div>

 </c:forEach>
 </div>
 
 <div style="clear:both;"></div>
 <%@ include file="../includes/footer.jsp"%>
