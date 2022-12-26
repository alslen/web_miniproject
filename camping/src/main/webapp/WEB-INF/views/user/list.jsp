<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../includes/header.jsp"%> 
    <%@ include file="/WEB-INF/views/user/menuBar.jsp"%>
    
 <div class="container">
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이메일</th>
				
				<th>권한</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${lists}" var="user" varStatus="st">
				<tr>
					<td>${user.id }</td>
					<td>${user.username }</td>
					<td>${user.email }</td>
					<td>${user.role }</td>
				
					
				<td><a href = 'javascript:fdel("+val.id+")'>삭제</a></td>
			
				</tr>
			</c:forEach>
		


</tbody>
</table>
</div>
	<script>
function fdel(id){
	
	$.ajax({
		type:'DELETE',
		url: "/delete/${principal.user.id}"
	
	})
	.done(function(resp){
		alert("삭제성공")
	})
	
	.fail(function(e){
		alert("삭제 실패")
	})
}
</script>
