<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>프로필 편집</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 	<!-- Favicon-->
        <link href="${pageContext.request.contextPath}/img/somsom.png" rel="shortcut icon" type="image/x-icon" />
        
		<link href="${pageContext.request.contextPath}/css/profile.cs" rel="stylesheet">

<!-- 편집 취소버튼 누르고 프로필 페이지로 이동하는 js -->
<script type="text/javascript">              <!-- 스크립트 선언 -->
		function gotoPage() {
			document.location.href="<c:url value='/mypage/profile' />"; <!-- 다른페이지로 이동하는 함수 -->
		}       <!-- body 사이에 있으면 도큐먼트 생략 가능 -->
		
		
		function userModify() {
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
		
		
</script>



</head>
<body>
<div style="width: 25%; float: left;">
<%@include file="/sidebar.jsp" %>
</div>
<!-- 사이드 바 옆에 프로필 편집 페이지 -->

<div style="width: 75%; padding: 30px 60px 20px 20px; float: center;" class="container-xl px-4 mt-4">
    <!-- Account page navigation(마이페이지 메뉴)-->
    
    <hr class="mt-0 mb-4">
    <div class="row">
        <div class="col-xl-4">
            <!-- 프로필 사진이랑 마이페이지 메뉴-->
            <div class="card mb-4 mb-xl-0">
                <div class="card-header">마이페이지</div>
                <div class="card-body text-center">
                    <!-- Profile picture image-->
                    <img class="img-account-profile rounded-circle mb-2" src="${pageContext.request.contextPath}/img/somsom.png" alt="${pageContext.request.contextPath}/img/somsom.png">
                    <!-- Profile picture help block-->
                    <!-- Profile picture help block-->
                    <div class="small font-italic text-muted mb-4">${sessionScope.userId }님, 안녕하세요.</div>
                    
   
                 <!-- 마이페이지 사이드바메뉴 -->
                 
	<div class="list-group active">
 		<a href="<c:url value='/mypage/profile' />" class="list-group-item list-group-item-action">프로필</a>
  		<a href="<c:url value='/wishItem/list' />" class="list-group-item list-group-item-action">찜 목록</a>
  		<a href="<c:url value='/transaction/list'/>" class="list-group-item list-group-item-action">거래이력</a>
  		<a href="<c:url value='/mypage/myreview'/>" class="list-group-item list-group-item-action">리뷰</a>
	</div>
       </div>     
      </div>
     </div>
      
        
        
        <div class="col-xl-8">
            <!-- Account details card-->
            <div class="card mb-4">
                <div class="card-header">프로필 편집</div>
                <div class="card-body">
                    <form name="form" method="POST" action="<c:url value='/user/update' />">
                        <!-- Form Group (username)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="name">이름</label>
                            <input class="form-control" name="name" type="text" value="${user.name}">
                        </div>
                        <!-- Form Group (usernickname)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="nickname">닉네임</label>
                            <input class="form-control" name="nickname" type="text" value="${user.nickname}">
                        </div>
                        <!-- Form Group (userId)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="userId">아이디</label>
                            <input class="form-control" name="userId" type="text" value="${user.userId}">
                        </div>
                        <!-- Form Group (userPassword)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="password">비밀번호</label>
                            <input class="form-control" name="password" type="password" value="${user.password}">
                        </div>
                        <!-- Form Group (userPasswordRetype)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="passwordRetype">비밀번호 확인</label>
                            <input class="form-control" name="passwordRetype" type="password" value="${user.password}">
                        </div>
                        <!-- Form Group (userEmail)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="email">이메일</label>
                            <input class="form-control" name="email" type="text" value="${user.email}">
                        </div>
                        <!-- Form Group (userPhone)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="phone">전화번호</label>
                            <input class="form-control" name="phone" type="text" value="${user.phone}">
                        </div>
                        
                        <!-- Save changes button-->
                        <button class="btn btn-primary" type="submit" onClick="userModify()">수정</button>
                        <button class="btn btn-primary" type="button" onclick="gotoPage()">취소</button>
                        
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>