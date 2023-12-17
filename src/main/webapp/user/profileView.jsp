<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>사용자 프로필 조회(모든 사람들 확인 가능)</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 	<!-- Favicon-->
        <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/img/somsom.png'/>" />

<link href="<c:url value='/css/profileView.css'/>" rel="stylesheet">


</head>
<body>
<div style="width: 30%; float: left;">
 <%@include file="/sidebar.jsp" %>    
</div>
<!-- 사이드 바 옆에 프로필 편집 페이지 -->

<div style="width: 70%; float: center;" class="container-xl px-4 mt-4">
    <!-- Account page navigation(마이페이지 메뉴)-->
    
    <hr class="mt-0 mb-4">
    <div class="row">
        <div class="col-xl-4">
            <!-- 프로필 사진-->
            <div class="card mb-4 mb-xl-0">
                <div class="card-header">마이페이지</div>
                <div class="card-body text-center">
                    <img class="img-account-profile rounded-circle mb-2" src="${pageContext.request.contextPath}/img/somsom.png" alt="${pageContext.request.contextPath}/img/somsom.png">

   
                 <!-- 프로필 소개테이블 -->
                 
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
                            ${user.userId}</a>    
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
                            ${user.nickname}</a>     
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
                            ${user.email}</a>  
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
                            ${user.joinDate}</a>
                        </td>
                    </tr>
                      
                </tbody>
            </table>
        </div>


       </div>     
      </div>
     </div>
      
		<!-- 리뷰 보여주기 -->
   
	<div class="col-md-8">

    <div class="card">
        <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs" id="myTab">
                <li class="nav-item">
                    <a href="#reviewWritten" class="nav-link" data-bs-toggle="tab">작성된 리뷰</a>
                </li>
                <li class="nav-item">
                    <a href="#myReview" class="nav-link" data-bs-toggle="tab"> ${user.userId}가 작성한 리뷰</a>
                </li>
            </ul>
        </div>
        <div class="card-body">
            <div class="tab-content">
            
       <!-- 나와 거래한 사용자가 작성한 리뷰 리스트 --> 
       
       <div class="tab-pane fade" id="reviewWritten">
            <h6 class="card-title"> ${user.userId}와 거래한 사용자가 작성한 리뷰입니다.</h6>
                
    <div class="my-3 p-3 bg-white rounded box-shadow">
    <h6 class="border-bottom border-gray pb-2 mb-0">Recent updates</h6>
    	<c:forEach items="${reviewList }" var="reviewList">
    		<div class="media text-muted pt-3">
      			<p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
        			<strong class="d-block text-gray-dark">${reviewList.reviewWriterId } → ${user.userId}</strong>
        			<small class="d-block text-gray">${reviewList.reviewWriteDate}</small>
        			<a>${reviewList.reviewContent }</a>
        			      			
        		</p>
    		</div>
    </c:forEach>
    </div>
    </div>
           
    
    
    <!-- 내가 작성한 리뷰 리스트 -->
    
    <div class="tab-pane fade" id="myReview">
       <h6 class="card-title"> ${user.userId}가 작성한 리뷰입니다.</h6>
                    
    <div class="my-3 p-3 bg-white rounded box-shadow">
    <h6 class="border-bottom border-gray pb-2 mb-0">Recent updates</h6>
    	<c:forEach items="${reviewList2 }" var="reviewList2">
    		<div class="media text-muted pt-3">
      			<p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
        			<strong class="d-block text-gray-dark">나 → ${reviewList2.postWriterId }</strong>
        			<small class="d-block text-gray">${reviewList2.reviewWriteDate}</small>
        			<a>${reviewList2.reviewContent }</a>
      			</p>
    		</div>
    </c:forEach>
    </div>
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