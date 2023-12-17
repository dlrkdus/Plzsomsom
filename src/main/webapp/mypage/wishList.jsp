<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>찜 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Favicon-->
        <link href="<c:url value='/img/somsom.png'/>" rel="shortcut icon" type="image/x-icon" />
        
<link href="<c:url value='/css/profile.css'/>" rel="stylesheet">
<link href="<c:url value='/css/wishList.css'/>" rel="stylesheet">

<script>
function itemRemove() {
   return confirm("정말 삭제하시겠습니까?");      
}
</script>


</head>
<body>
<div style="width: 25%; float: left;">
 <%@include file="/sidebar.jsp" %>    
</div>
<!-- 사이드 바 옆에 프로필 편집 페이지 -->

<div style="width: 75%; float: center;" class="container-xl px-4 mt-4">
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
        <div class="card mb-4">
             <div class="card-header">찜 목록</div>
             <div class="card-body text-center">


        <!-- Shopping Cart-->
    <div class="table-responsive shopping-cart">
        <table class="table">
            <thead>
                <tr>
                    <th>상품</th>
                    <th>가격</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${wishList}" var="wishList">
            <c:if test="${wishList.count gt 0 }">
                <tr>
                    <td>
                  		<a href="<c:url value='/post/detail'>
                        <c:param name='postNum' value='${wishList.postNum}'/>
                        </c:url>">${wishList.title}</a>
                    </td>
                    <td class="text-center text-lg text-medium">
                    	${wishList.price}
                    </td>
                    <td>
                        <a class="btn btn-warning" 
                        href="<c:url value='/wishItem/delete'>
                        <c:param name='wishNum' value='${wishList.wishNum}'/>
                        </c:url>" onclick="return itemRemove();">삭제</a>   
                    </td>
                </tr>
            </c:if>
            </c:forEach>
            </tbody>
        </table>
    </div>      
       
   <!-- 수정 또는 삭제가  실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
   <c:if test="${updateFailed || deleteFailed}">
      <h6 class="text-danger"><c:out value="${exception.getMessage()}"/></h6>
    </c:if>  
   </div>
     
     </div>

        </div>
    </div>
</div>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>