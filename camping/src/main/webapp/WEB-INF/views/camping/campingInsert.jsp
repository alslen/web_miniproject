<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../includes/header.jsp"%>
<%@ include file="/WEB-INF/views/user/menuBar.jsp"%>

<div class="container">
	<div class="content">
	<h3 align = "center" style="color:#ffc107; margin-top:50px;">캠핑장 등록</h3>
	<form action="/insert" method="post" enctype="multipart/form-data" id="frm">
	<div class="form-group  mt-5 mb-3">
		<label for="campTitle">캠핑장 명칭:</label>
		<input type="text" class="form-control" id="camp_title" name="camp_title" placeholder="Enter campTitle"/>
	</div>
	<div class="form-group mb-3">
		<label for="campTel">캠핑장 전화번호:</label>
		<input type="text" class="form-control" id="camp_tel" name="camp_tel" placeholder="Enter camp_tel"/>
	</div>
	<div class="form-group mb-3">
		<label for="address">캠핑장 주소:</label>
		<input type="text" class="form-control" id="address" name="address" placeholder="Enter address"/>
	</div>
	<div>
		<label for="count">인원수:</label>
		<input type="number" min="0" max="100" class="form-control" id="count" name="count" placeholder="Enter count"/>
	</div>
	<div class="form-group">
		<label for="price">가격:</label>
		<input type="text" class="form-control" id="price" name="price" placeholder="Enter price"/>
	</div>
	<div class="form-group mb-3">
		<label for="campEmail">캠핑장 이메일:</label>
		<input type="text" class="form-control" id="camp_email" name="camp_email" placeholder="Enter campEmail"/>
	</div>
	<div class="form-group mb-3">
		<label for="master">대표자:</label>
		<input type="text" class="form-control" id="master" name="master" placeholder="Enter master"/>
	</div>
	<div class="form-group">
		<label for="room_info">설명:</label>
		<textarea rows="3" cols="50" name="room_info" id="room_info" class="form-control"></textarea>
	</div>
	<div class="form-group mb-3">
		<label for="upload">캠핑장 사진:</label>
		<input multiple="multiple" type="file" class="form-control" id="upload" name="upload[]" placeholder="Enter File"/><br>
	</div>
	<div class="form-group form-inline mb-3">
		<label for="campId">종류:</label>
		<div style="vertical-align:center;"><input type="radio" name="camp_category" value="1" style="float:left; " checked><label style="float:right;">카라반</label></div>
		<div style="vertical-align:center;"><input type="radio" name="camp_category" style="float:left;" value="2"><label  style="float:right;">글램핑</label></div>
		<div style="vertical-align:center;"><input type="radio" name="camp_category" style="float:left;" value="3"><label  style="float:right;">캠핑장</label></div>
	</div>
	<div class="d-grid gap-2" >
		<button type="button" class="btn btn-outline-warning btn-block" id="insertBtn">등록하기</button>
	</div>
	</form>
	</div>
</div>


<script>
 $("#insertBtn").click(function(){
 	/* if($("#camp_title").val()==""){
		alert("캠핑장 명칭을 입력해주세요.")
		$("#camp_title").focus();
		return
	}
	if($("#camp_tel").val()==""){
		alert("전화번호를 입력해주세요.")
		$("#camp_tel").focus();
		return
	}
	if($("#address").val()==""){
		alert("캠핑장 주소를 입력해주세요.")
		$("#address").focus();
		return
	}
	if($("#count").val()==""){
		alert("최대 인원수를 입력해주세요.")
		$("#count").focus();
		return
	}
	if($("#price").val()==""){
		alert("가격을 입력해주세요.")
		$("#price").focus();
		return
	}
	if($("#camp_email").val()==""){
		alert("연락받을 이메일을 입력해주세요.")
		$("#camp_email").focus();
		return
	}
	if($("#master").val()==""){
		alert("대표자 성함을 입력해주세요.")
		$("#master").focus();
		return
	}
	if($("#room_info").val()==""){
		alert("캠핑장 정보를 입력해주세요.")
		$("#room_info").focus();
		return
	}
	if($("#upload").val()==""){
		alert("사진을 등록해주세요.")
		$("#upload").focus();
		return
	}   */
	$("#frm").submit()
})
	
	
</script>

    
<%@ include file="../includes/footer.jsp"%>