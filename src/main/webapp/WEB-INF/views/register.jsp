<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicons -->
    <link rel="shortcut icon" href="img\favicon.ico">
    <!-- Fontawesome css -->
    <link rel="stylesheet" href="css\font-awesome.min.css">
    <!-- Ionicons css -->
    <link rel="stylesheet" href="css\ionicons.min.css">
    <!-- linearicons css -->
    <link rel="stylesheet" href="css\linearicons.css">
    <!-- Nice select css -->
    <link rel="stylesheet" href="css\nice-select.css">
    <!-- Jquery fancybox css -->
    <link rel="stylesheet" href="css\jquery.fancybox.css">
    <!-- Jquery ui price slider css -->
    <link rel="stylesheet" href="css\jquery-ui.min.css">
    <!-- Meanmenu css -->
    <link rel="stylesheet" href="css\meanmenu.min.css">
    <!-- Nivo slider css -->
    <link rel="stylesheet" href="css\nivo-slider.css">
    <!-- Owl carousel css -->
    <link rel="stylesheet" href="css\owl.carousel.min.css">
    <!-- Bootstrap css -->
    <link rel="stylesheet" href="css\bootstrap.min.css">
    <!-- Custom css -->
    <link rel="stylesheet" href="css\default.css">
    <!-- Main css -->
    <link rel="stylesheet" href="style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="css\responsive.css">

    <!-- Modernizer js -->
    <script src="js\vendor\modernizr-3.5.0.min.js"></script>
</head>
<body>
 		<%@include file="header.jsp"%>
        <div class="register-account ptb-100 ptb-sm-60">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="register-title">
                            <h3 class="mb-10">REGISTER ACCOUNT</h3>
                            <p class="mb-10">If you already have an account with us, please login at the login page.</p>
                        </div>
                    </div>
                </div>
                <!-- Row End -->
                <div class="row">
                    <div class="col-sm-12">
                        <form:form action="/register/add" modelAttribute="item" >
                            <fieldset >
                            	
                                <legend >Your Personal Details</legend>
						   		<div style="margin-top: 20px">
	                                <div class="form-group d-md-flex align-items-md-center">
	                                    <label class="control-label col-md-2" for="f-name"><span class="require">*</span>Username</label>
	                                    <div class="col-md-10 w-100">
	                                        <form:input  class="form-control" path="username" placeholder="username" />
	                                    </div>
	                                </div>
	                                <div class="form-group d-md-flex align-items-md-center">
	                                    <label class="control-label col-md-2" for="l-name"><span class="require">*</span>Password</label>
	                                    <div class="col-md-10">
	                                        <form:password class="form-control" path="password" placeholder="Password" />
	                                    </div>
	                                </div>
	                                 <div class="form-group d-md-flex align-items-md-center">
	                                    <label class="control-label col-md-2" for="f-name"><span class="require">*</span>Fullname</label>
	                                    <div class="col-md-10">
	                                    	<form:input class="form-control" path="fullname" placeholder="Fullname" />
	                                    </div>
	                                </div>
	                                <div class="form-group d-md-flex align-items-md-center">
	                                    <label class="control-label col-md-2" for="email"><span class="require">*</span>Email</label>
	                                    <div class="col-md-10">
	                                    	<form:input class="form-control" path="email" placeholder="Email" />
	                                    </div>
	                                </div>
	                                <div class="form-group d-md-flex align-items-md-center">
	                                    <label class="control-label col-md-2" ><span class="require">*</span>Email</label>
	                                    <div class="col-md-10">
	                                    	<form:input class="form-control" path="phone" placeholder="Phone" />
	                                    </div>
	                                </div>
	                                <div class="form-group d-md-flex align-items-md-center">
	                                    <label class="control-label col-md-2" ><span class="require">*</span>Address</label>
	                                    <div class="col-md-10">
	                                    	<form:input class="form-control" path="Address" placeholder="Address" />
	                                    </div>
	                                </div>
                               		<i style="color:red;font-size:20px">${param.message}</i>
                                </div>
                            </fieldset>
                            <div class="terms">
                                <div class="float-md-right">
                                    <button class="btn btn-success" formaction="/register/add">Register</button>
                                </div>
                            </div>
                            
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
		<%@include file="footer.jsp"%>
    </div>
    <!-- Main Wrapper End Here -->

    <!-- jquery 3.2.1 -->
    <script src="js\vendor\jquery-3.2.1.min.js"></script>
    <!-- Countdown js -->
    <script src="js\jquery.countdown.min.js"></script>
    <!-- Mobile menu js -->
    <script src="js\jquery.meanmenu.min.js"></script>
    <!-- ScrollUp js -->
    <script src="js\jquery.scrollUp.js"></script>
    <!-- Nivo slider js -->
    <script src="js\jquery.nivo.slider.js"></script>
    <!-- Fancybox js -->
    <script src="js\jquery.fancybox.min.js"></script>
    <!-- Jquery nice select js -->
    <script src="js\jquery.nice-select.min.js"></script>
    <!-- Jquery ui price slider js -->
    <script src="js\jquery-ui.min.js"></script>
    <!-- Owl carousel -->
    <script src="js\owl.carousel.min.js"></script>
    <!-- Bootstrap popper js -->
    <script src="js\popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js\bootstrap.min.js"></script>
    <!-- Plugin js -->
    <script src="js\plugins.js"></script>
    <!-- Main activaion js -->
    <script src="js\main.js"></script>
</body>
</html>