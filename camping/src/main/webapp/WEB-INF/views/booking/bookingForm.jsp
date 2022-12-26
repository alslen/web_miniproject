<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="/WEB-INF/views/user/menuBar.jsp"%>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
 <script type="text/javascript">
	$(function() {
		$.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
               ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
               ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
               //,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
               ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
               ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
               ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
               ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
               ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
               ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
				,minDate:0
         });
		////////////////////////////////////////////////////////////////////////////////////////
		$("#check_in").datepicker();
		$("#check_out").datepicker();
		

		$("#check_in").datepicker('setDate','today');
		$("#check_out").datepicker('setDate','+1D');
		
	});
</script>

<script type="text/javascript">
	function reservCheck( ){ //reservCheck(sessionID){
		var checkIn=document.getElementById("check_in").value;
		var checkOut=document.getElementById("check_out").value;
		
		if(checkIn==null||checkIn==""){
			alert("입실 날짜를 선택해 주세요.");
			return false;
		}else if(checkOut==null||checkOut==""){
			alert("퇴실 날짜를 선택해 주세요.");
			return false;
		}else if(checkIn==checkOut){
			alert("입실/퇴실 날짜가 같습니다. 다시 확인해 주세요.");
			return false;
		}
		else if(checkIn>checkOut){
			alert("입실 날짜를 다시 선택해주세요.");
			return false;
		}
		
        alert( "예약시작날짜= " + checkIn +"  예약퇴실날짜=" + checkOut) ;
       	$("#frm").submit();
 
      }
</script>
  
<div class="container mt-5">
<h3>캠핑장 예약하기</h3>
<form action="/booking/reserve" method="post" id="frm">
	<div class="container mt-5 mb-5 bg-light">
	<input type="hidden" name="camping" id="camping" value="${bookList.camp_id}">
	<input type="hidden" name="member" id="member" value="${principal.member.id}">
	<h4>캠핑장 정보</h4>
		<div class="form-group">
		<label for="camp_title">캠핑장 이름 : </label>
		<input type="text" class="form-control" id="camp_title" name="camp_title" placeholder="Enter camp_title" value="${bookList.camp_title}">
		</div>
		<div class="form-group">
		<label for="camp_title">캠핑장 주소 : </label>
		<input type="text" class="form-control" id="address" name="address" placeholder="Enter address" value="${bookList.address}">
		</div>
		<div class="form-group">
		<label for="camp_title">캠핑장 전화번호 : </label>
		<input type="text" class="form-control" id="camp_tel" name="camp_tel" placeholder="Enter camp_tel" value="${bookList.camp_tel}">
		</div>
		<div class="form-group">
		<label for="checkin">체크인 :</label>
		<input type="text" class="form-control" id="check_in" name="check_in" placeholder="Enter checkin">
		</div>
		<div class="form-group">
		<label for="checkout">체크아웃 :</label>
		<input type="text" class="form-control" id="check_out" name="check_out" placeholder="Enter checkout">
		</div>
		<button type="button"  class="btn btn-secondary" id ="btnReserve" onclick="show();">예약확인</button>
	</div>
	<hr>
	<div class="container mt-5 mb-5 bg-light">
	<h4>예약자 정보</h4>
		<div class="form-group">
		<label for="username">예약자 성함 : </label>
		<input type="text" class="form-control" id="name" name="name" placeholder="Enter name" value="${principal.member.name}">
		</div>
		<div class="form-group">
		<label for="userTel" >예약자 연락처 :</label>
		<input type="text" class="form-control" id="phone" name="phone" placeholder="Enter phone" value="${principal.member.phone}">
		</div>	
	</div>
	<%-- <hr>
	<div class="container mt-5 bg-light">
	<h4>결제 정보</h4>
		<div class="form-group">
		<label for="price">결제금액 : </label>
		<input type="text" class="form-control" id="price" name="price" placeholder="Enter price" value="${bookList.price}">
		</div>
		<div class="form-group">
		<label for="payment" >결제수단 :</label>
		<input type="text" class="form-control" id="payment" name="payment" placeholder="Enter payment">
		</div>	
	</div> --%>
	
	<div class="container" >
	<div class="form-group text-right pt-5">
	<button type="button" class="btn btn-secondary" onclick="reservCheck()" id="reserveBtn">예약하기</button>
	</div>
	</div>
</form>
</div>
<script>
let openWin;
	function show(){
	 	window.open("/full-calendar/calendar/${camp_id}","calendar","width=700,height=600,top10,left=10")
	}
</script>
<%@ include file="../includes/footer.jsp"%>

