<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>shop</title>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css"
	media="screen">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<!-- Favicons -->
<link rel="shortcut icon" href="img\favicon.ico">
<!-- Fontawesome css -->
<link rel="stylesheet" href="\css\font-awesome.min.css">
<!-- Ionicons css -->
<link rel="stylesheet" href="\css\ionicons.min.css">
<!-- linearicons css -->
<link rel="stylesheet" href="\css\linearicons.css">
<!-- Nice select css -->
<link rel="stylesheet" href="\css\nice-select.css">
<!-- Jquery fancybox css -->
<link rel="stylesheet" href="\css\jquery.fancybox.css">
<!-- Jquery ui price slider css -->
<link rel="stylesheet" href="\css\jquery-ui.min.css">
<!-- Meanmenu css -->
<link rel="stylesheet" href="\css\meanmenu.min.css">
<!-- Nivo slider css -->
<link rel="stylesheet" href="\css\nivo-slider.css">
<!-- Owl carousel css -->
<link rel="stylesheet" href="\css\owl.carousel.min.css">
<!-- Bootstrap css -->
<link rel="stylesheet" href="\css\bootstrap.min.css">
<!-- Custom css -->
<link rel="stylesheet" href="\css\default.css">
<!-- Main css -->
<link rel="stylesheet" href="style.css">
<!-- Responsive css -->
<link rel="stylesheet" href="css\responsive.css">

<!-- Modernizer js -->
<script src="js\vendor\modernizr-3.5.0.min.js"></script>
</head>
<body>

	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer"/>
	<!-- Cart -->
	<script type="text/javascript">
		function addToCart(productId) {
			var urlApi = '/api/cart/update?productId=' + productId + '&quantity=1&isReplace=false';
			$.ajax({
				url: urlApi,
				type: 'GET',
				dataType: 'json',
				success: function(data) {
					alert('Đã thêm vào giỏ hàng')
					$('#headerTotalQuantity').text(data.totalQuantity);
				},
				error: function(error){
					console.log(error);
				}
			})
			location.reload();
		}
	</script>

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
