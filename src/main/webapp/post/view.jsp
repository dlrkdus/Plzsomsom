<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>솜솜아 부탁해</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/somsom.png" />

<link href="${pageContext.request.contextPath}/css/faqPage.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">    

<script>
function userRemove(){
   return confirm("정말 삭제하시겠습니까?");   
}
var myModal = document.getElementById('myModal')
var myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', function () {
   myInput.focus()
})

$(document).on("click", ".modify", function(){
 //$(".replyModal").attr("style", "display:block;");
 $(".replyModal").fadeIn(200);
 
 var repNum = $(this).attr("data-repNum");
 var repCon = $(this).parent().parent().children(".replyContent").text();
 
 $(".modal_repCon").val(repCon);
 $(".modal_modify_btn").attr("data-repNum", repNum);
 
});

</script>

</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<div style="width: 30%; float: left;">

<%@include file="/sidebar.jsp" %>
</div>
<div style=" width: 70%; padding: 30px 60px 20px 20px; float: right;">
       <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
            <ol class="breadcrumb">
           <!-- 상단에 어떤 카테고리인지 알려줌 ex) Home > 강의자료 > 중고책 -->
             <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/board/main.jsp">Home</a></li>
             <c:choose>
             <c:when test="${post.productCategoryNum eq '1'}">
                 <li class="breadcrumb-item active" aria-current="page">강의자료</li>
                 <li class="breadcrumb-item active" aria-current="page">중고책</li>
             </c:when>
             <c:when test="${post.productCategoryNum eq '2'}">
                 <li class="breadcrumb-item active" aria-current="page">강의자료</li>
                 <li class="breadcrumb-item active" aria-current="page">필기본</li>
             </c:when>
             <c:when test="${post.productCategoryNum eq '3'}">
                 <li class="breadcrumb-item active" aria-current="page">강의자료</li>
                 <li class="breadcrumb-item active" aria-current="page">기타</li>
             </c:when>
             <c:when test="${post.productCategoryNum eq '4'}">
                 <li class="breadcrumb-item active" aria-current="page">심부름</li>
                 <li class="breadcrumb-item active" aria-current="page">대면</li>
             </c:when>
             <c:when test="${post.productCategoryNum eq '5'}">
                 <li class="breadcrumb-item active" aria-current="page">심부름</li>
                 <li class="breadcrumb-item active" aria-current="page">비대면</li>
             </c:when>
             <c:when test="${post.productCategoryNum eq '6'}">
                 <li class="breadcrumb-item active" aria-current="page">나눔</li>
                 <li class="breadcrumb-item active" aria-current="page">대면</li>
             </c:when>
             <c:when test="${post.productCategoryNum eq '7'}">
                 <li class="breadcrumb-item active" aria-current="page">나눔</li>
                 <li class="breadcrumb-item active" aria-current="page">비대면</li>
             </c:when>
             <c:when test="${post.productCategoryNum eq '8'}">
                 <li class="breadcrumb-item active" aria-current="page">요청</li>
                 <li class="breadcrumb-item active" aria-current="page">강의자료</li>
             </c:when>
             <c:when test="${post.productCategoryNum eq '9'}">
                 <li class="breadcrumb-item active" aria-current="page">요청</li>
                 <li class="breadcrumb-item active" aria-current="page">심부름</li>
             </c:when>
             <c:when test="${post.productCategoryNum eq '10'}">
                 <li class="breadcrumb-item active" aria-current="page">요청</li>
                 <li class="breadcrumb-item active" aria-current="page">나눔</li>
             </c:when>
             </c:choose>

           </ol>
      </nav>
      <div class="content_box">

    <h4 class="card-title" id="text1">${post.title }</h4>
    <hr style="color: #BDBDBD; size: 2px;">
    <h6 style="color: #A50000; font-weight: bold;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
</svg>${post.postWriterId }</h6>
<h6 style="font-weight: bold;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cash" viewBox="0 0 16 16">
  <path d="M8 10a2 2 0 1 0 0-4 2 2 0 0 0 0 4z"/>
  <path d="M0 4a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V4zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V6a2 2 0 0 1-2-2H3z"/>
</svg>&nbsp;가격: ${post.price } &nbsp;<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">
  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
</svg>&nbsp;거래시간:${post.time }</h6>
   <p class="card-text">${post.postContent }</p>
   <img width="200" src="<c:url value='/upload/${post.photo}'/>" class="card-img-bottom" alt=""><br>


<c:choose>
<c:when test="${post.productCategoryNum eq '1' || post.productCategoryNum eq '2' || post.productCategoryNum eq '3' || post.productCategoryNum eq '4' ||
   	post.productCategoryNum eq '5' || post.productCategoryNum eq '6' || post.productCategoryNum eq '7' }">
 <small class="text-muted">${post.postDate}에 올라옴 · 재고:${post.count }</small>
 </c:when>
 <c:otherwise>
  <small class="text-muted">${post.postDate}에 올라옴</small>
 </c:otherwise>
</c:choose>
    <hr style="color: #BDBDBD; size: 2px;">
   <br><br>

   <!-- 세션 userId와 postWriterId랑 같으면 글 내용 하단 버튼을 수정, 삭제로 보여줌 -->
