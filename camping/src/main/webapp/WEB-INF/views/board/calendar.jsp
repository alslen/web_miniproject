<%@page import="com.example.camping.model.Booking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script src='/fullcalendar-6.0.1/dist/index.global.js'></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function() {
	$(function () {
        var request = $.ajax({
        	url: "/full-calendar/camp_calendar/${camp_id}", 
            method: "GET",
            dataType: "json"
        });
        request.done(function (data) {
       	 console.log(data); // log 로 데이터 찍어주기.
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
    locale : "ko",	
      selectable: true,
      businessHours: true,
      dayMaxEvents: true, // allow "more" link when too many events
      
      events: data
    	     });

    	     calendar.render();
        });
    });
});

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }
  .add-button {
    top: 1px;
    right: 230px;
    background: #2C3E50;
    border: 0;
    color: white;
    height: 35px;
    border-radius: 3px;
    width: 157px;
}

</style>
</head>
<body>
<sec:authorize access="isAuthenticated">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
  <div id='calendar'>
  </div>
</body>
<sec:authorize access="isAuthenticated()">

</sec:authorize>
</html>
