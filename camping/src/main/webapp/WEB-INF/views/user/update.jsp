<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="/WEB-INF/views/user/menuBar.jsp"%>

<div class="container">
	<div class="content">
	<form>
	<h2 align="center" style="color: #ffc107; margin-top:60px; font-weight:bold;">회원정보 수정</h2>
	<input type="hidden" name="id" id="id" value="${mlist.id }" />
	<div class="form-group mt-5 mb-3">
		<label for="username">아이디:</label> 
		<input type="text" id="username" name="username" class="form-control" placeholder="Enter ID" value="${mlist.username}"/>
	</div>
	<div class="form-group mb-3">
		<label for="pass">비밀번호:</label> 
		<input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
	</div>
	<div class="form-group mb-3">
		<label for="pass">비밀번호 확인:</label> 
		<input type="password" class="form-control" id="passcheck" placeholder="Enter passcheck" name="passcheck">
	</div>
	<div class="form-group mb-3">
		<label for="pass">이름:</label> 
		<input type="text" class="form-control" id="name" placeholder="Enter name" name="name" value="${mlist.name }">
	</div>
	<div class="form-group mb-3">
		<label for="email">이메일:</label> 
		<input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="${mlist.email }">
	</div>
	<div class="form-group mb-3">
		<label for="birthday">생년월일:</label> 
		<div id="birth" style="width:100%; text-align:centet;">
		<div style="width:30%; display:inline-block; margin-right:20px;"><select name="year" id="year" class="form-control mr-sm-1" >년</select></div>
		<div style="width:20%; display:inline-block; margin-right:20px;"><select name="month" id="month" class="form-control mr-sm-1">월</select></div>
		<div style="width:20%; display:inline-block;"><select name="day" id="day" class="form-control mr-sm-1">일</select></div>
		</div>
	</div>

	<div class="form-group mb-3">
		<label for="tel">전화번호:</label> 
		<input type="text" class="form-control" id="phone" placeholder="Enter tel" name="phone" value="${mlist.phone }">
	
	</div>
	<br />

	<div class="d-grid gap-2">
		<div style="width:100%; text-align:center;">
			<div class="btninline"><button type="button" class="btn btn-outline-warning" id="btnmUpdate">수정</button></div>
			<div class="btninline"><input type="reset" class="btn btn-outline-warning" id="btnBack" value="취소"></div>
		</div>
		<button type="button" class="btn btn-outline-warning mt-5" id="btnDel" style="height:60px;">회원탈퇴</button>
	</div>
</form>
</div>
</div>

<script>
$(document).ready(function(){            
	var now = new Date();
    var year = now.getFullYear();
    var month = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());     
    
    var mmonth =${mmonth} > 9 ? ${mmonth} : '0'+${mmonth}; 
    var mday = ${mday} > 9 ? ${mday} : '0'+${mday};  
    //년도 selectbox만들기               
    for(var i = 1900 ; i <= year ; i++) {
        $('#year').append('<option value="' + i + '">' + i + '년</option>');    
    }

    // 월별 selectbox 만들기            
    for(var i=1; i <= 12; i++) {
        var mm = i > 9 ? i : "0"+i ;            
        $('#month').append('<option value="' + mm + '">' + mm + '월</option>');    
    }
    
    // 일별 selectbox 만들기
    for(var i=1; i <= 31; i++) {
        var dd = i > 9 ? i : "0"+i ;            
        $('#day').append('<option value="' + dd + '">' + dd+ '일</option>');    
    }
   
    $("#year  > option[value="+${myear}+"]").attr("selected", "true");        
    $("#month  > option[value="+mmonth+"]").attr("selected", "true");  
    $("#day  > option[value="+mday+"]").attr("selected", "true");       
})

$("#btnmUpdate").click(function(){
	if($("#password").val()==""){
		alert("비밀번호를 입력하세요")
		$("#password").focus();
		return
	}
	if($("#passcheck").val()==""){
		alert("비밀번호를 확인해주세요")
		$("#passcheck").focus();
		return
	}
	if($("#password").val()!=$("#passcheck").val()){
		alert("비밀번호가 일치하지 않습니다.") 
		$("#password").val("")
		$("#passcheck").val("")
		return
	}
	data = {
		"id" : $("#id").val(),
		"username":$("#username").val(),
		"password":$("#password").val(),
		"name":$("#name").val(),
		"email":$("#email").val(),
		"birth":$("#year").val()+$("#month").val()+$("#day").val(),
		"phone":$("#phone").val()	
	}
	$.ajax({
		type:"put",
		url:"/update",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data)
	})
	.done(function(resp){
		if(resp=="success"){
			alert("회원 정보 수정을 완료하였습니다.")
			location.href="/list"
		}else if(resp=="fail"){
			alert("비밀번호가 일치하지 않습니다. 다시 입력하세요")
			$("#password").val("")
			$("#passcheck").val("")
		}
	})
	.fail(function(){
		alert("회원정보 수정에 실패하였습니다")
	})
})
$("#btnBack").click(function(){
	if(!confirm("수정한 정보를 모두 취소할까요?")) return
})
$("#btnDel").click(function(){
	if($("#password").val()==""){
		alert("비밀번호를 입력하세요")
		$("#password").focus();
		return
	}
	if($("#passcheck").val()==""){
		alert("비밀번호를 확인해주세요")
		$("#passcheck").focus();
		return
	}
	if($("#password").val()!=$("#passcheck").val()){
		alert("비밀번호가 일치하지 않습니다.") 
		$("#password").val("")
		$("#passcheck").val("")
		return
	}
	if(!confirm("정말 탈퇴할까요?")) return
	
	$.ajax({
		type:'delete',
		url:'/delete/${mlist.id}',
		data:{"password" : $("#password").val()},
		success:function(resp){
			if(resp=="success"){
				alert("캠핑고 회원 탈퇴 완료. 그동안 이용해주셔서 감사합니다.")
				location.href="/list"
			}else if(resp=="fail"){
				alert("비밀번호가 일치하지 않습니다. 다시 입력하세요")
				$("#password").val("")
				$("#passcheck").val("")
			}
		},
		error:function(){
			alert("회원 탈퇴 실패:"+e)
		}
	})
})
</script>
<%@ include file="../includes/footer.jsp"%>
