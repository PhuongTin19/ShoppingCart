<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="/plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<%@include file="menuAdmin.jsp"%>

		

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Quản lý đơn hàng</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/admin/">Home</a></li>
								<li class="breadcrumb-item active">User</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>


			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">Lịch sử</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<table class="table table-bordered table-striped">
										<thead>
											<tr>
												<th>Id</th>
												<th>Username</th>
												<th>address</th>
												<th>phone</th>
												<th>createDate</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${listOrder.content}">
												<tr>
													<!---->
													<td>${item.id}</td>
													<td>${item.account.username}</td>
													<td>${item.address}</td>
													<td>${item.phone}</td>
													<td>${item.createDate}</td>
													<td align="center">
	                                                    <a class="btn btn-success" href="/order/edit?id=${item.id}&username=${item.account.username}&address=${item.address}&phone=${item.phone}">
															<i class="fa fa-edit" aria-hidden="true"></i>
														</a>
	                                                </td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div style="text-align: center;">
		<a class="btn btn-danger" href="/order?p=0"><i class="bi bi-arrow-bar-left"></i></a>
		<a class="btn btn-danger" href="/order?p=${listOrder.number-1}"><i class="bi bi-arrow-left"></i></a>
		<a class="btn btn-danger" href="/order?p=${listOrder.number+1}"><i class="bi bi-arrow-right"></i></a>
		<a class="btn btn-danger" href="/order?p=${listOrder.totalPages-1}"><i class="bi bi-arrow-bar-right"></i></a>
	</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			
		</div>
		<!-- /.content-wrapper -->

		<footer class="main-footer">
			<strong>Copyright &copy; 2022 <a
				href="https://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
			<div class="float-right d-none d-sm-inline-block">
				<b>Version</b> 3.1.0
			</div>
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- DataT/Plugins -->
	<script src="/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script src="/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script src="/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="/plugins/jszip/jszip.min.js"></script>
	<script src="/plugins/pdfmake/pdfmake.min.js"></script>
	<script src="/plugins/pdfmake/vfs_fonts.js"></script>
	<script src="/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script src="/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script src="/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/dist/js/demo.js"></script>
	<!-- Page specific script -->
	<script>
		$(document).ready(
				function() {
					$("#example1").DataTable({
						"pageLength" : 5,
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "csv", "excel", "pdf", "print" ]
					}).buttons().container().appendTo(
							'#example1_wrapper .col-md-6:eq(0)');
				});

		$(document).ready(function() {
			var errorMessage = $('#errorMessage').text();
			var succeedMessage = $('#succeedMessage').text();

			if (errorMessage.length > 0) {
				$('#thongBao').addClass('alert alert-danger');
				$('#thongBao').css('display', 'block');
			}

			if (succeedMessage.length > 0) {
				$('#thongBao').addClass('alert alert-success');
				$('#thongBao').css('display', 'block');
			}
		});

		$('#createBtn').click(function() {
			$('html, body').animate({
				scrollTop : $('#form').offset().top
			}, 1000);
			$('#form :input').prop('readonly', false);
			$('#submitCreate').prop('disabled', false);
			$('#form').prop('action', '/admin/user/create');
		});

		$('#submitCreate').click(function() {
			$('#form').submit();
		});

		function editUser(username) {
			var url = '/admin/user/edit?username=' + username;
			$.get(url).done(function(data) {
				$('#form').replaceWith(data);
				$('html, body').animate({
					scrollTop : $('#form').offset().top
				}, 1000);
				$('#form :input').prop('readonly', false);
				$('input#username').prop('readonly', true);
				$('#submitUpdate').prop('disabled', false);
				$('#form').prop('action', '/admin/user/edit');
			});
		}
	</script>

	<
	<script>
		var loadFile = function(event) {
			var image = document.getElementById('output');
			image.src = URL.createObjectURL(event.target.files[0]);
		};
	</script>
</body>
</html>