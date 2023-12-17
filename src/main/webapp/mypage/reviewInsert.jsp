<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>리뷰 작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 	<!-- Favicon-->
        <link href="${pageContext.request.contextPath}/img/somsom.png" rel="shortcut icon" type="image/x-icon" />
        
<link href="${pageContext.request.contextPath}/css/profile.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/review.css" rel="stylesheet">

<!-- 리뷰작성 취소버튼 누르고 메인 페이지로 이동하는 js -->
<script type="text/javascript">              <!-- 스크립트 선언 -->
		function gotoPage() {
			document.location.href="<c:url value='/mypage/myreview'/>"; <!-- 다른페이지로 이동하는 함수 -->
		}                                      <!-- body 사이에 있으면 도큐먼트 생략 가능 -->
</script>


</head>
<body>
<div style="width: 25%; float: left;">
<%@include file="/sidebar.jsp" %>
</div>
<!-- 사이드 바 옆에 프로필 편집 페이지 -->

<div style="width: 75%; float: right; padding: 30px 60px 20px 20px;" class="container-xl px-4 mt-4">
    <!-- Account page navigation(마이페이지 메뉴)-->
    
    <hr class="mt-0 mb-4">
    <div class="row">
        <div class="col-xl-4">
            <!-- 프로필 사진이랑 마이페이지 메뉴-->
            <div class="card mb-4 mb-xl-0">
                <div class="card-header">마이페이지</div>
                <div class="card-body text-center">
                    <!-- Profile picture image-->
                    <img class="img-account-profile rounded-circle mb-2" src="<c:url value='/img/somsom.png'/>" alt="<c:url value='/img/somsom.png'/>">
                    <!-- Profile picture help block-->
                    <div class="small font-italic text-muted mb-4">${sessionScope.userId }님, 안녕하세요.</div>
                    <!-- Profile picture upload button
                    <div class="input-group mb-3">
  						<input type="file" class="form-control" id="inputProfileImage">
  						<button class="submit" for="inputProfileImage">Upload</button>
					</div>-->
   
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
	
		<!-- 리뷰 작성 form -->
   
        <div class="col-xl-8">
            <!-- Account details card-->
            <div class="card mb-4">
                <div class="card-header">리뷰 작성</div>
                <div class="card-body">
                    <form name="form" method="POST" action="<c:url value='/mypage/review/insert' />">
						<input type="hidden" name="postNum" value="${param.postNum }">
						<input type="hidden" name="postWriterId" value="${param.postWriterId }">
                        <!-- 거래 게시글 표시 -->
                        <div class="mb-3 row">
    						<label for="endTransactionNum" class="col-sm-2 col-form-label">거래자</label>
    						<div class="col-sm-10">
      							<h5>${param.postWriterId }</h5>
   							</div>
  						</div>
  						<!-- 사진첨부 
                        <div class="mb-3">
  							<label for="formFileMultiple" class="form-label">사진 첨부</label>
  							<input class="form-control" type="file" name="formFileMultiple" value="${filename}" src="<c:url value='/upload/${filename}'/>">
						</div>-->
                        <!-- 리뷰 내용 -->
                        <div class="mb-3">
  							<label for="ReviewContent" class="form-label">리뷰 내용</label>
  							<textarea class="form-control" name="reviewContent" placeholder="100자 이내로 입력하세요" rows="4"></textarea>
  							<!-- <input class="form-control" id="inputReviewContent" type="text" placeholder="100자 이내로 입력하세요" value="${review.reviewContent}">  -->
						</div>
                        
                        <!-- Save changes button-->
                        <button class="btn btn-primary" type="submit">작성</button>
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