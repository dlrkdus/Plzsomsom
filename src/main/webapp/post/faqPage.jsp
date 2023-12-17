<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>QnA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 	<!-- Favicon-->
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/somsom.png" />

<link href="${pageContext.request.contextPath}/css/faqPage.css" rel="stylesheet">


</head>
<body>
<div style="width: 30%; float: left;">
<%@include file="/sidebar.jsp" %>
</div>
  <div style=" width: 70%; padding: 30px; float: right;"> 


            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-10">
                        <div class="card card-style1 border-0">
                            <div class="card-body p-4 p-md-5 p-xl-6">
                                <div class="text-center mb-2-3 mb-lg-6">
                                    <span class="section-title text-primary">FAQ</span>
                                    <h2 class="h1 mb-0 text-secondary">Frequently Asked Questions</h2>
                                </div>
                                <div id="accordion" class="accordion-style">
                                    <div class="card mb-3">
                                        <div class="card-header" id="headingOne">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"><span class="text-theme-secondary me-2">Q.</span> 솜솜아부탁해는 무슨 서비스인가요?</button>
                                            </h5>
                                        </div>
                                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                솜솜아부탁해는 확실하게 인증된 학교 내 학우들 사이의 중고 거래 및 심부름을 거래할 수 있게 도와주는 서비스입니다. 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card mb-3">
                                        <div class="card-header" id="headingTwo">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"><span class="text-theme-secondary me-2">Q.</span>꼭 학교 웹메일을 사용해야 하나요?</button>
                                            </h5>
                                        </div>
                                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-bs-parent="#accordion">
                                            <div class="card-body">
                                               네. 학우들의 확실한 인증 중 가장 간편한 방법이 웹메일이기 때문에 이메일 주소 입력 시 꼭 웹메일로 해주셔야 합니다.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card mb-3">
                                        <div class="card-header" id="headingThree">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><span class="text-theme-secondary me-2">Q.</span>족보는 판매하지 않나요?</button>
                                            </h5>
                                        </div>
                                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                네. 학칙에 어긋날 소지가 있는 강의자료는 거래품목에 들어가지 않습니다.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card mb-3">
                                        <div class="card-header" id="headingFour">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour"><span class="text-theme-secondary me-2">Q.</span> 거래는 어떻게 하나요?</button>
                                            </h5>
                                        </div>
                                        <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                거래는 다음과 같은 과정으로 진행됩니다. 목적에 맞는 게시판에 들어가셔서 원하시는 거래 품목의 게시글에 들어가셔서 하단의 결제 버튼을 눌러주시면 됩니다. 버튼을 클릭함으로써 거래가 성사됩니다.
                                            </div>
                                        </div>
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