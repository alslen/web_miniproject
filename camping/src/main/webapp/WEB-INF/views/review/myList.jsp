<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="/WEB-INF/views/user/menuBar.jsp"%>

<style>
.myReveiwTitle {
	color:#ffc107; 
	margin-top:50px;
	padding:0 10px 20px 10px;
	font-weight: 700;
	font-size: 20px;
}
.review {
  width:100%;
  height:auto;
  background-color: #fff;
  box-shadow: 3px 5px 7px #c6c6c6;
  padding:25px;
  border-radius:15px;
  border:1px solid #efefef;
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
  
}
.review .reviewPlace {
	font-weight: 700;
	margin-bottom: 10px;
}
h5 {
	margin-bottom:5px;
}
.review #reviewResult{
	margin-bottom: 10px;
}
.review #reviewResult .starImg {
	margin-right: 3px;
	opacity: 0.7;
}
.review .reviewUsername {
	display:inline;
	font-weight: bold;
	font-size: 14px;
}
.review .reviewDate {
	display:inline;
	color:#D5D5D5;
	font-size:13px;
	font-weight: 700;
}
.review .reviewContent {
	margin-top:10px;
	font-weight: 400;
	font-size: 15px;
}

</style>

<div class="container">
	<div class="listcontent">
	<h3 class="myReveiwTitle">내가 쓴 리뷰(${mcount})</h3>
	<c:forEach items="${mreview}" var="myReview">
		<div class="review">
		<div class="reviewLeft">
				<h4 class="reviewPlace"><a href="/detail/${myReview.camping.camp_id}">${myReview.camping.camp_title}</a></h4>
				
				<!-- 벌점 표시 -->
				<div id="reviewResult">
				<c:if test="${myReview.score == 5}">
					<c:forEach begin="1" end="${myReview.score }">
					<img src="/img/y_star.png"/>
					</c:forEach>
				</c:if>
				
				<c:if test="${myReview.score == 4}">
					<c:forEach begin="1" end="${myReview.score }">
					<img src="/img/y_star.png"/>
					</c:forEach>
					<c:forEach begin="1" end="${5-myReview.score }">
					<img src="/img/star.png"/>
					</c:forEach>
				</c:if>
				
				<c:if test="${myReview.score == 3}">
					<c:forEach begin="1" end="${myReview.score }">
					<img src="/img/y_star.png"/>
					</c:forEach>
					<c:forEach begin="1" end="${5-myReview.score }">
					<img src="/img/star.png"/>
					</c:forEach>
				</c:if>
				
				<c:if test="${myReview.score == 2}">
					<c:forEach begin="1" end="${myReview.score }">
					<img src="/img/y_star.png"/>
					</c:forEach>
					<c:forEach begin="1" end="${5-myReview.score }">
					<img src="/img/star.png"/>
					</c:forEach>
				</c:if>
				
				<c:if test="${myReview.score == 1}">
					<c:forEach begin="1" end="${myReview.score }">
					<img src="/img/y_star.png"/>
					</c:forEach>
					<c:forEach begin="1" end="${5-myReview.score }">
					<img src="/img/star.png"/>
					</c:forEach>
				</c:if><br>
				</div>
				
				<h5 class="reviewUsername">${myReview.member.username }</h5>
				<h5 class="reviewDate"> | ${myReview.reviewDate}</h5>
				<h4 class="reviewContent">${myReview.content}</h4>
		</div>
		<div class="reviewRight">
			<button class="btn btn-outline-dark" onclick="reviewDel(${myReview.reviewNum})">삭제</button>
		</div>	
		</div>
		<br>
	</c:forEach>
	</div>
</div>

<script>
	function reviewDel(reviewNum){
		if(!confirm('정말 삭제하시겠습니까?')) return;
		$.ajax({
			type:'delete',
			url:'/review/delete/'+reviewNum,
			success:function(resp){
				alert("삭제 했습니다.")
				location.href="/review/myList/${principal.member.id}"
			},
			error:function(resp){
				alert("삭제 실패.")
			}
		})
		
	}
</script>

<div style="clear:both;"></div>
<%@ include file="../includes/footer.jsp"%>