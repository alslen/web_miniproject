<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration:none;}
 a:active : { color:black; text-decoration:none;}
</style>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Camping GO</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/css/styles.css" rel="stylesheet" />
    <!-- Icons font CSS-->
    <link href="/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">        
            <!-- Vendor CSS-->
    <link href="/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- Main CSS-->
    <link href="/css/main.css" rel="stylesheet" media="all">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    </head>
    <body>
   <sec:authorize access="isAuthenticated">
		<sec:authentication property="principal" var="principal"/>
	</sec:authorize>
        <!-- Navigation-->
        <!------------------로그인 전 화면---------------------->
        
		<!--
		<div class="container" style="text-align:center;" >
		<a href="/" style="display:block;"><img src="/img/logo2.jpg" alt="My Image" style="margin-right:10px; margin-bottom:20px; height:150; width:150;"></a>
		<a class="navbar-brand" href="/" style="font-weight:bold; font-size:30px; color:#ffa806">CAMPING GO</a>
		</div> 
		-->
		<!-- logo image & title -->
		<div class="container" style="margin-top:0; padding-top:0;">
		<div class="logo">
			<a href="/" class="logoimg"><img src="/img/logo2.jpg" alt="My Image" style="margin-right:10px; height:50; width:50;"></a>
			<a class="navbar-brand" href="/">Camping Go</a>
		</div>  
		
		<!--  main menu bar  -->
		 <nav class="navbar">
            <div class="container" style="margin-top:0; padding-top:0;">
					<div id="grid_header">
						<div class="header_top" style="text-align:right;" >
						<sec:authorize access="isAnonymous">
							<ul class="top_member_box">
								<li><a href="/login">로그인</a></li>
								<li><a href="/join">회원가입</a></li>
							</ul>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
							<ul class="top_member_box">
								<li><a href="/join">회원가입</a></li>
								<li><a href="/update/${principal.member.id }">마이페이지</a></li>
								<li><a href="/logout">로그아웃(<sec:authentication property="principal.member.username" />)</a></li>
							</ul>	
							</sec:authorize>
						</div>
					</div>
         </div>
       </nav>
         </div>        
		            
                
	      			 
                            <!------------------로그인 후 화면---------------------->
   				
                
                     <!-- 관리자만 볼 수 있는 메뉴 -->
                 <!-- <sec:authorize access="isAuthenticated()">   
                 <c:if test="${principal.member.role == 'ROLE_ADMIN' }">
                     <ul class="navbar-nav "> 
                     	<li class="nav-item dropdown ">
                     		<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" >관리자</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="">회원목록</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="/insert">캠핑장 등록</a></li>
                                <li><a class="dropdown-item" href="/">예약 목록</a></li>
                                <li><a class="dropdown-item" href="/memberList">회원 목록</a></li>
                            </ul>
                     	</li>
                     </ul>
                     </c:if>
                </sec:authorize>
              -->
             
       <!-- Header--> 
        <header class="py-5">
            	<div class="wrapper wrapper--w1070">
                <div class="card-body" style="display:flex; justify-content:center;">
                    <form class="form" action="/search" method="post">
                        <div class="input-group input--large">
                            <label class="label">Address</label>
                            <input class="input--style-1" type="text" placeholder="Address" name="address" id="address">
                        </div>
                        <div class="input-group input--large">
                            <label class="label">CampTitle</label>
                            <input class="input--style-1" type="text" placeholder="CampTitle" name="camp_title" id="camp_title">
                        </div>                        
                        <button class="btn-submit" type="submit" id="sbtn" style="height:97%">search</button>
                    </form>
                </div>
            </div>
        </header>
        
    <!-- Jquery JS-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="/vendor/select2/select2.min.js"></script>
    <script src="/vendor/jquery-validate/jquery.validate.min.js"></script>
    <script src="/vendor/bootstrap-wizard/bootstrap.min.js"></script>
    <script src="/vendor/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <script src="/vendor/datepicker/moment.min.js"></script>
    <script src="/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="/js/global.js"></script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/js/scripts.js"></script>              