<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../includes/header.jsp"%>
<%@ include file="/WEB-INF/views/user/menuBar.jsp"%>
<div class="container">
	<div class="listcontent">
	<h3 style="color:#ffc107; margin-top:50px;">회원리스트(${count })</h3>
	<table class="table table-hover mt-4 mb-3">
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>생일</th>
				<th>핸드폰번호</th>
				<th>이메일</th>
				<th>권한</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${mlist.content }" var="mList" varStatus="st">
				<tr>
				<td>${mList.id }</td>
				<td>${mList.username }</td>
				<td>${mList.name }</td>
				<td>${mList.birth }</td>
				<td>${mList.phone }</td>
				<td>${mList.email }</td>
				<td>${mList.role }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="d-flex justify-content-between mt-5 mr-auto">
		<ul class="pagination">
			<c:if test="${mlist.first==false }">
			<li class="page-item"><a class="page-link" href="?page=${mlist.number-1 }&field=${param.field}&word=${param.word}">이전</a></li>
			</c:if>
			<c:if test="${mlist.last==false }">
			<li class="page-item"><a class="page-link" href="?page=${mlist.number+1 }&field=${param.field}&word=${param.word}">다음</a></li>
			</c:if>
		</ul>
	</div>
	<div>
		<form class="form-inline" action="/memberList" method="get">
			<select name="field" class="form-control mr-sm-1" >
				<option value="username">아이디</option>
				<option value="phone">핸드폰</option>
			</select>
			<input type="text" name="word" class="form-control" placeholder="검색하실 아이디나 핸드폰 번호를 입력하세요" style="width:300px; height:38px; font-size:12px;">
			<button class="btn btn-secondary">검색</button>
		</form>
	</div>
</div>
</div>

<%@ include file="../includes/footer.jsp"%> 