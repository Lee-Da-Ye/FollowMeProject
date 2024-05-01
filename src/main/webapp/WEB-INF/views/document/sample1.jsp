<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">

<head>
<meta charset="utf-8" />
<title>전자결재 양식 1. 품의서 | Follow me</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />

<!-- App favicon -->
<link rel="shortcut icon" href="${ contextPath }/assets/images/favicon.ico">

<!-- Theme Config Js -->
<script src="${ contextPath }/assets/js/head.js"></script>

<!-- Bootstrap css -->
<link href="${ contextPath }/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" id="app-style" />

<!-- App css -->
<link href="${ contextPath }/assets/css/app.min.css" rel="stylesheet" type="text/css" />

<!-- Icons css -->
<link href="${ contextPath }/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

<!-- Plugins css -->
<link href="${ contextPath }/assets/libs/quill/quill.core.css" rel="stylesheet" type="text/css" />
<link href="${ contextPath }/assets/libs/quill/quill.bubble.css" rel="stylesheet" type="text/css" />
<link href="${ contextPath }/assets/libs/quill/quill.snow.css" rel="stylesheet" type="text/css" />
        
<!-- Plugins css -->
<link href="${ contextPath }/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
<link href="${ contextPath }/assets/libs/selectize/css/selectize.bootstrap3.css" rel="stylesheet" type="text/css" />

    <style>
        .a.nav-link.active{background-color:#FEBE98;}

        .card{
            align-items: center;
            width: 80%;
        }
        
        .document-info{ 
            display: flex; 
        }
        
        .top-document{
            justify-content: space-between;
            display: flex;
            align-items: flex-end; /* 아이템들을 오른쪽으로 정렬합니다. */     
        }

        .document-title{
            margin-bottom: 60px; margin-left: 100px;
        }
        
        .sign-table{
            text-align: right;
            margin-bottom: px;
        }
        
        .table-sign{
            border: 1px solid rgb(102, 88, 221);
            border-collapse: collapse;
            margin-top: 50px;
            margin-bottom: 20px;
        }

        .table-sign tr>th, .table-sign tr>td{
            text-align: center; 
            width: 100px;
            height: 25px;
            font-size: 11px;
            font-weight: lighter;
        }

        .sign{
            height:75px;
        }

        .table-info-1, .table-info-2{
            border: 1px solid rgb(102, 88, 221);
            border-collapse: collapse;
            margin-bottom: 15px;
        }
        
        .table-info-2{
            margin-left: 2px;
        }
        
        .table-2-1{
            border: 1px solid rgb(102, 88, 221);
            border-collapse: collapse;
            margin-bottom: 15px; 
        }
        
        .table-sign th, .table-sign td, .table-info-1 th, .table-info-1 td, .table-info-2 th, .table-info-2 td{
            border: 1px solid rgb(102, 88, 221);
            padding: 8px;
            text-align: left;
            
        }
        
        .table-2-1 th, .table-2-1 td{
            border: 1px solid rgb(102, 88, 221);
            padding: 8px;
            text-align: left;
            height: 40px;
        }

        #snow-editor {
            flex: 1; /* 자식 요소를 꽉 채우도록 설정합니다. */
        }

        input:focus ,td>textarea:focus{
            outline: none;
        }

    </style>

</head>

