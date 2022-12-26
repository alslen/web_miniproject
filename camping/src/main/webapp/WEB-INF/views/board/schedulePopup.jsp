<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>예약 하기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- custom -->

</head>
<body>
<div class = "group" id = "popupGroup">	
	<div class = "group-head">
		<h1 class = "zTree-h1"> 예약 하기 </h1>
	</div>
	<div class = "group-body">
	<form id = "scheduleData" action="/full-calendar/insert" method="get">
		 <input type="hidden" value="${id.id}" id="member" name="member"/> 
		  <input type="hidden" value="${camping_id.camp_id}" id="camping" name="camping"/> 
		<div class="mb-2" style="padding:1em;">
  			<label for="exampleFormControlInput1" class="form-label"><strong>아이디</strong></label>
  			<input type="email" class="form-control" id="exampleFormControlInput1"value="${id.username}" readonly="readonly" >
		</div>
		<div class="mb-2" style="padding:1em;">
  			<label for="exampleFormControlInput1" class="form-label"><strong>Check in</strong></label>
  			<input type="date" class="form-control" id="check_in" name="check_in" >
		</div>
		<div class="mb-2" style="padding:1em;">
  			<label for="exampleFormControlInput1" class="form-label"><strong>Check out</strong></label>
  			<input type="date" class="form-control" id="check_out" name="check_out" >
		</div>		
		<button type="submit" class="btn btn-secondary"style="margin-left:17px">확인</button>
	</form>
	</div>	
</div>
</body>

</html>