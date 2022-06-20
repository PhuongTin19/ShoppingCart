<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>
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
        <div class="main-product-thumbnail ptb-100 ptb-sm-60">
            <div class="container">
                <div class="thumb-bg">
                        	
                    <div class="row">
                    	
                    	<c:forEach var="item" items="${list}">
                        <!-- Main Thumbnail Image Start -->
                        
                        <div class="col-lg-5 mb-all-40">
                            <!-- Thumbnail Large Image start -->
                            <div class="tab-content">
                                <div id="thumb1" class="tab-pane fade show active">
                                    <a data-fancybox="images" href="img\products\35.jpg">
	                                    <img name="id" src="img/${item.image}" alt="product-view">
                                    </a>
                                </div>
                             
                            </div>
                        </div>
                        <!-- Main Thumbnail Image End -->
                        <!-- Thumbnail Description Start -->
                        <div class="col-lg-7">
                            <div class="thubnail-desc fix">
                                <h2>${item.name }</h2>
                                <div class="rating-summary fix mtb-10">
                                    <div >
                                       Chất liệu:${item.material }
                                    </div>
                                    <div style="margin-top: 30px">
                                       Loại sản phẩm: ${itemsC.name}
                                    </div>
                                </div>
                                <h5>${item.description }</h5>
                                <div class="pro-price mtb-30">
                                    <p class="d-flex align-items-center"><span class="price text-danger">${item.price }đ</span></p>
                                </div>
                                
                              
                                <div class="box-quantity d-flex hot-product2">
                                    <div class="pro-actions">
                                        <div class="actions-primary">
                                            <a onclick="addToCart(${item.id})" title="" data-original-title="Add to cart"> + Add To Cart</a>
                                        </div>
                                 
                                    </div>
                                </div>
                           
                              
                            </div>
                        </div>
                       
                  		</c:forEach>
                  		
                  			
                    </div>
                    <!-- Row End -->
                </div>
            </div>
            <!-- Container End -->
        </div>
		<%@include file="footer.jsp"%>
	<script type="text/javascript">
		function addToCart(productId) {
			var urlApi = '/api/cart/update?productId=' + productId + '&quantity=1&isReplace=false';
			$.ajax({
				url: urlApi,
				type: 'GET',
				dataType: 'json',
				success: function(data) {
					alert('Thêm thành công')
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