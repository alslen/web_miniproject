<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../includes/header.jsp"%> 
    <%@ include file="/WEB-INF/views/user/menuBar.jsp"%>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<div class="container">
		<div class="content">
		<h3 align = "center" style="color:#ffc107; margin-top:50px;">회원가입</h3>
			<div class="form-group mt-5 mb-3">
				<label for="username">아이디</label>
				<button type="button" id="btnIdCheck" class="btn btn-secondary" style="margin-left:50px; margin-bottom:10px;">중복확인</button>
				<input type="text" class="form-control" id="username" placeholder="Enter your Id" name="username" readonly="readonly">
			</div>
			<div class="form-group mb-3">
				<label for="pass" style="margin-bottom:10px;">비밀번호</label> 
				<input type="password" class="form-control"
				 id="password" placeholder="Enter your password" name="password">
			</div>
			<div class="form-group mb-3">
				<label for="pass" style="margin-bottom:10px;">비밀번호 확인</label> 
				<input type="password" class="form-control"
				 id="passcheck" placeholder="Enter your password check" name="passcheck">
			</div>
			<div class="form-group mb-3">
				<label for="name" style="margin-bottom:10px;">이름</label> 
				<input type="text" class="form-control"
				 id="name" placeholder="Enter your name" name="name">
			</div>
			<div class="form-group mb-3">
				<label for="email" style="margin-bottom:10px;">이메일</label> 
				<input type="email" class="form-control"
				 id="email" placeholder="Enter your email" name="email">
			</div>
			<div class="form-group mb-3" >
				<label for="birth" style="margin-bottom:10px;">생년월일</label>
				<div id="birth" style="width:100%; f">
					<div style="float:left; padding-right:10;"><select name="year" id="year" class="form-control mr-sm-1" style="width:170px;"></select></div>
					<div style="float:left; padding-right:10;"><select name="month" id="month" class="form-control mr-sm-1" style="width:150px;"></select></div>
					<div style="float:left;"><select name="day" id="day" class="form-control mr-sm-1" style="width:150px;"></select></div>
				</div>
				<div style="clear:both; "></div>
			</div>
			<div class="form-group mb-3">
				<label for="phone" style="margin-bottom:10px;">전화번호</label> 
				<input type="text" class="form-control"
				 id="phone" placeholder="Enter your phone number" name="phone">
			</div>
			<br/>
			
			<div class="d-grid gap-2" >
		  		<button  class="btn btn-outline-warning btn-block" id ="btnJoin">회원가입</button>
		    </div>
		</div>
</div>
<script>
$(document).ready(function(){            
    var now = new Date();
    var year = now.getFullYear();
    var month = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
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
    $("#year  > option[value="+year+"]").attr("selected", "true");        
    $("#month  > option[value="+month+"]").attr("selected", "true");    
    $("#day  > option[value="+day+"]").attr("selected", "true");       
})
$("#btnIdCheck").click(function(){
	var popupWidth = 600;
	var popupHeight = 300;
	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height / 2) - (popupHeight / 2);
	// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
	window.open("/idCheck", '', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);

})

$("#btnJoin").click(function(){
	if($("#password").val()!=$("#passcheck").val()){
		alert("비밀번호가 일치하지 않습니다.") 
		$("#password").val("")
		$("#passcheck").val("")
		return
	}
	var dataParam = {
			"username":$("#username").val(),
			"password":$("#password").val(),
			"passcheck":$("#passcheck").val(),
			"name":$("#name").val(),
			"email":$("#email").val(),
			"birth":$("#year").val()+$("#month").val()+$("#day").val(),
			"phone":$("#phone").val()
	}
	$.ajax({
		type:"put",
		url:"/register",
		contentType :"application/json;charset=utf-8",
		data:JSON.stringify(dataParam)
	})
	.done(function(resp){
		if(resp=="success"){
			alert("회원가입 성공 :) 회원이 되신 것을 축하드립니다.")
			location.href="/login"
		}else if(resp =="fail"){
			alert("아이디 중복")
			$("#password").val("")
			$("#passcheck").val("")
		}
		})//done
	.fail(function(){
		alert("회원가입 실패")
	})
})
</script>    

<%@ include file="../includes/footer.jsp"%> 