<body>
        <!-- Begin page -->
        <div id="wrapper" style="background-color: white;">

            <!-- ============================================================== -->
            <!-- Start Page content -->
            <!-- 전자결재 양식 1. 품의서-->
            <!-- ============================================================== -->
                
            <div class="content">

                <!-- Start Content-->
                <div class="container-fluid" style="display:flex; justify-content: center;">
                    
                    <div class="card">
                            <div class="card-body">
                                <div class="top-document">
                                    <div class="document-title">
                                        <h1>품의서</h1>
                                    </div>
                                    <div class="sign-table">
                                        <table class="table-sign">
                                            <tr>
                                                <th rowspan="5" style="width:20px;">결 재 선</th>
                                            </tr>
                                            <tr>
                                                <th>작 성 자</th>
                                                <th>결 재 자</th>
                                                <th>결 재 자</th>
                                            </tr>
                                            <tr class="sign">
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>  

                                <div class="document-info">

                                    <div class="info-1">
                                        <table class="table-info-1">
                                            <tr>
                                                <th width="120px;">부서</th>
                                                <td width="266px;">경영지원</td>    
                                            </tr>
                                            <tr>
                                                <th>직급</th>
                                                <td>대리</td>
                                            </tr>
                                            <tr>
                                                <th>기안자</th>
                                                <td>유주찬</td>
                                            </tr>
                                            <tr>
                                                <th>기안일</th>
                                                <td>2024-05-13 (월)</td>
                                            </tr>
                                        </table>
                                        
                                    </div>
                                    <div class="info-2">
                                        <table class="table-info-2">
                                            <tr>
                                                <th width="120px;">참조인</th>
                                                <td width="266px;">경영지원 김성한 팀장</td>
                                            </tr>
                                            <tr>
                                                <th>보존연한</th>
                                                <td>기안일로부터 5년</td>
                                            </tr>
                                            <tr>
                                                <th>중간결재일</th>
                                                <td>2024-05-13 (월)</td>
                                            </tr>
                                            <tr>
                                                <th>최종결재일</th>
                                                <td>2024-05-14 (화)</td>
                                            </tr>
                                        </table>
                                    </div>
                                    
                                </div>

                                    <div class="table-2">
                                        <table class="table-2-1">
                                            <tr>
                                                <th width="120px;">제목</th>
                                                <td width="655px;">
                                                    <input type="text" name="title" size="20" style="width:100%; border:0;" value="기안자 작성란">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    
                                    
                                <!-- 내용 작성하기 -->
                                <div class="table-responsive">
                                    <table class="table table-bordered border-primary mb-0">

                                        <tbody>
                                            <tr>
                                                <th style="text-align:center; width:90px;">
                                                    품의사유 <br>및<br> 상세내용
                                                </th>
                                                <td style="height:250px; width:655px; text-align:left;">
                                                    <div id="snow-editor" style="height:250px;">
                                                        기안자 작성란
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="text-align:center;"> 비 용 </th>
                                                <td>
                                                    <input type="text" name="price-box" size="20" style="width:655px; border:0;" value="기안자 작성란">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="text-align:center;"> 비 고 </th>
                                                <td>
                                                    <input type="text" name="etc-box" size="20" style="width:655px; border:0;" value="기안자 작성란">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="text-align:center;">첨 부</th>
                                                <td><input type="file" style="width:645px;" id="upfile" class="form-control-file border file" name="uploadFiles" multiple></td>
                                                <!--
                                                    <td>
                                                        <c:forEach var="at" items="${ board.attachList }">
                                                            <a href="${ contextPath }${ at.filePath }/${ at.fileSystemName }" download="${ at.originalName }">[${ at.originalName }]</a>
                    	                                </c:forEach>
                                                    </td>
                                                -->
                                            </tr>
                                        </tbody>
                                    </table>
                                </div> <!-- 내용 작성하기 끝-->

                                <!--결재 처리사유-->
                                <div class="opinion-box" style="margin-top:20px;">
                                    <table class="table table-bordered border-primary mb-0">      
                                            <tr>
                                                <th style="text-align:center; width:90px;">
                                                    처 리 <br> 사 유
                                                </th>
                                                <td>
                                                    <textarea rows="5" style="border:0; width:655px; resize:none;" readonly>결재 시 결재권자만 작성할 수 있도록 처리</textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                    </table>
                                </div> <!-- 결재 처리사유 끝-->
                            </div>
                        </div>
                    </div>
          


                        
                </div> <!-- container -->

            </div> <!-- content -->

      <!-- ============================================================== -->
      <!-- <-- End Page Content
      <!-- ============================================================== -->
      
        <!-- Vendor js -->
        <script src="${ contextPath }/assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="${ contextPath }/assets/js/app.min.js"></script>
        
        <!-- Plugins js-->
        <script src="${ contextPath }/assets/libs/flatpickr/flatpickr.min.js"></script>
        <script src="${ contextPath }/assets/libs/apexcharts/apexcharts.min.js"></script>
        <script src="${ contextPath }/assets/libs/selectize/js/standalone/selectize.min.js"></script>

        <!-- Dashboar 1 init js-->
        <script src="${ contextPath }/assets/js/pages/dashboard-1.init.js"></script>
        
        <!-- Plugins js -->
        <script src="${ contextPath }/assets/libs/quill/quill.min.js"></script>

        <!-- Init js-->
        <script src="${ contextPath }/assets/js/pages/form-quilljs.init.js"></script>
	
</body>
</html>