<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

 	<!-- Favicon-->
<link rel="shortcut icon" type="image/x-icon" href="<c:url value='/img/somsom.png'/>" />
<!-- <script>
$("select[name=productCategoryNum]").change(function(){
	  console.log($(this).val()); //value값 가져오기
	});
</script>-->
<script>
	function getCategory(){
		$("select[name=productCategoryNum]").val();
	}
</script>
<script>

function postCreate() {
	write.submit();
}

</script>
<title>솜솜아 부탁해</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <style>
  .select-f{ <!-- select 설정 -->
	font-size: 13px;
	font-weight: bold;
	width: 200px;
	padding: .8em .5em;
	border-radius: 0px;
}
.input_type{
	border: 0;
	border-radius: 5px 5px 5px 5px;
	outline: none;
	font-size: 14px;
	color: gray;
}
</style> 
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<div style="width: 30%; float: left;">
<%@include file="/sidebar.jsp" %>
</div>

  <div style="width: 70%; padding: 30px; float: right;">
		    <form name="write" action="<c:url value='/post/insert' />" enctype="multipart/form-data" method="post">
        	        <select name="productCategoryNum" class="select-f" size = "1">
                		<option value="none" >카테고리</option>
                		<option value = "1" >강의자료-중고책</option> 
                		<option value = "2" >강의자료-필기본</option>
                		<option value = "3" >강의자료-기타</option>
                		<option value = "4" >심부름-대면</option>
                		<option value = "5" >심부름-비대면</option>
                		<option value = "6" >나눔-대면</option>
                		<option value = "7" >나눔-비대면</option>
                		<option value = "8" >요청-강의자료</option>
                		<option value = "9" >요청-심부름</option>
                		<option value = "10" >요청-나눔</option>
                	</select>
                 	<h6 style="color: red; font-size: 12px;">요청게시판을 이용하실 경우 개수를 '1'로 설정해주세요.</h6>
                
					<div class="input-group mb-3" style="width: 90%;">
  						<span class="input-group-text" id="inputGroup-sizing-default">제목</span>
 	 					<input name="title" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					</div>                	
					<div class="input-group mb-3" style="width: 45%; float: left; padding: 0px 5px 0px 0px;">
  						<span class="input-group-text" id="inputGroup-sizing-default">가격</span>
 	 					<input name="price" type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
 	 				</div>
 					<div class="input-group mb-3" style="width: 45%; float: left; padding: 0px 0px 0px 5px;">
 	 					<span class="input-group-text" id="inputGroup-sizing-default">개수</span>
 	 					<input name="count" type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
					</div>                 	
					<div class="input-group mb-3" style="width: 90%;">
  						<span class="input-group-text" id="inputGroup-sizing-default">거래일자</span>
 	 					<input name="time" type="time" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					</div>                 	
                	<div class="mb-3">
                	<div class="input-group" style="width: 90%;">
  						<span class="input-group-text">상품 설명</span>
 						<textarea name="postContent" class="form-control" rows="6" aria-label="With textarea" name=""></textarea>
					</div>
					<br>
  <input name="photo" class="form-control form-control-sm" type="file" style="width: 90%;">
  <br>
  <button type="submit" class="btn btn-danger" type="submit" onClick="postCreate()">등록</button>&nbsp;
  <button type="button" class="btn btn-outline-danger" onclick="javascript:history.back()">취소</button>
</div>
                	</form>

  </div>
</body>
</html>