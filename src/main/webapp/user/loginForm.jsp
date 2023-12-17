<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 	<!-- Favicon-->
        <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/img/somsom.png'/>" />

<link href="<c:url value='/css/login.css'/>" rel="stylesheet">

<script>
function login() {
	if (form.userId.value == "") {
		alert("사용자 ID를 입력하십시오.");
		form.userId.focus();
		return false;
	} 
	if (form.password.value == "") {
		alert("비밀번호를 입력하십시오.");
		form.password.focus();
		return false;
	}		
	form.submit();
}
</script>


</head>
<body>
<div style="width: 30%; float: left;">
 <%@include file="/sidebar.jsp" %>    
</div>
<div style="width: 70%; float: center;" class="container-xl px-4 mt-4">
    		<div class="row h-100">
				<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
					<div class="d-table-cell align-middle">

						<div class="text-center mt-4">
							
							<h1 class="h2">로그인</h1>
							<p class="lead">
								<h6>솜솜아부탁해를 이용하기 위한 로그인 페이지입니다.<br>
								만약 계정이 없으시다면 회원가입을 눌러주세요.</h6>
							</p>
						</div>

	<!-- 로그인이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
	<div class="col-lg-12">
		<c:if test="${loginFailed}">
			<h6 class="text-danger"><c:out value="${exception.getMessage()}"/></h6>
		</c:if>
	</div>
		
		<div class="card">
			<div class="card-body">
				<div class="m-sm-4">
					<form name="form" method="POST" action="<c:url value='/user/login' />">
						<div class="form-group">
							<label for="userId">사용자 ID</label>
							<input class="form-control form-control-lg" type="text" name="userId" placeholder="사용자 ID를 입력하세요.">
						</div>
						<br>
						<div class="form-group">
							<label for="password">비밀번호</label>
							<input class="form-control form-control-lg" type="password" name="password" placeholder="비밀번호를 입력하세요.">
						</div>
						<div class="text-center mt-3">
							<input type="button" class="btn btn-lg btn-primary" value="로그인" onClick="login()">
							<a href="<c:url value='/user/registerForm.jsp' />" class="btn btn-link">회원가입 </a>
								
							
						</div>
						<h6 class="text-center mt-4">(관리자 로그인: admin/admin)</h6>
					</form>
					</div>
				</div>
				</div>

			</div>
			</div>
		</div>
	</div>
	
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


</body>
</html>