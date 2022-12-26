<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="/WEB-INF/views/user/menuBar.jsp"%>
<div class="container">
	<div class="listcontent">
	<h3 style="color:#ffc107; margin-top:50px;">예약목록(${acount})</h3>
	<table class="table table-hover mt-4 mb-3" style="font-size:15px">
		<thead>
			<tr>
				<th>번호</th>
				<th>예약자명</th>
				<th>예약자 전화번호</th>
				<th>캠핑장 이름</th>
				<th>캠핑장 주소</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>결제금액</th>
				<th>승인/취소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${alists}" var="abooking">
				<tr>
					<td>${abooking.bookNum}</td>
					<td>${abooking.member.name}</td>
					<td>${abooking.member.phone }</td>
					<td>${abooking.camping.camp_title }</td>
					<td>${abooking.camping.address}</td>
					<td>${abooking.check_in}</td>
					<td>${abooking.check_out}</td>
					<td>${abooking.dayCnt * abooking.camping.price}</td>
					<td>
						<c:if test="${abooking.status==0 }">
							<button type="button" id="checkBtn" style="font-size:15px;" onclick="check(${abooking.bookNum},${abooking.status})" class="btn btn-info">승인</button>
							<button type="button" id="cancleBtn" style="font-size:15px;" onclick="cancle(${abooking.bookNum},${abooking.status})" class="btn btn-info">취소</button>
						</c:if>
						<c:if test="${abooking.status==1 }">
							예약확정
						</c:if>
						<c:if test="${abooking.status==2 }">
							예약취소
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>

<script>
// 예약 승인
function check(bookNum, status) {
	if(!confirm('승인하시겠습니까?')) return;
	$.ajax({
		type:'put',
		url:'/booking/statusUpdate/'+bookNum,
		data:{"status": status},
		success:function(resp){
			alert('성공적으로 승인되었습니다.')
			location.href="/booking/adminList"
		},
		error:function(resp){
			alert("승인실패")
		}
	})
}

// 예약 취소
function cancle(bookNum, status) {
	if(!confirm('취소하시겠습니까?')) return;
	$.ajax({
		type:'put',
		url:'/booking/statusCancle/'+bookNum,
		data:{"status": status},
		success:function(resp){
			alert('성공적으로 취소되었습니다.')
			location.href="/booking/adminList"
		},
		error:function(resp){
			alert("취소실패")
		}
	})
}
</script>