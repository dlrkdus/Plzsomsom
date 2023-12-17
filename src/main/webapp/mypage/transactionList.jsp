<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>거래내역</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 	<!-- Favicon-->
<link href="${pageContext.request.contextPath}/img/somsom.png" rel="shortcut icon" type="image/x-icon" />

<link href="${pageContext.request.contextPath}/css/profile.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/transactionList.css" rel="stylesheet">

</head>
<body>
<div style="width: 25%; float: left;">
<%@include file="/sidebar.jsp" %>
</div>
<!-- 사이드 바 옆에 프로필 편집 페이지 -->

<div style="width: 75%; float: center; padding: 30px 60px 20px 20px;" class="container-xl px-4 mt-4">
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

      
        <!-- 마이페이지의 사이드바 오른쪽 주요내용 -->
        
        
        <div class="col-xl-8">
         <!-- 거래 내역-->
    	<div class="card mb-4">
        	<div class="card-header">거래이력<div>
        	<div class="card-body p-0">
            	<div class="table-responsive table-transaction-history">
                	<table class="table mb-0">
                    	<thead>
                        	<tr>
                            <th class="border-gray-200" scope="col">게시글번호</th>
                            <th class="border-gray-200" scope="col">제목</th>
							<th class="border-gray-200" scope="col">거래자</th> 
                            <th class="border-gray-200" scope="col">리뷰작성</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${transList }" var="transList">
                        <tr>
                            <td><a href="<c:url value='/post/detail'>
						   <c:param name='postNum' value='${transList.postNum }'/>
				 		 </c:url>">${transList.postNum }</a></td>
                            <td>${transList.title }</td>
                            <td>${transList.postWriterId }</td>
                            <td><a href="<c:url value='/mypage/review/form'>
						   <c:param name='postNum' value='${transList.postNum }'/>
						   <c:param name='postWriterId' value='${transList.postWriterId}'/>
				 		 </c:url>">리뷰작성</a></td>
                        </tr>
                      </c:forEach>
                    </tbody>
                </table>
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