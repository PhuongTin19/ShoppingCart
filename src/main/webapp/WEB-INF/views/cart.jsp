<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
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
<%-- --%>		<%@include file="header.jsp"%> 
        <div class="cart-main-area ptb-100 ptb-sm-60">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <!-- Form Start -->
                        <form action="#">
                            <!-- Table Content Start -->
                            <div class="table-content table-responsive mb-45">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="product-thumbnail">Image</th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-subtotal">Total</th>
                                            <th class="product-remove">Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach var="item" items="${currentCart.listDetail}" >
	                                    	<form >
		                                        <tr>
		                                            <td class="product-thumbnail">
		                                                <a href="#"><img src="img/${item.value.image}" alt="cart-image"></a>
		                                            </td>
		                                            <td class="product-name"><a href="#">${item.value.name }</a></td>
		                                            <td class="product-price"><span class="amount">${item.value.price}</span></td>
		                                            <td class="product-quantity">
		                                            	<input onclick="addToCart(${item.value.productId})" type="number" value="${item.value.quantity}"
															  style="width: 50px;">
															  <!--onchange="updateProduct(${item.key})"    -->
		                                            </td>
		                                            <td class="product-subtotal">${item.value.price * item.value.quantity}đ</td>
		                                            <td class="product-remove"> <a href="/removeCart?productId=${item.value.productId}"><i class="fa fa-times" aria-hidden="true"></i></a></td>
		                                       		
		                                        </tr>
		                                     </form>
        								</c:forEach>
                                    </tbody>
                                </table>
                            </div>
	                         <label>Address</label> 
	                         <input value="${user.address}" id="address" class="form-control w-25">
                            <label>Phone</label> 
                          	<input value="${user.phone}" id="phone_number" class="form-control w-25">
                          	
                            <!-- Table Content Start -->
                            <div class="row">
                               <!-- Cart Button Start -->
                                <div class="col-md-8 col-sm-12">

                                    <div class="buttons-cart">
                                        <a href="/index">Continue Shopping</a>
                                    </div>
                                </div>
                                <!-- Cart Button Start -->
                                <!-- Cart Totals Start -->
                                <div class="col-md-4 col-sm-12">
                                    <div class="cart_totals float-md-right text-md-right">
                                        <h2>Cart Totals</h2>
                                        <br>
                                        <table class="float-md-right">
                                            <tbody>
                                                <tr class="order-total">
                                                    <th>Quantity</th>
                                                    <td>
                                                        <strong><span >${currentCart.totalQuantity}</span></strong>
                                                    </td>
                                                   
                                                </tr>
                                                <tr class="order-total">
                                                 <th>Total</th>
                                                    <td>
                                                        <strong><span class="amount">${currentCart.totalPrice}</span></strong>
                                                    </td>
                                                 </tr>
                                                
                                            </tbody>
                                        </table>
                                        <div class="wc-proceed-to-checkout">
                                            <input type="submit" value="checkout" onclick="checkout()">
                                        </div>
                                    </div>
                                </div>
                                <!-- Cart Totals End -->
                            </div>
                            <!-- Row End -->
                        </form>
                        <!-- Form End -->
                    </div>
                </div>
                 <!-- Row End -->
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </div>
    <script type="text/javascript">
    function name123() {
		alert('hello');
	}
    </script>
    	<script type="text/javascript">
    	
	  	function checkout() {
			var address = $('#address').val();
			var phone = $('#phone_number').val();
			var endpoint = '/api/cart/checkout?address=' + address + '&phone=' + phone;
			
			$.ajax({
				url: endpoint,
				type: 'GET',
				statusCode: {
					201: handle201,
					202: handle202,
					200: handle200,
					400: handle400,
					403: handle403
				}
			});
		
		}
		
		function handle200() {
			alert('Thanh toán thành công');
			window.location.href = '/index';
		}
		function handle201() {
			alert('Thanh toán thành công');
			window.location.href = '/index';
		}
		function handle202() {
			alert('Thanh toán thành công');
			window.location.href = '/index';
		}
		function handle400() {
			alert('Thanh toán thất bại.Vui lòng kiểm tra lại');
		}
		function handle403() {
			alert('Đăng nhập trước khi thanh toán');
			window.location.href = '/login';
		}
  	</script>
   <!--	--><script type="text/javascript">
	  	function addToCart(productId) {
			var urlApi = '/api/cart/update?productId=' + productId + '&quantity=1&isReplace=false';
			$.ajax({
				url: urlApi,
				type: 'GET',
				dataType: 'json',
				success: function(data) {
					$('#headerTotalQuantity').text(data.totalQuantity);
				},
				error: function(error){
					console.log(error);
				}
			})
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