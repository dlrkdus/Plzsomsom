<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>솜솜아 부탁해</title>

<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sidebars/">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">   
</head>
<body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<div style="width: 25%; float: left;">
<%@include file="/sidebar.jsp" %>
</div>

  <div style="width: 75%; height: 100%; float: right;">
   <div style="margin: 0 auto; width: 80%; padding-top: 50px;">
      <div style="margin: 0 auto; width: 70%;">
      <br>
         <form class="d-flex" role="search" action="<c:url value='/post/search' />">
          <input class="form-control me-2" name="keyword" type="search" placeholder="" aria-label="Search">
         <button type="submit" class="btn btn-danger">Search</button>
         </form>
       </div>
<br><br>
<div class="row row-cols-1 row-cols-md-3 g-4">
   <c:forEach var="searchList" items="${searchList }">
   <div class="col">
      <div class="card h-100">
         <img src="<c:url value='/upload/${searchList.photo}'/>" class="card-img-top" alt="" onerror="">
         <div class="card-body">
            <h5 style="font-weight: bold;" class="card-title">${searchList.title }</h5>
            <p class="card-text">${searchList.postWriterId }</p>
            <a href="<c:url value='/post/detail'>
                        <c:param name='postNum' value='${searchList.postNum}'/>
                        </c:url>" class="btn btn-outline-danger">자세히보기</a>
         </div>
      </div>
   </div>
   </c:forEach>
</div>

     </div>
  </div>
   <script src="${pageContext.request.contextPath}/../assets/dist/js/bootstrap.bundle.min.js"></script>

     <script src="${pageContext.request.contextPath}/js/sidebars.js"></script>
</body>
</html>