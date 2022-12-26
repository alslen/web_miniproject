<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer class="page-footer font-small blue">


<!-- top button -->
<div class="btnTop">
	<button onclick="topFunction()" id="myBtn" title="Go to top" class="rounded-pill">Top</button>
</div> 
<div style="clear:both;"></div>
<script>
let mybutton = document.getElementById("myBtn");

window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>

  <!-- Copyright -->
  <div class="footer-copyright text-center">
  
	  <div class="container">
	  <hr>
	  	<div class="contents pt-4 bs-gray-400">
		  © 2022 CampingGO Corp.<br><br>
		  캠핑고는 통신판매 중개자로서 통신판매의 당사자가 아니며 고객지원을 제외한 상품의 예약,
		  이용 등과 관련한 의무와 책임 등 모든 거래에 대한 책임은 가맹점에게 있습니다.<br><br>
		  
		  캠핑고고객센터 : 1588-1004 / 오전 9시 ~ 오후 5시 <br><br>
		  
		  (주)캠핑고<br>
		  주소:부산광역시 부산진구 중앙대로 708 부산파이낸스센터 4층 | 대표자 : 정희선 | 사업자등록번호 : 123-45-67890<br>
		  통신판매번호 : 2022-부산진구-1234 | 전화번호 : 1588-9090 | 전자우편주소 : campinggo@camping.co.kr<br><br>
		  
		  <div class="footer-copyright">© 2022 Copyright:
		  <a href="#"> CAMPINGGO Corp. </a> ALL rights reserved.
		  </div>
		 </div>
	  </div>
  </div>
</footer>
</body>
</html>