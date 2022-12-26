<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="/WEB-INF/views/user/menuBar.jsp"%>
<div class="container">
   <div class="listcontent">
   <h3 style="color:#ffc107; margin-top:50px;">예약목록(${bcount})</h3>
   <table class="table table-hover mt-4 mb-3">
      <thead>
         <tr>
            <th>번호</th>
            <th>캠핑장 이름</th>
            <th>주소</th>
            <th>체크인</th>
            <th>체크아웃</th>
            <th>결제금액</th>
            <th colspan="2">상태</th>
            <c:if test="${booking.status == 0 }">
            <th>예약취소</th>
            </c:if>
         </tr>
      </thead>
      <tbody>
         <c:forEach items="${blists}" var="booking">
            <tr>
               <td>${booking.bookNum}</td>
               <td><a href="/detail/${booking.camping.camp_id}">${booking.camping.camp_title }</a></td>
               <td>${booking.camping.address }</td>
               <td>${booking.check_in}</td>
               <td>${booking.check_out}</td>
               <td>${booking.dayCnt * booking.camping.price}</td>
               <c:if test="${booking.status == 0}">
                  <td>예약 대기</td>
               </c:if>
               <c:if test="${booking.status == 1}">
                  <td colspan="2">예약 확정</td>
               </c:if>
               <c:if test="${booking.status == 2}">
                  <td colspan="2">예약 취소</td>
               </c:if>
               <c:if test="${booking.status == 0 }">
                  <td><button type="button" class="btn btn-info" onclick="bookDelete(${booking.bookNum}, ${booking.status })">취소</button></td>
               </c:if>
            </tr>
         </c:forEach>
      </tbody>
   </table>
   </div>
   </div>
   
<script>
   function bookDelete(bookNum, status){
      if(!confirm('정말 예약을 취소할까요?')) return;
      
      $.ajax({
         type:'put',
         url:'/booking/statusCancle/'+bookNum,
         data:{"status": status}
      })
      .done(function(resp){
         alert('예약이 취소되었습니다.')
         location.href="/booking/bookList/${principal.member.id}"
      })
      .fail(function(e){
         alert('취소 실패')
      })
   }   
</script>
<%@ include file="../includes/footer.jsp"%>