<c:choose>
   <c:when test="${sessionScope.userId eq post.postWriterId }">
      <div class="button_box" style="float: left;">
      <a class="btn btn-danger" role="button" href="<c:url value='/post/update/form' >
                                    <c:param name='postNum' value='${post.postNum }' />
                                    </c:url>" >수정</a>
      <a class="btn btn-danger" role="button" href="<c:url value='/post/delete' >
                                    <c:param name='postNum' value='${post.postNum }' />
                                    <c:param name='productCategoryNum' value='${post.productCategoryNum }'/>
                                    </c:url>" onclick="return userRemove();">삭제</a>
      </div>
   </c:when>
   
   
   <c:when test="${sessionScope.userId ne null }">
   <div class="button_box" style="float: left;">
   	<c:if test="${post.productCategoryNum eq '1' || post.productCategoryNum eq '2' || post.productCategoryNum eq '3' || post.productCategoryNum eq '4' ||
   	post.productCategoryNum eq '5' || post.productCategoryNum eq '6' || post.productCategoryNum eq '7' }">
      <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
        결제
      </button>
     </c:if>
      <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">
       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
        <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
      </svg> 찜하기
      </button>
      </div>
   </c:when>
</c:choose>

   <!-- 목록버튼 누르면 게시글 목록으로 이동 -->
   <div class="button_box" style="float: right;">
      <a class="btn btn-light" role="button" href="<c:url value='/post/list?productCategoryNum='> <c:param name='productCategoryNum' value='${post.productCategoryNum }'/></c:url>" >목록</a>
   </div>
   </div>
   <br><br><br>
   
	<!-- 댓글 기능 여기서 구현 -->
	<div class="clearfix"></div>
    <div class="col-md-12 col-sm-12">
        <div class="comment-wrapper">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <strong>댓글 창</strong>
                </div>
                <!-- 댓글 입력.. -->
                <div class="panel-body">
                <!-- 나머지 파라미터 넘겨주기 -->
                <input type="hidden" name="postNum" value='${post.postNum}' />
                <form name="form" method="POST" action="<c:url value='/comments/insert' > <c:param name='postNum' value='${post.postNum }'/></c:url>">
             	
                	<div class="input-group" style="width: 90%;">
  						<span class="input-group-text">댓글</span>
 						<textarea name="commContent" class="form-control" rows="3"  placeholder="댓글을 작성해주세요" aria-label="With textarea"></textarea>
					</div>

                    <br>
                    <!-- 댓글 등록 버튼 -->
                    <button type="submit" class="btn btn-danger" type="submit">등록</button>
                
                    </form>
                    
                    <div class="clearfix"></div>
                    <hr>
                    <ul class="media-list">
                    <!-- 댓글 작성된 리스트 출력 -->
                    <c:forEach var="commentsList" items="${commentsList}">
                    
                        <li class="media">
                            <div class="media-body">
                                <span class="text-muted pull-right">
                                    <strong class="text-success"> ${commentsList.commWriterId}</strong>
                                </span>
                                <small class="text-muted"> ${commentsList.commWriteDate}</small>
                                
                                 <!-- 댓글 수정, 삭제버튼 -->
                        		<jsp:include page  = "updatecomments.jsp"/>
  
                        		<c:choose>
								<c:when test="${sessionScope.userId eq commentsList.commWriterId }">
								<div class="button_box" style="float: right;">								
								<a class="btn btn-danger btn-sm" role="button" href="<c:url value='/comments/delete' >
								<c:param name='commentsNum' value='${commentsList.commentsNum }' />
								</c:url>" onclick="return userRemove();">삭제</a>
								</div>
								</c:when>
                        		</c:choose>
                                
                                <p>
                                    ${commentsList.commContent}
                                </p>
                            
  
                        </div>
                        </li>
                        
                        </c:forEach>
                        
                    </ul>
                </div>
            </div>
        </div>

    </div>

  </div>
  

 
<!-- 결제 Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">결제 확인 창</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        결제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
         <a class="btn btn-danger" role="button" href="<c:url value='/transaction/insert'>
        <c:param name='postNum' value='${post.postNum }'/>
        <c:param name='productCategoryNum' value='${post.productCategoryNum }'/>
        </c:url>">결제</a>
      </div>
    </div>
  </div>
</div>


<!-- 찜 기능 Modal -->
<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">위시리스트에 넣기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        이 게시물을 위시리스트에 추가하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <a class="btn btn-danger" role="button" href="<c:url value='/wishItem/insert'>
        <c:param name='postNum' value='${post.postNum }'/>
        <c:param name='userId' value='${sessionScope.userId }'/>
        </c:url>">추가</a>
      </div>
    </div>
  </div>
</div>
      
   <!-- 수정 또는 삭제가  실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
   <c:if test="${updateFailed || deleteFailed}">
      <h6 class="text-danger"><c:out value="${exception.getMessage()}"/></h6>
    </c:if>
</main>
   <script src="${pageContext.request.contextPath}/assets/dist/js/bootstrap.bundle.min.js"></script>

     <script src="${pageContext.request.contextPath}/js/sidebars.js"></script>
</body>
</html>