<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
  <link href="/css/styles.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  
<div class="idchk_outer">
	<div class="idcheck">
		<h3 style="padding-bottom:20px;">아이디 중복확인</h3>
		아이디 <input type="text" name="username" id="username" />
		<button type="button" id="idUseBtn">사용</button>
	</div>
</div>

<script>

$("#idUseBtn").click(function(){
	if($("#username").val()==""){
		alert("아이디를 입력하세요")
		return;
	}
	$.ajax({
		type:'post',
		url:'/idCheckPro',
		contentType:'application/json;charset=utf-8',
		data:JSON.stringify({"username":$("#username").val()}),
		success:function(resp){
			if(resp == "success") {
				alert('사용 가능한 아이디입니다.')
				$(opener.document).find("#username").val($("#username").val())
				self.close()
			}else if (resp =="fail"){ 
				alert("사용 불가능한 아이디입니다.")
				$("#username").val('')
				$("#username").focus()
			}
		}
	})  // ajax
})  // idUseBtn
</script>