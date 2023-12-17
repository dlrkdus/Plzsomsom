<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 	<!-- Favicon-->
        <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/img/somsom.png'/>" />

<link href="<c:url value='/css/login.css'/>" rel="stylesheet">

<script>
function userCreate() {
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
	if (form.password.value != form.password2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		form.name.focus();
		return false;
	}
	if (form.name.value == "") {
		alert("이름을 입력하십시오.");
		form.name.focus();
		return false;
	}
	var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(emailExp.test(form.email.value)==false) {
		alert("이메일 형식이 올바르지 않습니다.");
		form.email.focus();
		return false;
	}
	var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
	if(phoneExp.test(form.phone.value)==false) {
		alert("전화번호 형식이 올바르지 않습니다.");
		form.phone.focus();
		return false;
	}
	form.submit();
}

function userList(targetUri) {
	form.action = targetUri;
	form.submit();
}

function emailCheck(email){
	//유효성 검사
	if(!form.email.value){
		alert("이메일 형식이 올바르지 않습니다.");
		form.email.focus();
		return;
	}
	var url="emailCheck.jsp?email=" + email;
	open(url, "emailwindow", "statusbar=no, scrollbar=no, menubar=no, width=400, height=200");
}
</script>


</head>
<body>
<div style="width: 30%; float: left;">
<jsp:include page  = "/sidebar.jsp"/>    
</div>
<!-- 회원가입 form -->
<div style="width: 70%; float: center;" class="container h-100">
    <div class="row h-100">
		<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
			<div class="d-table-cell align-middle">

			<div class="text-center mt-4">
							
				<h1 class="h2">회원가입</h1>
					<p class="lead">
						솜솜아부탁해를 이용하기 위한 회원가입 페이지입니다.<br>
						취소를 누르시면 메인페이지로 돌아갑니다.
					</p>
				</div>
				
				
	<!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
	<div class="row col-lg-12">
		<c:if test="${registerFailed}">
			<h6 class="text-danger"><c:out value="${exception.getMessage()}"/></h6>
		</c:if>
	</div>	  
				

	<div class="card">
	<div class="card-body">
		<div class="m-sm-4">

	<form name="form" method="POST" action="<c:url value='/user/register'/>">
		<div class="form-group">
			<label for="userId">사용자 ID</label>
			<input class="form-control form-control-lg" type="text" name="userId" placeholder="사용자 ID를 입력하세요.">
		</div><br>
		<div class="form-group">
			<label for="password">비밀번호</label>
			<input class="form-control form-control-lg" type="password" name="password" placeholder="비밀번호를 입력하세요.">
		</div><br>
		<div class="form-group">
			<label for="passwordRetype">비밀번호 재확인</label>
			<input class="form-control form-control-lg" type="password" name="passwordRetype" placeholder="비밀번호를 다시 입력하세요.">
		</div><br>
		<div class="form-group">
			<label for="name">이름</label>
			<input class="form-control form-control-lg" type="text" name="name" placeholder="이름을 입력하세요."
				<c:if test="${registerFailed}">value="${user.name}"</c:if> >
		</div><br>
		<div class="form-group">
			<label for="email">학교 웹 메일</label>
			<input class="form-control form-control-lg" type="text" name="email" placeholder="학교 웹 메일을 입력해주세요."
				<c:if test="${registerFailed}">value="${user.email}"</c:if> >
				<input type="button" name="emailconfirm_btn" class="btn btn-primary btn-sm" value="인증 요청" onClick="emailCheck(form.email.value)">
		</div><br>
		<div class="form-group">
			<label for="name">닉네임</label>
			<input class="form-control form-control-lg" type="text" name="nickname" placeholder="닉네임을 입력하세요.">
		</div><br>
		<div class="form-group">
			<label for="phone">전화번호</label>
			<input class="form-control form-control-lg" type="text" name="phone" placeholder="전화번호를 입력하세요."
				<c:if test="${registerFailed}">value="${user.phone}"</c:if> > 
		</div><br>  

   		<div class="text-center mt-3">
			<input type="submit" id="regist" class="btn btn-lg btn-primary" value="가입" onClick="userCreate()" disabled="disabled">
			<a href="<c:url value='/user/loginForm.jsp' />" class="btn btn-link">취소 </a>
							
		</div>
   
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
