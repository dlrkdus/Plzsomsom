<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page import="java.io.PrintWriter" %>
<%@page import="model.PostDTO"%>
<%@page import="model.dao.PostDAO" %>
<%@page import="controller.userInfo.UserSessionUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 	<!-- Favicon-->
<link rel="shortcut icon" type="image/x-icon" href="<c:url value='/img/somsom.png'/>" />
<title>솜솜아 부탁해</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
  .content_box{
	height: 70%;
	width: 90%;
	background-color: white;
	border-radius: 5px;
	padding: 10px 10px 10px 10px;
	margin: 0 auto;
}
.button_box{
	height: 10%;
	width: 90%;
	text-align: center;
	margin: 0 auto;
}
#text1{
	font-weight: bold;
}
  </style>
  <script>

function postUpdate() {
	write.submit();
}

</script>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<div style="width: 30%; float: left;">
<%@include file="/sidebar.jsp" %>
</div>
  <div style=" width: 70%; padding: 30px; float: right;">
	<form name="write" method="post" action="<c:url value='/post/update' />">
          <input type="hidden" value="${updatePost.postNum }" name="postNum">
        	        <select name="productCategoryNum" class="select-f" size = "1">
                		<option value="none">카테고리</option>
                		<option value = "1">강의자료-중고책</option> 
                		<option value = "2">강의자료-필기본</option>
                		<option value = "3">강의자료-기타</option>
                		<option value = "4">심부름-대면</option>
                		<option value = "5">심부름-비대면</option>
                		<option value = "6">나눔-대면</option>
                		<option value = "7">나눔-비대면</option>
                		<option value = "8">요청-강의자료</option>
                		<option value = "9">요청-심부름</option>
                		<option value = "10">요청-나눔</option>
               		 	<option value = "11">FAQ</option>
                	</select>
                	<br><br>
				<div class="input-group mb-3" style="width: 90%;">
  					<span class="input-group-text" id="inputGroup-sizing-default">제목</span>
 	 				<input name="title" type="text" value="${updatePost.title }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>                	
				<div class="input-group mb-3" style="width: 45%; float: left; padding: 0px 5px 0px 0px;">
  					<span class="input-group-text" id="inputGroup-sizing-default">가격</span>
 	 				<input name="price" type="number" value="${updatePost.price }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
 	 			</div>
 				<div class="input-group mb-3" style="width: 45%; float: left; padding: 0px 0px 0px 5px;">
 	 				<span class="input-group-text" id="inputGroup-sizing-default">개수</span>
 	 				<input name="count" type="number" value="${updatePost.count }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
				</div>                 	
				<div class="input-group mb-3" style="width: 90%;">
  					<span class="input-group-text" id="inputGroup-sizing-default">거래일자</span>
 	 				<input name="time" type="time" value="${updatePost.time }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>                 	
               	<div class="mb-3">
               	<div class="input-group" style="width: 90%;">
  					<span class="input-group-text">상품 설명</span>
 					<textarea name="postContent" class="form-control" rows="6" aria-label="With textarea" name="">
 					${updatePost.postContent }
 					</textarea>
				</div>
				<br>
  		<input class="form-control form-control-sm" id="formFileSm" type="file" style="width: 90%;">
  		<br>
  		<button type="button" class="btn btn-danger" type="submit" onClick="postUpdate()">등록</button>&nbsp;
  		<button type="button" class="btn btn-outline-danger" onclick="javascript:history.back()">취소</button>
</div>
              </form>		
		 
  
  </div>
</main>
   <script src="${pageContext.request.contextPath}/../assets/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>