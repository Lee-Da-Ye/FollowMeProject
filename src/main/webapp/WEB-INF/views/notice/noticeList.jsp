<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />


<style>
    .list-column{
        margin: 0 2px;
        font-weight: bold;
    }
    .list-item1{ width: 5%; }
    .list-item2{ width: 40%; }
    .list-item3{ width: 10%; }
    .list-item4{ width: 10%; }
    .list-item5{ width: 5%; }
    
.category a {
  color: black;
  text-decoration: none; /* 기본 밑줄 제거 */ 
}

.category a.active {
  border-bottom: 2px solid #FFBE98; /* 활성 상태일 때 밑줄 추가 */
}


.category {
  list-style-type: none; /* 기본 목록 마커 제거 */
  padding: 0; /* 목록의 내부 여백 제거 */
}

.category li {
  display: inline-block; /* 요소들을 가로로 나란히 배치 */
  margin-right: 10px; /* 요소들 사이의 간격 조절 */
}

.category a:hover {
  border-bottom: 2px solid #FFBE98;
}

.button>button{
       background-color: #FFBE98;
        border: 1px solid #FFBE98; /* 테두리 */
        --ct-btn-active-bg:#FA9A85;    
        --ct-btn-active-border-color:#FA9A85;
        --ct-btn-hover-bg:#FA9A85;
        --ct-btn-hover-border-color:#FA9A85;   
}    
    
</style>

