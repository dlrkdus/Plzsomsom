<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<title>사용자 리스트 </title>
<!-- 사용자 id, pw가 맞다면 admin구분 없이 삭제할 수 있음. -->
<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 	<!-- Favicon-->
        <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/img/somsom.png'/>" />


<script>
function userRemove() {
	return confirm("정말 삭제하시겠습니까?");		
}
</script>
</head>
<body>
<div style="width: 30%; float: left;">
 <%@include file="/sidebar.jsp" %>    
</div>
<div style="width: 70%; float: center;" class="container-xl px-4 mt-4">
	<br>
	<div class="row">
	<div class="table-responsive">
	<h4>사용자 정보 조회</h4>
	<table class="table table-hover" style="margin-lift: auto; margin-right:auto;">
	
	<thead>
      	<tr>
		  <th>사용자 ID</th>
		  <th>이름</th>
		  <th>이메일</th>
		  <th>가입일자</th>
		  <th>삭제</th>
		</tr>
      </thead>
      <tbody> 

 			       
		<c:forEach var="user" items="${userList}">      
		<tr> 
		 			  	
	  	    <td>

				<a href="<c:url value='/user/view'>
						   <c:param name='userId' value='${user.userId}'/>
				 		 </c:url>">
				  ${user.userId}</a>	 
			  </td>
			  <td>
			  	${user.name}     
			  </td>
			  <td>
			    ${user.email} 
			  </td>
			  <td>	
				${user.joinDate} 
			  </td>
              <td>
                   <a class="btn btn-primary" 
   						href="<c:url value='/user/delete'>
		     	 		<c:param name='userId' value='${user.userId}'/>
	 	      		</c:url>" onclick="return userRemove();">삭제</a>
              </td>
		</tr> 	
			
		 </c:forEach> 

	  </tbody>
	</table>		  	 
	<br>
	
	<!-- 페이징 처리 뺄지 고민중. -->
     <div class="col-md-12 text-center">
      <ul class="pagination pagination-lg pager" id="myPager"></ul>
      </div>
      </div>
      </div>		     
</div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 <script src="${pageContext.request.contextPath}/js/paging.js"></script>
</body>
</html>