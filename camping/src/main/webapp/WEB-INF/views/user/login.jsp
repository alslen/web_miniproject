<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="/WEB-INF/views/user/menuBar.jsp"%>
<div class="container">
	<div class="d-flex justify-content-center">

		<form action="/login" method="post" id="frm">
			<br /> <br />
			<div class="d-flex justify-content-center">
				<img src="../img/logo2.jpg" height="200" width="200" alt="My Image">
			</div>
			<br /> <br />
			<div class="loginform">
			<div class="form-group">
				<label for="username"></label> <input type="text" id="username"
					name="username" class="form-control" placeholder="Enter ID" />
			</div>
			<br />
			<div class="form-group">
				<label for="pass"></label> <input type="password"
					class="form-control" id="password" placeholder="Enter pass"
					name="password">
			</div>
			<br />
			<div class="">
				<button type="button" class="btn btn-outline-warning btn-block"
					id="btnlogin">로그인</button>
				<c:if test="${access_token eq null}">
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=25e9068a898c848763a0508296b6cc0b&redirect_uri=http://localhost:7800/auth/kakao/callback&response_type=code">
					<img src="/img/kakao_login_large_wide3.png" alt="카카오 로그인 버튼" class="kakaoBtn mt-2"/>
				</a>
				</c:if>
			</div>
			</div>
		</form>
	</div>
</div>
<script>
	$("#btnlogin").click(function() {
		if ($("#username").val() == "") {
			alert("아이디를 입력하세요")
			$("#username").focus();
		}
		if ($("#password").val() == "") {
			alert("비밀번호 입력하세요")
			$("#password").focus();
			return false;
		}
		$("#frm").submit()
	})//btnjoin

	//엔터키 이벤트
    var input = document.getElementById("password");

    input.addEventListener("keyup", function (event) {
      if (event.keyCode === 13) {
        event.preventDefault();
        document.getElementById("btnlogin").click();
      }
    });
</script>

<%@ include file="../includes/footer.jsp"%>