</head>
<body>

	<!-- Begin page -->
	<div id="wrapper">

  	<!-- sidemenu include -->
  	<jsp:include page="/WEB-INF/views/common/sidemenu.jsp"/>
            

   	
    
    
    		<!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

			
            <div class="content-page">
				<!-- topbar include -->
    			<jsp:include page="/WEB-INF/views/common/topbar.jsp"/>
   		          

                <div class="content" style="background-color: #F2E8DA">

                    <!-- Start Content-->
                    <div class="container-fluid">
                        
                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">FollowMe</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">게시판</a></li>
                                            <li class="breadcrumb-item active">공지사항</li>
                                        </ol>
                                    </div>                                  
                                        <h4 class="page-title">공지사항</h4> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <!-- start page content -->
                        <div class="row" >
                            <div class="col-12">

                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-9" style="border-bottom: 1px solid lightgray;">
                                                <ul class="category">
                                                	<li><a class="ajax-pageMove" data-url="${ contextPath }/board/list.do">전체글</a></li>
                                                	<li><a class="ajax-pageMove" data-url="${ contextPath }/notice/list.do">공지사항</a></li>
                                                	<li><a class="ajax-pageMove" data-url="${ contextPath }/companyNews/list.do">사내소식</a></li>
                                                </ul>
                                            </div>
                                            

                                            <div class="col-lg-3"  >
                                                <p>최근공지글</p>
                                            </div>
                                        </div>
                                        
                                        
                                        
                                        
                                        <div class="row" id="list-page" >                                        
                                            <div class="col-lg-9">
                                                
                                                <table class="table">
                                                    
                                                    <table class="table table-hover">
                                                        <div class="button">
                                                    	<button type="button" class="btn btn-primary btn-sm" onclick="insertPage()">
                                                    		<span class="menu-icon"><i data-feather="edit-3"></i></span>글쓰기
                                                    	</button>
                                                    	</div>
                                                    	<!-- 글 작성 페이지로 이동 -->
                                                    	<script>
                                                    		
                                                    	</script>
                                                    	
                                                        
                                                        <thead>
                                                            <tr>
                                                                <th class="list-item1">번호</th>
                                                                <th class="list-item2">제목</th>
                                                                <th class="list-item3">작성자</th>
                                                                <th class="list-item4">작성일</th>
                                                                <th class="list-item5">조회수</th>
                                                            </tr>
                                                        </thead>
                                                        
                                                        <tbody>
                                                            <c:choose>
                                                				<c:when test="${ empty allList }">
		                                                			<tr>
		                                                				<td colspan="5">조회된 공지글이 없습니다</td>
		                                                			</tr>
		                                                		</c:when>
		                                                		<c:otherwise>
		                                                			<c:forEach var="ab" items="${ allList }">
		                                                				<c:choose>
		                                                					<c:when test="${ ab.mustRead == 1 }">
				                                                				<tr class="click-detail" style="background-color: lightgray;" onclick="location.href='${contextPath}/notice/${loginUser.memName==ab.memNo ? 'detail.do' : 'increase.do'}?no=${ab.boardNo}';">			                                               																										
																					<td class="list-item1"><i data-feather="alert-circle"></i></td>																																																																																																						
				                                                					<td class="list-item2">${ ab.boardTitle }</td>
				                                                					<td class="list-item3">${ ab.memNo }</td>
				                                                					<td class="list-item4">${ ab.enrollDate }</td>
				                                                					<td class="list-item5">${ ab.readCount }</td>
				                                                				</tr>
			                                                				</c:when>
			                                                				<c:otherwise>
				                                                				<tr class="click-detail" onclick="location.href='${contextPath}/notice/${loginUser.memName==ab.memNo ? 'detail.do' : 'increase.do'}?no=${ab.boardNo}';">			                                               																																																																																									
																					<td class="list-item1">${ ab.boardNo }</td>																																									
				                                                					<td class="list-item2">${ ab.boardTitle }</td>
				                                                					<td class="list-item3">${ ab.memNo }</td>
				                                                					<td class="list-item4">${ ab.enrollDate }</td>
				                                                					<td class="list-item5">${ ab.readCount }</td>
				                                                				</tr>
			                                                				</c:otherwise>
		                                                				</c:choose>
		                                                			</c:forEach>
                                                				</c:otherwise>
                                                			</c:choose>
                                                            <tr>
                                                                <td class="list-item1">@</td>
                                               					<td class="list-item2"><i data-feather="camera"></i>2024년 결산 주의사항 안내</td>
                                               					<td class="list-item3">김철완 부장</td>
                                               					<td class="list-item4">2024-03-02</td>
                                               					<td class="list-item5">17</td>
                                                            </tr>
                                                            
                                                        </tbody>
                                                        
                                                    </table>
                                            </div>

                                             <!-- end col-->
                                            
                                            <!-- 최신글 목록 조회(5개) -->
                                            <div class="col-lg-3" >
                                                <ul class="list-group" >
                                                <c:forEach var="nn" items="${ newList }">
                                                    <c:set var="boardTypeLabel" value="${nn.boardType == 'CO' ? '[사내]' : (nn.boardType == 'NO' ? '[공지]' : '')}" />
													<li class="list-group-item">${boardTypeLabel}${nn.boardTitle}</li>
                                                </c:forEach> 
                                                </ul>

                                            </div>
                                             
                                            <!-- end col -->
                                            
                                            <ul class="pagination pagination-rounded justify-content-end mb-0">
	                                            <li class="page-item ${ pi.currentPage == 1 ? 'disabled' : '' }">
	                                                <a class="page-link" href="${ contextPath }/notice/list.do?page=${pi.currentPage-1}" aria-label="Previous">
	                                                    <span aria-hidden="true">«</span>
	                                                    <span class="visually-hidden">Previous</span>
	                                                </a>
	                                            </li>
	                                            
	                                           <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                                            <li class="page-item ${ pi.currentPage == p ? 'active' : '' }"><a class="page-link" href="${ contextPath }/notice/list.do?page=${p}">${p}</a></li>
	                                           </c:forEach>
	                                           
	                                            <li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' }">
	                                                <a class="page-link" href="${ contextPath }/notice/list.do?page=${pi.currentPage+1}" aria-label="Next">
	                                                    <span aria-hidden="true">»</span>
	                                                    <span class="visually-hidden">Next</span>
	                                                </a>
	                                            </li>
	                                        </ul>
	                                        
	                                        <!-- Vendor js -->
									        <script src="${ contextPath }/assets/js/vendor.min.js"></script>
											
											<!-- App js -->
									        <script src="${ contextPath }/assets/js/app.min.js"></script>
										
											<!-- Plugins js-->
									        <script src="${ contextPath }/assets/libs/flatpickr/flatpickr.min.js"></script>
									        <script src="${ contextPath }/assets/libs/selectize/js/standalone/selectize.min.js"></script>
									        
									        <!-- Dashboar 1 init js-->
									        <script src="${ contextPath }/assets/js/pages/dashboard-1.init.js"></script>
									        
									        <!-- Plugins js -->
									        <script src="${ contextPath }/assets/libs/quill/quill.min.js"></script>
									
									        <!-- Init js-->
									        <script src="${ contextPath }/assets/js/pages/form-quilljs.init.js"></script>
                                            
                                        </div>  <!-- end row -->
                                        
                                        
                                        
                                    </div> <!-- end card body-->
                                </div> <!-- end card -->

                                <!-- end page content -->

                                <!-- Add New Event MODAL -->
                                <div class="modal fade" id="event-modal" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header py-3 px-4 border-bottom-0 d-block">
                                                <button type="button" class="btn-close float-end" data-bs-dismiss="modal" aria-label="Close"></button>
                                                <h5 class="modal-title" id="modal-title">Event</h5>
                                            </div>
                                            <div class="modal-body px-4 pb-4 pt-0">
                                                <form class="needs-validation" name="event-form" id="form-event" novalidate>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="mb-3">
                                                                <label class="form-label">Event Name</label>
                                                                <input class="form-control" placeholder="Insert Event Name"
                                                                    type="text" name="title" id="event-title" required />
                                                                <div class="invalid-feedback">Please provide a valid event name</div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="mb-3">
                                                                <label class="form-label">Category</label>
                                                                <select class="form-select" name="category" id="event-category" required>
                                                                    <option value="bg-danger" selected>Danger</option>
                                                                    <option value="bg-success">Success</option>
                                                                    <option value="bg-primary">Primary</option>
                                                                    <option value="bg-info">Info</option>
                                                                    <option value="bg-dark">Dark</option>
                                                                    <option value="bg-warning">Warning</option>
                                                                </select>
                                                                <div class="invalid-feedback">Please select a valid event category</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col-md-6 col-4">
                                                            <button type="button" class="btn btn-danger" id="btn-delete-event">Delete</button>
                                                        </div>
                                                        <div class="col-md-6 col-8 text-end">
                                                            <button type="button" class="btn btn-light me-1" data-bs-dismiss="modal">Close</button>
                                                            <button type="submit" class="btn btn-success" id="btn-save-event">Save</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div> <!-- end modal-content-->
                                    </div> <!-- end modal dialog-->
                                </div>
                                <!-- end modal-->
                            </div>
                            <!-- end col-12 -->
                        </div> <!-- end row -->
                        
                    </div> <!-- container -->

                </div> <!-- content -->

                

            </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->

        <!-- Theme Settings -->
        <div class="offcanvas offcanvas-end right-bar" tabindex="-1" id="theme-settings-offcanvas">
            <div class="d-flex align-items-center w-100 p-0 offcanvas-header">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs nav-bordered nav-justified w-100" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link py-2" data-bs-toggle="tab" href="#chat-tab" role="tab">
                            <i class="mdi mdi-message-text d-block font-22 my-1"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link py-2" data-bs-toggle="tab" href="#tasks-tab" role="tab">
                            <i class="mdi mdi-format-list-checkbox d-block font-22 my-1"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link py-2 active" data-bs-toggle="tab" href="#settings-tab" role="tab">
                            <i class="mdi mdi-cog-outline d-block font-22 my-1"></i>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="offcanvas-body p-3 h-100" data-simplebar>
                <!-- Tab panes -->
                <div class="tab-content pt-0">
                    <div class="tab-pane" id="chat-tab" role="tabpanel">

                        <form class="search-bar">
                            <div class="position-relative">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="mdi mdi-magnify"></span>
                            </div>
                        </form>

                        <h6 class="fw-medium mt-2 text-uppercase">Group Chats</h6>

                        <div>
                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 mb-2 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1 text-success"></i>
                                <span class="mb-0 mt-1">App Development</span>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 mb-2 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1 text-warning"></i>
                                <span class="mb-0 mt-1">Office Work</span>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 mb-2 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1 text-danger"></i>
                                <span class="mb-0 mt-1">Personal Group</span>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1"></i>
                                <span class="mb-0 mt-1">Freelance</span>
                            </a>
                        </div>

                        <h6 class="fw-medium mt-3 text-uppercase">Favourites <a href="javascript: void(0);" class="font-18 text-danger"><i class="float-end mdi mdi-plus-circle"></i></a></h6>

                        <div>
                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-10.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status online"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Andrew Mackie</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">It will seem like simplified English.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-1.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status away"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Rory Dalyell</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">To an English person, it will seem like simplified</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-9.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status busy"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Jaxon Dunhill</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">To achieve this, it would be necessary.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <h6 class="fw-medium mt-3 text-uppercase">Other Chats <a href="javascript: void(0);" class="font-18 text-danger"><i class="float-end mdi mdi-plus-circle"></i></a></h6>

                        <div class="pb-4">
                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-2.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status online"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Jackson Therry</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">Everyone realizes why a new common language.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-4.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status away"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Charles Deakin</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">The languages only differ in their grammar.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-5.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status online"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Ryan Salting</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">If several languages coalesce the grammar of the resulting.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-6.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status online"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Sean Howse</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">It will seem like simplified English.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-7.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status busy"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Dean Coward</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">The new common language will be more simple.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-8.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status away"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Hayley East</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">One could refuse to pay expensive translators.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <div class="text-center mt-3">
                                <a href="javascript:void(0);" class="btn btn-sm btn-white">
                                    <i class="mdi mdi-spin mdi-loading me-2"></i>
                                    Load more
                                </a>
                            </div>
                        </div>

                    </div>

                    <div class="tab-pane" id="tasks-tab" role="tabpanel">
                        <h6 class="fw-medium p-3 m-0 text-uppercase">Working Tasks</h6>
                        <div class="px-2">
                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">App Development<span class="float-end">75%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Database Repair<span class="float-end">37%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 37%" aria-valuenow="37" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Backup Create<span class="float-end">52%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 52%" aria-valuenow="52" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>
                        </div>

                        <h6 class="fw-medium mb-0 mt-4 text-uppercase">Upcoming Tasks</h6>

                        <div>
                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Sales Reporting<span class="float-end">12%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 12%" aria-valuenow="12" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Redesign Website<span class="float-end">67%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 67%" aria-valuenow="67" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">New Admin Design<span class="float-end">84%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 84%" aria-valuenow="84" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>
                        </div>

                        <div class="p-3 mt-2 d-grid">
                            <a href="javascript: void(0);" class="btn btn-success waves-effect waves-light">Create Task</a>
                        </div>

                    </div>

                    <div class="tab-pane active" id="settings-tab" role="tabpanel">

                        <div class="mt-n3">
                            <h6 class="fw-medium py-2 px-3 font-13 text-uppercase bg-light mx-n3 mt-n3 mb-3">
                                <span class="d-block py-1">Theme Settings</span>
                            </h6>
                        </div>

                        <div class="alert alert-warning" role="alert">
                            <strong>Customize </strong> the overall color scheme, sidebar menu, etc.
                        </div>

                        <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Color Scheme</h5>

                        <div class="colorscheme-cardradio">
                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-bs-theme" id="layout-color-light" value="light">
                                    <label class="form-check-label" for="layout-color-light">Light</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-bs-theme" id="layout-color-dark" value="dark">
                                    <label class="form-check-label" for="layout-color-dark">Dark</label>
                                </div>
                            </div>
                        </div>

                        <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Content Width</h5>
                        <div class="d-flex flex-column gap-2">
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="data-layout-width" id="layout-width-default" value="default">
                                <label class="form-check-label" for="layout-width-default">Fluid (Default)</label>
                            </div>

                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="data-layout-width" id="layout-width-boxed" value="boxed">
                                <label class="form-check-label" for="layout-width-boxed">Boxed</label>
                            </div>
                        </div>

                        <div id="layout-mode">
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Layout Mode</h5>

                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-layout-mode" id="layout-mode-default" value="default">
                                    <label class="form-check-label" for="layout-mode-default">Default</label>
                                </div>


                                <div id="layout-detached">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" name="data-layout-mode" id="layout-mode-detached" value="detached">
                                        <label class="form-check-label" for="layout-mode-detached">Detached</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Topbar Color</h5>

                        <div class="d-flex flex-column gap-2">
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="data-topbar-color" id="topbar-color-light" value="light">
                                <label class="form-check-label" for="topbar-color-light">Light</label>
                            </div>

                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="data-topbar-color" id="topbar-color-dark" value="dark">
                                <label class="form-check-label" for="topbar-color-dark">Dark</label>
                            </div>

                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="data-topbar-color" id="topbar-color-brand" value="brand">
                                <label class="form-check-label" for="topbar-color-brand">Brand</label>
                            </div>
                        </div>

                        <div>
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Menu Color</h5>

                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-color" id="leftbar-color-light" value="light">
                                    <label class="form-check-label" for="leftbar-color-light">Light</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-color" id="leftbar-color-dark" value="dark">
                                    <label class="form-check-label" for="leftbar-color-dark">Dark</label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-color" id="leftbar-color-brand" value="brand">
                                    <label class="form-check-label" for="leftbar-color-brand">Brand</label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-color" id="leftbar-color-gradient" value="gradient">
                                    <label class="form-check-label" for="leftbar-color-gradient">Gradient</label>
                                </div>
                            </div>
                        </div>

                        <div id="menu-icon-color">
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Menu Icon Color</h5>

                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-two-column-color" id="twocolumn-menu-color-light" value="light">
                                    <label class="form-check-label" for="twocolumn-menu-color-light">Light</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-two-column-color" id="twocolumn-menu-color-dark" value="dark">
                                    <label class="form-check-label" for="twocolumn-menu-color-dark">Dark</label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-two-column-color" id="twocolumn-menu-color-brand" value="brand">
                                    <label class="form-check-label" for="twocolumn-menu-color-brand">Brand</label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-two-column-color" id="twocolumn-menu-color-gradient" value="gradient">
                                    <label class="form-check-label" for="twocolumn-menu-color-gradient">Gradient</label>
                                </div>
                            </div>
                        </div>

                        <div>
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Menu Icon Tone</h5>

                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-icon" id="menu-icon-default" value="default">
                                    <label class="form-check-label" for="menu-icon-default">Default</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-icon" id="menu-icon-twotone" value="twotones">
                                    <label class="form-check-label" for="menu-icon-twotone">Twotone</label>
                                </div>
                            </div>
                        </div>

                        <div id="sidebar-size">
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Sidebar Size</h5>

                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-default" value="default">
                                    <label class="form-check-label" for="leftbar-size-default">Default</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-compact" value="compact">
                                    <label class="form-check-label" for="leftbar-size-compact">Compact (Medium Width)</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-small" value="condensed">
                                    <label class="form-check-label" for="leftbar-size-small">Condensed (Icon View)</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-full" value="full">
                                    <label class="form-check-label" for="leftbar-size-full">Full Layout</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-fullscreen" value="fullscreen">
                                    <label class="form-check-label" for="leftbar-size-fullscreen">Fullscreen Layout</label>
                                </div>
                            </div>
                        </div>

                        <div id="sidebar-user">
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Sidebar User Info</h5>

                            <div class="form-check form-switch">
                                <input type="checkbox" class="form-check-input" name="data-sidebar-user" id="sidebaruser-check">
                                <label class="form-check-label" for="sidebaruser-check">Enable</label>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="offcanvas-footer border-top py-2 px-2 text-center">
                <div class="d-flex gap-2">
                    <button type="button" class="btn btn-light w-50" id="reset-layout">Reset</button>
                    <a href="https://1.envato.market/uboldadmin" class="btn btn-danger w-50" target="_blank"><i class="mdi mdi-basket me-1"></i> Buy</a>
                </div>
            </div>
        </div>
        
        
        
        <script>
    		 // 게시글 페이지 이동 (ajax)                   
        	$(document).ready(function(){
        		$('.ajax-pageMove').click(function(event){
        			event.preventDefault(); // 링크 이벤트x
        			
        			var url = $(this).data('url');
        			loadPage(url);
        		});
        	});
        	
        	// 게시글 페이지 이동 (ajax)
        	function loadPage(url){
        		
        		console.log(url);
        		
        		$.ajax({
        			url: url,
        			type: 'get' ,
        			success: function(response){
        				$('#list-page').empty();
        				
        				
        				console.log(response);
        				var list = $(response).find('#list-page').html();
        				$('#list-page').html(list);
        			},
        			error: function(){
        				console.log("전체글 ajax 통신 실패")
        			}
        		})
        		
        	}
        	
         // 게시글 카테고리 밑줄 활성화
         function activateMenuItem(element) {
         	  // 모든 메뉴 항목의 활성 클래스 제거
         	  var categoryItems = document.querySelectorAll('.category a');
         	  categoryItems.forEach(function(item) {
         	    item.classList.remove('active');
         	  });
         	  
         	  // 클릭한 메뉴 항목에 활성 클래스 추가
         	  element.classList.add('active');
         	}
         
      	 // 글쓰기 페이지로 이동
         function insertPage(){
 			location.href ="${contextPath}/board/boardInsert.page"
 		}
        
        </script>
        
    </body>
</html>