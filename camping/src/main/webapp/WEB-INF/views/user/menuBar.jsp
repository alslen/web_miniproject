<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    
<style>
    body {
        margin: auto;
        padding: 0;
        font-family:"맑은 고딕";
        font-size:0.8em;
	}

    .title {
        width: 50px;
        height:50px !important; 
        padding-top:11px !important;
}
    ul#navi, ul#navi ul {
        margin:0;
        padding:0;
        list-style:none;
        
}
    li.group {
        margin-bottom: 3px;
}
    li.group div.title {
        height: 35px;
        line-height: 35px;
        background:#adb5bd;
        cursor:pointer;
}
    ul.sub li {
        margin-bottom: 2px;
        height:35px;
        line-height:35px;
        background:#e9ecef;
        cursor:pointer;
}
    ul.sub li a {
        display: block;
        width: 100%;
        height:100%;
        text-decoration:none;
        color:#000;
}
    ul.sub li:hover {
        background:#6c757d;
        color:#fff;
}
.naviDiv {
    position:fixed;
    top: 370px;
    left: 100px;
    text-align:center;
    display: inline-block;
    width:200px;
    float:left;
}

/* 스크롤따라 움직임 */
</style>
<script>
    $(document).ready(function(){
 
        $(".sub").hide(); //모든 서브 메뉴 감추기
  init(0); //첫번째 메뉴 활성화
 
        $(".title").click(function(){
 
  //서브메뉴가 보이지않을겨우에만 동작실행(서브메뉴가 보이는 상태에서 동작되지 않게)
  if( $(this).next().css("display") == "none" ) {
//열린 서브메뉴에 대해서만 가립니다.
$(".sub").each(function(){
if($(this).css("display")=="block") {         
$(this).slideUp("fast");
}
});
 
$(this).next("ul").slideDown("fast");
//현재 클릭된 <div> 태그 다음의 <ul> 태그가 slideDown 으로 보여지게 된다.
} else {
return false;
}
        });    
 
});
 
//특정 서브메뉴를 활성화 시키는 함수
function init(n) {
$("li.group").eq(n).find("ul").show();
}
</script>
<div class="naviDiv">
<sec:authorize access="isAuthenticated()">
<ul id="navi">
	<!-- 관리자만 볼수 있는 navi -->
		<c:if test="${principal.member.role == 'ROLE_ADMIN' }">
	        <li class="group">
	            <div class="title"><img src="/img/setting.png" style="width:30px; height:30px;"></div>
	            <!--  
	            <ul class="sub">
	            	<li><a href="/insert">캠핑장 등록 폼</a></li>   
	                <li><a href="/memberList">전체 회원리스트</a></li>
	                <li><a href="/booking/adminList">전체 예약리스트</a></li>       
	            </ul>
	            -->
	            <ul class="sub">
		            <li style="width:50px; height:50px; padding-top:7px;"><a href="/insert"><img src="/img/camping-tent.png" style="width:40px; height:40px;"></a></li>
		            <li style="width:50px; height:50px; padding-top:5px;"><a href="/memberList"><img src="/img/contact-book.png" style="width:40px; height:40px;"></a></li>
		            <li style="width:50px; height:50px; padding-top:9px;"><a href="/booking/adminList"><img src="/img/booking.png" style="width:30px; height:30px;"></a></li>
	            </ul>
	        </li>     
		</c:if>
		<!-- 일반 유저 메뉴 -->
		<li class="group">
			<div class="title"><img src="/img/menu.png" style="width:30px; height:30px;opacity:50%;"></div>
				<!--
				<ul class="sub">
					<li><a href="/update/${principal.member.id }">회원정보 수정</a></li>
					<li><a href="/like/list/${principal.member.id }">찜한 캠핑장</a></li> 
					<li><a href="/booking/bookList/${principal.member.id }">내 예약보기</a></li>
				</ul>
				-->
				<ul class="sub">
	            	<li style="width:50px; height:50px; padding-top:11px;"><a href="/update/${principal.member.id }"><img src="/img/user.png" style="width:30px; height:30px;"></a></li>
	            	<li style="width:50px; height:50px; padding-top:5px;"><a href="/like/list/${principal.member.id }"><img src="/img/massage.png" style="width:40px; height:40px;"></a></li>
	            	<li style="width:50px; height:50px; padding-top:5px;"><a href="/review/myList/${principal.member.id }"><img src="/img/feedback.png" style="width:40px; height:40px;"></a></li>
	            	<li style="width:50px; height:50px; padding-top:9px;"><a href="/booking/bookList/${principal.member.id }"><img src="/img/list.png" style="width:30px; height:30px;"></a></li>
            	</ul>
		</li>
</ul>
</sec:authorize>
</div>