<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>솜솜아 부탁해</title>

<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sidebars/">
<link href="${pageContext.request.contextPath}/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/sidebars.css" rel="stylesheet">    
</head>
<body>
<div style="width: 25%; float: left;">
<%@include file="/sidebar.jsp" %>
</div>
  <div style=" width: 75%; float: right; padding: 30px 60px 20px 20px;">
<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  			<ol class="breadcrumb">
  			<!-- 상단에 어떤 카테고리인지 알려줌 ex) Home > 강의자료 > 중고책 -->
    			<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/board/main.jsp">Home</a></li>
    			<c:choose>
    			<c:when test="${pdNum eq 1}">
    			    <li class="breadcrumb-item active" aria-current="page">강의자료</li>
    			    <li class="breadcrumb-item active" aria-current="page">중고책</li>
    			</c:when>
    			<c:when test="${pdNum eq 2}">
    			    <li class="breadcrumb-item active" aria-current="page">강의자료</li>
    			    <li class="breadcrumb-item active" aria-current="page">필기본</li>
    			</c:when>
    			<c:when test="${pdNum eq 3}">
    			    <li class="breadcrumb-item active" aria-current="page">강의자료</li>
    			    <li class="breadcrumb-item active" aria-current="page">기타</li>
    			</c:when>
    			<c:when test="${pdNum eq 4}">
    			    <li class="breadcrumb-item active" aria-current="page">심부름</li>
    			    <li class="breadcrumb-item active" aria-current="page">대면</li>
    			</c:when>
    			<c:when test="${pdNum eq 5}">
    			    <li class="breadcrumb-item active" aria-current="page">심부름</li>
    			    <li class="breadcrumb-item active" aria-current="page">비대면</li>
    			</c:when>
    			<c:when test="${pdNum eq 6}">
    			    <li class="breadcrumb-item active" aria-current="page">나눔</li>
    			    <li class="breadcrumb-item active" aria-current="page">대면</li>
    			</c:when>
    			<c:when test="${pdNum eq 7}">
    			    <li class="breadcrumb-item active" aria-current="page">나눔</li>
    			    <li class="breadcrumb-item active" aria-current="page">비대면</li>
    			</c:when>
    			<c:when test="${pdNum eq 8}">
    			    <li class="breadcrumb-item active" aria-current="page">요청</li>
    			    <li class="breadcrumb-item active" aria-current="page">강의자료</li>
    			</c:when>
    			<c:when test="${pdNum eq 9}">
    			    <li class="breadcrumb-item active" aria-current="page">요청</li>
    			    <li class="breadcrumb-item active" aria-current="page">심부름</li>
    			</c:when>
    			<c:when test="${pdNum eq 10}">
    			    <li class="breadcrumb-item active" aria-current="page">요청</li>
    			    <li class="breadcrumb-item active" aria-current="page">나눔</li>
    			</c:when>
    			</c:choose>

  			</ol>
		</nav>

<div class="row row-cols-1 row-cols-md-3 g-4">
	
	
<input type="hidden" name="pdNum" value=${pdNum }"/>
<c:forEach var="post" items="${postList }">
<c:if test="${post.count gt 0 }">
  <div class="col">
    <div class="card h-100">
      <img src="<c:url value='/upload/${post.photo}'/>" class="card-img-top" alt="" onerror="">
      <div class="card-body">
        <h6 style="font-weight: bold;" class="card-title">${post.title }</h6>
        <p class="card-text">${post.postWriterId }</p>
        <a href="<c:url value='/post/detail'>
						   <c:param name='postNum' value='${post.postNum}'/>
				 		 </c:url>" class="btn btn-outline-danger">자세히보기</a>
      </div>
    </div>
  </div>	
  </c:if>
  </c:forEach>
  
  
</div>


<br>

<div class="button_box">
<a href="<c:url value='/post/insert/form' />" type="button" class="btn btn-danger">글쓰기</a>
</div> 
</div>

   <script src="${pageContext.request.contextPath}/assets/dist/js/bootstrap.bundle.min.js"></script>

     <script src="${pageContext.request.contextPath}/js/sidebars.js"></script>
</body>
</html>

