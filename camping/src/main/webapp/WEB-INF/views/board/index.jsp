<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<%@ include file="/WEB-INF/views/user/menuBar.jsp"%>
        <div class="contianer">
        <div class="bg-light">
        	<div class="row pt-5">
        			<div style="width:20%; float:left; margin-left:26.5%;" class="d-flex justify-content-statrt">
        				<svg  width="80" height="80" xmlns="http://www.w3.org/2000/svg">
        					<a href=""><image href="/img/camp.png" height="80" width="80"/></a>
        				</svg>
        			</div>
        			<div style="width:20%; float:left;" class="d-flex justify-content-statrt">
        				<svg  width="80" height="80" xmlns="http://www.w3.org/2000/svg">
        					<a href=""><image href="/img/car.png" height="80" width="80"/></a>
        				</svg>
        			</div>
        			<div style="width:20%; float:left;" class="d-flex justify-content-statrt">
        				<svg  width="80" height="80" xmlns="http://www.w3.org/2000/svg">
        					<a href=""><image href="/img/glam.png" height="80" width="80"/></a>
        				</svg>
        			</div>
        		</div>
        		<div class="row  pb-5">	
        			<div style="width:20%; float:left; margin-left:27.3%;" class="d-flex justify-content-statrt">
        				<strong>캠핑장</strong>
        			</div>
        			<div style="width:20%; float:left; margin-left:0.2%;" class="d-flex justify-content-statrt">
        				<strong>카라반</strong>
        			</div>  
        			<div style="width:20%; float:left; margin-left:0%;" class="d-flex justify-content-statrt">
        				<strong>글램핑</strong>
        			</div>        			      			
        		</div>	        			        			        			
        	
        </div>	
       </div>
<c:forEach items="${clist}" var="product">       
<div class="album py-5 bg-light">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        <div class="col">
          <div class="card shadow-sm">
            <img class="card-img-top" src="/images/${product.fileimage}" alt="Card image" style="width:100%;height:300px">
            <div class="card-body">
              <p class="card-text"></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">Like</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">5</button>
                </div>
                <small class="text-muted">time</small>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
 </div>
</c:forEach>
 <%@ include file="../includes/footer.jsp"%>