<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- include해서 post/view.jsp에 필요할 것 같습니다. -->
<title>댓글수정</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- css -->
<link href="${pageContext.request.contextPath}/css/comments.css" rel="stylesheet">


<div class="modal fade" id="Update" role="dialog">
	<form name="Updateform" method="POST" action="<c:url value='/comments/update' > <c:param name='commentsNum' value='${comments.commentsNum }'/></c:url>">
		<div class="modal-dialog">
  			<!-- modal 내용 -->
    	<div class="modal-content">
      		<div class="modal-header">
        		<h5 class="modal-title" id="modal-title">댓글 수정 창</h5>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>
      		<div class="modal-body">
        		<table class="table">
        		<input type="hidden" name="commentsNum" value="${updatecomments.commentsNum}"/>
        		<input type="hidden" name="postNum" value="${updatecomments.postNum}"/>

        		<tr>
        		<td>댓글내용</td>
        		<td class="form-control">
	        		<input type="text" name="commContent" class="form-control" value="${updatecomments.commContent}"/>
	        	</td>
        		</tr>
       			</table>
       		</div>
       		<div class="modal-footer">
       			<button id="updatebtn" type="submit" class="btn-btn-success">수정</button>
       			<button type="button" class="btn btn-default" onclick="javascript:history.back()">취소</button>
       		</div>
       		</div>
       	</div>
    </form>
</div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


</html>