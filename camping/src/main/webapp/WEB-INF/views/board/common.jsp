<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<script>
    var index = 0;   //이미지에 접근하는 인덱스
    window.onload = function(){
        slideShow();
    }
    
    function slideShow() {
    var i;
    var j=1;
    const images = document.querySelectorAll(".img[data-src='1']");  //slide1에 대한 dom 참조
    for (i = 0; i <images.length; i++) {
    	images[i].classList.remove('on');   //처음에 전부 display를 none으로 한다.
    }
    index++;
    if (index > images.length) {
        index = 1;  //인덱스가 초과되면 1로 변경
    }   
    images[index-1].classList.add('on');  //해당 인덱스는 block으로
    setTimeout(slideShow, 4000);   //함수를 4초마다 호출
 
}

</script>

        <div class="contianer">
        <div class="bg-light">
        	<div class="row pt-5">
        			<div style="width:20%; float:left; margin-left:26.5%;" class="d-flex justify-content-statrt">
        				<svg  width="80" height="80" xmlns="http://www.w3.org/2000/svg">
        					<a href="/camp"><image href="./img/camp.png" height="80" width="80"/></a>
        				</svg>
        			</div>
        			<div style="width:20%; float:left;" class="d-flex justify-content-statrt">
        				<svg  width="80" height="80" xmlns="http://www.w3.org/2000/svg">
        					<a href="/car"><image href="./img/car.png" height="80" width="80"/></a>
        				</svg>
        			</div>
        			<div style="width:20%; float:left;" class="d-flex justify-content-statrt">
        				<svg  width="80" height="80" xmlns="http://www.w3.org/2000/svg">
        					<a href="/gram"><image href="./img/glam.png" height="80" width="80"/></a>
        				</svg>
        			</div>
        		</div>
        		<div class="row pb-5">	
        			<div style="width:20%; float:left; margin-left:27.5%;" class="d-flex justify-content-statrt">
        				<strong>캠핑장</strong>
        			</div>
        			<div style="width:20%; float:left; margin-left:0%;" class="d-flex justify-content-statrt">
        				<strong>카라반</strong>
        			</div>  
        			<div style="width:20%; float:left; margin-left:0%;" class="d-flex justify-content-statrt">
        				<strong>글램핑</strong>
        			</div>        			      			
        		</div>	        			        			        			
        	
        </div>	
       </div>