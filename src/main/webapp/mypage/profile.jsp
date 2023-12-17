<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>프로필</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 	<!-- Favicon-->
        <link href="${pageContext.request.contextPath}/img/somsom.png" rel="shortcut icon" type="image/x-icon" />

	<link href="${pageContext.request.contextPath}/css/profile.css" rel="stylesheet"/>

<!-- 프로필 편집 페이지로 이동하는 js -->
<script type="text/javascript">              <!-- 스크립트 선언 -->
		function gotoPage() {
			document.location.href="<c:url value='/user/update'> 
			<c:param name='userId' value='${user.userId}'/>
			 	  </c:url>"; <!-- 다른페이지로 이동하는 함수 -->
		}                                      <!--body 사이에 있으면 도큐먼트 생략 가능 -->
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
                    <img class="img-account-profile rounded-circle mb-2" src="${pageContext.request.contextPath}/img/somsom.png" alt="">
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
                <div class="card-header">프로필</div>
                <div class="card-body">
        
            
            <div class="table-responsive">
            <table class="table table-user-information">
                <tbody>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-asterisk text-primary"></span>
                                ID                                             
                            </strong>
                        </td>
                        <td class="text-primary">
                            ${user.userId}  
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-asterisk text-primary"></span>
                                NAME                                             
                            </strong>
                        </td>
                        <td class="text-primary">
                            ${user.name}  
                        </td>
                    </tr>
                    <tr>    
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-user  text-primary"></span>    
                                NICKNAME                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            ${user.nickname}   
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-cloud text-primary"></span>  
                                EMAIL                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            ${user.email}
                        </td>
                    </tr>
					<tr>    
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-user  text-primary"></span>    
                                PHONE                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            ${user.phone}   
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-bookmark text-primary"></span> 
                                JOINDATE                                              
                            </strong>
                        </td>
                        <td class="text-primary">
                            ${user.joinDate}
                        </td>
                    </tr>    
                </tbody>
            </table>
            
            <!-- 하단의 편집버튼 -->
            <button class="btn btn-primary" type="button" onClick="gotoPage()">편집</button>

            </div>
        </div>
        
            </div>
        </div>
    </div>
</div>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>