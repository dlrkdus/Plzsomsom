<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>솜솜아 부탁해</title>

        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
        
        <style>
           body {
              background-color: pink;
           }
        
        
        
        </style>
        
    </head>
    <body>
    <div>
       <div style="width: 25%; float: left;">
<%@include file="/sidebar.jsp" %>
   </div>
      <div style="width: 75%; float: right; padding-top: 70px;" class="container-xl px-4 mt-4">
     <div class="container position-relative">
                <div class="row justify-content-center">
                <div style="text-align:center">
                 <img src="${pageContext.request.contextPath}/img/somsom.png" />   
            </div>
                    <div class="col-xl-6">
                        <div class="text-center">
                        
                            <h4 class="mb-1">솜솜이들을 위한 거래 서비스</h4>
                            <h1 class="mb-1">솜솜아부탁해<br></h1>
                            
                            <!-- 서치 바 -->

                              <div>
                        <br>
                           <form class="d-flex" role="search" action="<c:url value='/post/search' />">
                               <input class="form-control me-2" name="keyword" type="search" placeholder="" aria-label="Search">
                           <button type="submit" class="btn btn-danger" >Search</button>
                           </form>
                      </div>
                        </div>
                        
                    </div>
                   <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                </div>
                <%@include file="footer.jsp" %>
            </div>
            </div>
</div>
    

                   
                   

   
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>
 </html>