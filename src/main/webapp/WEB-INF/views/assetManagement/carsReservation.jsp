<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">

<head>
<meta charset="utf-8" />
<title>시설예약 / 법인차량 | Follow me</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />


<!-- App favicon -->
<link rel="shortcut icon" href="${contextPath}/assets/images/favicon.ico">

<!-- Theme Config Js -->
<script src="${contextPath}/assets/js/head.js"></script>

<!-- Bootstrap css -->
<link href="${contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" id="app-style" />

<!-- App css -->
<link href="${contextPath}/assets/css/app.min.css" rel="stylesheet" type="text/css" />

<!-- Icons css -->
<link href="${contextPath}/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<script>
	var loginUserName = '${loginUser.memName}';
</script>
<style>
	.a.nav-link.active{backgroun-color:#FEBE98;}
	.active>.page-link, .page-link.active {
    --ct-pagination-active-bg: #febe98;
</style>

</head>

<body>
	<!-- Begin page -->
	<div id="wrapper">

  	<!-- sidemenu include -->
  	<jsp:include page="/WEB-INF/views/common/sidemenu.jsp"/>
            
  	<div class="content-page">

    	<!-- topbar include -->
      <jsp:include page="/WEB-INF/views/common/topbar.jsp"/>

      <!-- ============================================================== -->
      <!-- Start Page Content here -->
      <!-- ============================================================== -->

			<div class="content-page">

      <!-- ========== Topbar Start ========== -->

      <!-- ========== Topbar End ========== -->

      <div class="content" style="background-color: #F2E8DA;">

          <!-- Start Content-->
          <div class="container-fluid" style="background-color: #F2E8DA;">
              
              <!-- start page title -->
              <div class="row">
                  <div class="col-12">
                      <div class="page-title-box">
                          <div class="page-title-right">
                              <ol class="breadcrumb m-0">
                              		<li class="breadcrumb-item"><a href="javascript: void(0);">FOLLOW ME</a></li>
                                  <li class="breadcrumb-item"><a href="javascript: void(0);">자산관리</a></li>
                                  <li class="breadcrumb-item"><a href="javascript: void(0);">차량</a></li>
                                  <li class="breadcrumb-item active">법인차량 예약</li>
                              </ol>
                          </div>
                          <h4 class="page-title"><b>법인차량 예약</b></h4>
                      </div>
                  </div>
              </div>
              <!-- end page title -->


              <div class="row">
                  <div class="col-lg-6">
                      <div class="card">
                          <div class="card-body">
                              <h5 class="text-uppercase bg-light p-2 mt-0 mb-3"><b>법인차량 목록</b> | <small>COMPANY CAR LIST</small></h5>
                              
                              <div style="border: 1px solid none; width: 100%; height: 770px; box-sizing:border-box;">

                                  <br>
                                  <table class="table table-striped table-hover">
                                    <thead>  
                                      <tr align="center">
                                          <th>차종</th>
                                          <th>차량번호</th>
                                          <th>탑승인원(명)</th>
                                          <th>비고</th>
                                      </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach var="c" items="${ carlist }">
	                                      <tr  align="center" onclick="assetCarList('${ c.assetName }');">
	                                          <td>
	                                          	<input type="hidden" value="${ c.assetNo }">
	                                          	${ c.assetName }
	                                          </td>
	                                          <td>${ c.carNo }</td>
	                                          <td>${ c.noMem }</td>
	                                          <td>${ c.status }</td>
	                                      </tr>
	                                   	</c:forEach>    
                                    </tbody>  
                                  </table>
                              
                              </div>


                          </div>
                      </div> <!-- end card -->
                  </div> <!-- end col -->

                  <div class="col-lg-6">
                      
                      <!-- 예약 조회-->
                  <form action="selectCarList-form">
                      <div class="card">
                          <div class="card-body">
                              <h5 class="text-uppercase mt-0 mb-3 bg-light p-2"><b>예약 조회 / 취소</b> | <small>RESERVAION INQUIRY / CANCE</small></h5>
                                  
                              <label style="margin-left: 25px; margin-right: 10px;"><b>희망예약일</b></label>
                              <input type="date" id="selectCarList-date" name="rsvnDate" min="" style="border: 0.5px solid lightgray; 
                                                 border-radius: 3px; color: gray; height: 30px;">
                              <br><br>
                                      <table class="table table-sm table-bordered" id="reservationSelect-table">
																        <thead>  
																        <tr align="center">
																                <th style="width: 20px;">
																                <div class="form-check">
																                    <input type="checkbox" id="allCheckBox" class="form-check-input" id="customCheck1">
																                    <label class="form-check-label" for="customCheck1">&nbsp;</label>
																                </div>
																            </th>
																            <th>차종</th>
																            <th colspan="2">사용시간</th>
																            <th colspan="2">반납시간</th>
																            <th>예약자</th>
																            <th>소속부서</th>
																            <th>이용사유</th>
																        </tr>
																      </thead>
																     	<tbody>
																     	 
																      </tbody>    
																    </table>
                                  <br>
                                  <button type="button" id="selectCarList-btn" class="btn w-sm btn-success waves-effect waves-light" 
                                          style="background-color: #FFBE98; border: none; margin-left: 45%;">조회</button>
                                  
                                  <!--예약한 사원번호가 일치할 시 표시-->
                                  <button type="button" class="btn w-sm btn-light waves-effect">선택삭제</button>

                              </div>
                      	</div> <!-- end col-->
											</form>

                      <!-- 예약 신청 -->
                      <div class="card">
                          <div class="card-body">
                              <h5 class="text-uppercase mt-0 mb-3 bg-light p-2"><b>예약 신청</b> | <small>RESERVAIONL</small></h5>
															
															<form id="reservationForm">
	                              <table class="table-sm" style="margin-left: 20px;">
	                                  <tr>
	                                      <th>예약자</th>
	                                      <td style="width: 150px;">
	                                          <input type="text" name="rsvnName" value="${ loginUser.memName }"class="form-control" readonly>    
	                                      </td>
	                                      <td></td>
	                                      <th>소속부서</th>
	                                      <td  style="width: 150px;">
	                                          <input type="text" name="deptName" value="${ loginUser.deptName }" class="form-control" readonly  >     
	                                      </td>
	                                  </tr>
	                                  <tr>
	                                      <th>예약차종</th>
	                                      <td colspan="4">
	                                          <input type="text"id="insert-assetName" name="assetName" class="form-control"
	                                           placeholder="법인차량목록에서 클릭해주세요." required>  
	                                      </td>
	                                  </tr>
	                                  <tr> 
	                                      <th>예약날짜</th>
	                                      <td colspan="4">
	                                          <input type="date" id="rsvnDate" name="rsvnDate" min="" style="border: 0.5px solid lightgray; 
	                                                 border-radius: 3px; color: gray; height: 30px;">
	                                      </td>
	                                  </tr>
	                                  <tr>
	                                      <th>예약시간</th>
                                        <td>
                                            <select class="reservation-select class="form-control" name="startDivision" id="startDivision"
                                                    style="border: 0.5px solid lightgray; border-radius: 3px; height: 30px; color: gray;">
                                                    <option value="오전">오전</option>
                                                    <option value="오후">오후</option>
                                            </select>
                                            <select class="reservation-select class="form-control" id="startDate"
                                                    style="border: 0.5px solid lightgray; border-radius: 3px; width:70px; height: 30px; color: gray;">
                                                    <option value="01">01시</option>
                                                    <option value="02">02시</option>
                                                    <option value="03">03시</option>
                                                    <option value="04">04시</option>
                                                    <option value="05">05시</option>
                                                    <option value="06">06시</option>
                                                    <option value="07">07시</option>
                                                    <option value="08">08시</option>
                                                    <option value="09">09시</option>
                                                    <option value="10">10시</option>
                                                    <option value="11">11시</option>
                                                    <option value="12">12시</option>
                                            </select>
                                        </td>
                                        <td>~</td>
                                        <td colspan="2"  style="width: 150px;">
                                            <select class="reservation-select class="form-control" name="endDivision" id="endDivision"
                                                    style="border: 0.5px solid lightgray; border-radius: 3px; height: 30px; color: gray;">
                                                    <option value="오전">오전</option>
                                                    <option value="오후">오후</option>
                                            </select>
                                            <select class="reservation-select class="form-control" id="endDate"
                                                    style="border: 0.5px solid lightgray; border-radius: 3px; width:70px; height: 30px; color: gray;">
                                                    <option value="01">01시</option>
                                                    <option value="02">02시</option>
                                                    <option value="03">03시</option>
                                                    <option value="04">04시</option>
                                                    <option value="05">05시</option>
                                                    <option value="06">06시</option>
                                                    <option value="07">07시</option>
                                                    <option value="08">08시</option>
                                                    <option value="09">09시</option>
                                                    <option value="10">10시</option>
                                                    <option value="11">11시</option>
                                                    <option value="12">12시</option>
                                            </select>
                                        </td>
                                        <td></td>
	                                  </tr>
	                                  <tr>
	                                      <th>이용목적</th>
	                                      <td colspan="4">
	                                          <input type="text" name="rsvnContent" class="form-control">
	                                      </td>
	                                  </tr>
	                              </table>
	                              <br>

																<!-- 이용불가 차량은 버튼 안눌리게 해야함 -->
                                <div class="text-center mb-3">
                                    <button type="submit" class="btn w-sm btn-success waves-effect waves-light" style="background-color: #FFBE98; border: none;">예약</button>
                                </div>
                              </form>
                              
                              </div> <!-- end card -->
                              
                  
                          </div> <!-- end col-->
                      </div>
                      <!-- end row -->

                      </div>

              <!-- end row -->

          </div> <!-- container -->

      </div> <!-- content -->
  </div>





   <script>
		// - 예약조회/신청할 때 전날 선택 안되도록
		document.querySelectorAll('input[type="date"]').forEach(function(minday){
			minday.min = new Date().toISOString().split('T')[0];
		})
		
		
		// 차량목록 행을 클릭했을때 내용 input에 출력
		function assetCarList(assetName){
			document.getElementById("insert-assetName").value = assetName;
		}
		
		
		
		// 차량예약, 예약시간 변경
		$("#reservationForm").on('submit', function(event){
			
			// 기본 폼 제출 막기
			event.preventDefault();
			
			// startDate, endDate 변환 
			var rsvnDate = document.getElementById("rsvnDate").value;

			// start 변환
			var startDivision = document.getElementById("startDivision").value;
			var startDt = document.getElementById("startDate").value;

			// end
			var endDivision = document.getElementById("endDivision").value;
			var endDt = document.getElementById("endDate").value;

			// startDate에 합치기
			var startDate = rsvnDate + " ";
			if(startDivision == "오전" ){
				if(startDt == "12"){
					startDate += "00";  // 12시는 00으로 변경
				}else{
					startDate += startDt.padStart(2, '0'); // 한자리수 시간 앞에 0추가
				}
			}else if(startDivision == "오후"){
				if(startDt != "12"){
					startDate += (parseInt(startDt) + 12).toString().padStart(2,'0');
				}else{
					startDate += startDt; // 12시는 그대로 유지
				}
			}
			
			var endDate = rsvnDate + " ";
			if(endDivision == "오전"){
				if(endDt == "12"){
					endDate += "00";
				}else{
					endDate += endDt.padStart(2,'0');
				}
			}else if(endDivision == "오후"){
				if(endDt != "12"){
					endDate += (parseInt(endDt) + 12).toString().padStart(2,'0');
				}else{
					endDate += endDt;
				}
			}
			
			/*
			// startDate input hidden생성
		  var hiddenStartDate = $('<input>').attr({
				type:'hidden',
				name:'startDate',
				value:startDate
		  });
		  
			// endDate input hidden생성
			var hiddenEndDate = $('<input>').arrt({
				type:'hidden',
				name:'endDate',
				value:endDate
			});
			
			// 폼에 hidden input 생성
			$(this).append(hiddenStartDate);
			$(this).append(hiddenEndDate);
			*/
			
			
			// 폼 데이터 객체로 변환
			var formData = $(this).serializeArray();
			var data = {};
			formData.forEach(function(item){
				data[item.name] = item.value;
			});
			
			data.startDate = startDate;
			data.endDate = endDate;
			
			console.log(data);
			
			$.ajax({
				url:"${contextPath}/asset/insertrsvncar.do",
				type:"post",
				contentType:"application/json",
				data: JSON.stringify(data),
				success:function(result){
					
					if(result > 0){
						alert("차량예약에 성공하였습니다.");
					}else{
						alert("차량예약에 실패하였습니다. 예약정보를 다시 확인해주세요.");
					}
					
					location.reload();
					
				},
				error:function(er){
					console.log("차량예약 실패 ajax");
					if(er.status == 409){
						alert("예약이 중복 되었습니다. 예약정보를 다시 확인해주세요.");
					}else{
						alert("예약이 중복 되었습니다. 예약정보를 다시 확인해주세요.");
					}
				}
			});
			
		})
		
		
		
		// 예약 조회
		$("#selectCarList-btn").on("click", function(){
				
			$.ajax({
					url:"${contextPath}/asset/reservationlist.do",
					type:"get",
					data:{ rsvnDate : $("#selectCarList-date").val() },
					success:function(dList){
						
						console.log(Array.isArray(dList));
						
						var tr = "";
						if(dList.length == 0){
							tr += "<tr>"
									+ "<td colspan='9'>" + "조회된 예약이 없습니다." + "</td>"
									+ "</tr>"
						}else{
							
							for(let i=0; i<dList.length; i++){
							
								let checkbox = "<div><input type='checkbox' class='form-check-input' id='customCheck2'>"
			                         + "<label class='form-check-label' for='customCheck2'>&nbsp;</label>"
			                         + "<input type='hidden' class='form-check-input' id='rsvnNo' value='" + dList[i].rsvnNo + "'></div>";	
							
								tr += "<tr>" 
								       + "<td>" + checkbox + "</td>"
								       + "<td>" + dList[i].assetName + "</td>"
								       + "<td>" + dList[i].startDivision + "</td>"
								       + "<td>" + dList[i].startDate + "</td>"
								       + "<td>" + dList[i].endDivision + "</td>"
								       + "<td>" + dList[i].endDate + "</td>"
								       + "<td>" + dList[i].rsvnName + "</td>"
								       + "<td>" + dList[i].deptName + "</td>"
								       + "<td>" + dList[i].rsvnContent + "</td>"
								    + "</tr>";
								
								// 로그인 사원과 예약자가 일치할 시 체크박스 활성화
								if(dList[i].rsvnName == loginUserName){
									$(checkbox).find("input").prop("disabled", false);
								}else{
									$(checkbox).find("input").prop("disabled", true);
								};
							}
							
							$("#reservationSelect-table tbody").html(tr);
							
						}

					},
					error:function(){
						console.log("예약조회 ajax실패");
					}
			})
			
		})
		

		
   </script>







      <!-- ============================================================== -->
      <!-- <-- End Page Content
      <!-- ============================================================== -->
      
      

		</div>
	</div>
	
  
        <!-- Vendor js -->
        <script src="${contextPath}/assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="${contextPath}/assets/js/app.min.js"></script>
        
        <!-- Plugins js-->
        <script src="${contextPath}/assets/libs/flatpickr/flatpickr.min.js"></script>
        <script src="${contextPath}/assets/libs/selectize/js/standalone/selectize.min.js"></script>

        <!-- Dashboar 1 init js-->
	
</body>
</html>