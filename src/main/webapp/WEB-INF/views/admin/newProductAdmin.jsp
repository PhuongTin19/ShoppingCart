<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="/plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="/plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="/plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
 <div class="wrapper">

       <%@include file="menuAdmin.jsp"%>

        <div id="divThongBao">
            <div id="thongBao" style="display: none;" role="alert" align="center">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
                <span id="errorMessage" >${errorMessage}</span>
                <span id="succeedMessage" >${succeedMessage}</span>
            </div>
        </div>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Quản lý người dùng</h1>
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

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                  
                    <!-- /.row -->


                    <div class="row">
                        <!-- left column -->
                        <div class="col-12">
                            <!-- general form elements -->
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">User Details</h3>
                                </div>
                                <!-- /.card-header -->
                                <!-- form start -->
                                <form:form  modelAttribute="productRequest" action="/admin/product/update"> 
                                     <div class="card-body">
                                        <div class="row">
                                            <div class="col-8">
                                            	<div class="form-group">
                                                    <label for="">Id</label>
                                                    <form:input  name="id"  path="id" class="form-control"  />
                                                </div>
                                                <div class="form-group">
                                                    <label for="">Name</label>
                                                    <form:input  name="name"  path="name" class="form-control"  placeholder="Name" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="">Price</label>
                                                    <form:input name="price" class="form-control" id="price" path="price" placeholder="Price" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="">Description</label>
                                                	<form:input  name="description"  class="form-control" id="description"  path="description" placeholder="Description" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="">Quantity</label>
                                                    <form:input name="quantity" class="form-control"  id="quantity"  path="Quantity" placeholder="Quantity" />
                                                </div>
                                                <div class="form-group">
                                                	<label for="">Color</label>
	                                                <form:select name="color" class="form-control" path="color">
	                                                	<c:forEach var="item" items="${itemsColor}">
											            	 <form:option value="${item.id}">${item.name}</form:option>
											             </c:forEach>
													</form:select>	
												</div>	
												<div class="form-group">
                                                	<label for="">Category</label>
	                                                <form:select name="category" class="form-control" path="category">
	                                                	<c:forEach var="item" items="${itemsC}">
											            	 <form:option value="${item.id}">${item.name}</form:option>
											             </c:forEach>
													</form:select>	
												</div>	
                                            </div>
                                            <div class="col-4">
                                                <!-- Profile Image -->
                                                <div class="card card-primary card-outline">
                                                    <div class="card-body box-profile">
                                                        <div class="text-center">
                                                            <img name="image" src="/img/${param.image}"  id="output" class="profile-user-img img-fluid img-circle" style="width: 212px; height: 212px"alt="User profile picture" >
                                                        </div>
                                                        <br/>
                                                        <div class="form-group">
                                                            <label for="inputFile">Avatar</label>
                                                            <div class="input-group">
                                                                <div class="custom-file">
                                                                    <p><input path="image" type="file" accept="image/*" name="image" id="file" onchange="loadFile(event)" style="display: none;"></p>
									    							<p><label for="file" style="cursor: pointer;">Upload Image</label></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /.card-body -->
                                                </div>
                                                <!-- /.card -->
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.card-body -->
                                    <div class="card-footer">
                                       <button class="btn btn-success">Update</button>
                                       <button formaction="/admin/product/create" class="btn btn-primary">Create</button>
                                    </div>
                                </form:form>
                                	
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>
                    <!-- /.container-fluid -->
            </section>
            <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <footer class="main-footer">
                <strong>Copyright &copy; 2014-2021 <a
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
        <script src="/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
        <script src="/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
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
            $(document).ready(function() {
                $("#example1").DataTable({
                    "pageLength": 5,
                    "responsive": true,
                    "lengthChange": false,
                    "autoWidth": false,
                    "buttons": ["csv", "excel", "pdf", "print"]
                }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
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
                    scrollTop: $('#form').offset().top
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
                        scrollTop: $('#form').offset().top
                    }, 1000);
                    $('#form :input').prop('readonly', false);
                    $('input#username').prop('readonly', true);
                    $('#submitUpdate').prop('disabled', false);
                    $('#form').prop('action', '/admin/user/edit');
                });
            }

         
        </script>
        
    <<script>
        var loadFile = function(event) {
            var image = document.getElementById('output');
            image.src = URL.createObjectURL(event.target.files[0]);
        };
    </script>
</body>
</html>