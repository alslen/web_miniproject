<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../includes/header.jsp"%> 
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<div class="container">

	<div class="form-group">
		<label for="username">아이디:</label>
		 <input type="text" id="username" name="username"
			class="form-control" placeholder="Enter ID" />
	</div>
	<div class="form-group">
		<label for="pass">비밀번호:</label> 
		<input type="password" class="form-control"
		 id="password" placeholder="Enter pass" name="password">
	</div>
	<div class="form-group">
		<label for="email">이메일:</label> 
		<input type="email" class="form-control"
		 id="email" placeholder="Enter email" name="email">
	</div>
	
	
	 <button class="btn btn-danger" id = "btnadminJoin">회원가입</button>
<script>
$("#btnadminJoin").click(function(){
	
	var dataParam = {
			
			"username":$("#username").val(),
			"password":$("#password").val(),
			"email":$("#email").val()
			
			
	}
	
	
	
	
	
	$.ajax({
		type:"POST",
		url:"/adminJoin",
			contentType :"application/json;charset=utf-8",
				data:JSON.stringify(dataParam)
	})
	.done(function(resp){
		if(resp=="success"){
		alert(resp+"회원가입 성공")
		location.href="/login"
		}else if(resp =="fail"){
			alert("아이디 중복")
			$("#username").val("")
		}
		})//done
		
		

	.fail(function(){
	alert("회원가입 실패")
})



})//btnJoin



</script>
</div>