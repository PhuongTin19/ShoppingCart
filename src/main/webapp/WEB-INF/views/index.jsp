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
	<div class="wrapper">
        <div class="popup_banner">
            <span class="popup_off_banner">×</span>
            <div class="banner_popup_area">
                    <img src="https://tmluxury.vn/wp-content/uploads/banner-do-shop-thoi-trang-nam-tphcm-tmluxury.jpg" height="290px" alt="">
            </div>
        </div>
        <div class="popup_wrapper">
            <div class="test">
                <span class="popup_off">Close</span>
                <div class="subscribe_area text-center mt-60">
                    <h2>Newsletter</h2>
                    <p>Subscribe to the Truemart mailing list to receive updates on new arrivals, special offers and other discount information.</p>
                    <div class="subscribe-form-group">
                        <form action="#">
                            <input autocomplete="off" type="text" name="message" id="message" placeholder="Enter your email address">
                            <button type="submit">subscribe</button>
                        </form>
                    </div>
                    <div class="subscribe-bottom mt-15">
                        <input type="checkbox" id="newsletter-permission">
                        <label for="newsletter-permission">Don't show this popup again</label>
                    </div>
                </div>
            </div>
        </div>
        <header>
            <div class="header-top-area">
                <div class="container">
                    <!-- Header Top Start -->
                    <div class="header-top">
                        <ul>       
                        	<li><span><spring:message code="label.language" /></span> 
                                <!-- Dropdown Start -->
                                <ul class="ht-dropdown">
                                    <li><a href="/index?lang=en"><img src="img\header\1.jpg" alt="language-selector"><spring:message code="label.english" /></a></li>
                                    <li><a href="/index?lang=vn"><img src="https://investone-law.com/wp-content/uploads/2019/06/quoc-ky-viet-nam.jpg" height="12px" alt="language-selector"><spring:message code="label.vietnam" /></a></li>
                                </ul>
                                <!-- Dropdown End -->
                            </li>                                   
                            <li><a href="#"><spring:message code="label.account" /><i class="lnr lnr-chevron-down"></i></a>
                                <ul class="ht-dropdown">
                          
                                    <li><a href="/login"><spring:message code="label.signin" /></a></li>
                                    <li><a href="register"><spring:message code="label.register" /></a></li>
                                </ul>
                            </li> 
                        </ul>
                    </div>
                </div>
            </div>
            <div class="header-middle ptb-15">
                <div class="container">
                    <div class="row align-items-center no-gutters">
                        <div class="col-lg-3 col-md-12">
                            <div class="logo mb-all-30">
                                <a href="/index"><img src="img\logo\logo.png" alt="logo-image"></a>
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-8 ml-auto mr-auto col-10">
                            <div class="categorie-search-box">
                                <form action="/search" >
                                    <input type="text" name="keywords" value="${param.keywords}" placeholder="I’m shopping for...">
                                    <button><i class="lnr lnr-magnifier"></i></button>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="cart-box mt-all-30">
                                <ul class="d-flex justify-content-lg-end justify-content-center align-items-center">
                                    <li>
                                    	<a href="/cart">
                                    		<i  class="lnr lnr-cart"></i><span  class="my-cart"><span  class="total-pro" id="headerTotalQuantity" >${currentCart.totalQuantity}  </span><span>cart</span></span>
                                    	</a>
                                    	
	                                        <ul class="ht-dropdown cart-box-width">
	                                            <li>
	                                            	<c:forEach var="item" items="${currentCart.listDetail}">
		                                                <div class="single-cart-box">
		                                                    <div class="cart-img">
		                                                        <a href="#"><img src="img/${item.value.image}" alt="cart-image"></a>
		                                                    </div>
		                                                    <div class="cart-content">
		                                                        <h6><a href="#">${item.value.name }</a></h6>
		                                                        <span class="amount">Số lượng:${item.value.quantity}</span>
		                                                        <span class="amount">Giá:${item.value.price * item.value.quantity}</span>
		                                                    </div>
		                                                    <a class="del-icone" href="/removeCartIndex?productId=${item.value.productId}"><i class="ion-close"></i></a>
		                                                </div>
	                                                 </c:forEach>
	                                            </li>
	                                        </ul>
                                       
                                    </li>
                                    <li><spring:message code="label.hello" />${user.username}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-bottom  header-sticky">
                <div class="container">
                    <div class="row align-items-center">
                         <div class="col-xl-3 col-lg-4 col-md-6 vertical-menu d-none d-lg-block">
                            <span class="categorie-title">Shop by Categories</span>
                        </div>                       
                        <div class="col-xl-9 col-lg-8 col-md-12 ">
                            <nav class="d-none d-lg-block">
                                <ul class="header-bottom-list d-flex">
                                
                                    <li><a href="/shop"> <spring:message code="label.shop" /><i class="fa fa-angle-down"></i></a>
                                        <ul class="ht-dropdown dropdown-style-two">
                                            <li><a href="/cart"><spring:message code="label.cart" /></a>
                                            </li>
                                        </ul>
                                    </li>
                          
                                    <li><a href="#"><spring:message code="label.pages" /><i class="fa fa-angle-down"></i></a>
                                        <!-- Home Version Dropdown Start -->
                                        <ul class="ht-dropdown dropdown-style-two">
                                            <li><a href="register"><spring:message code="label.register" /></a></li>
                                            <c:if test="${user.username == null}">
                                            	<li><a href="/login"><spring:message code="label.signin" /></a></li>
                                            </c:if>
                                            <c:if test="${user.username != null}">
                                            	<li><a href="/logoff"><spring:message code="label.logof" /></a></li>
                                            </c:if>
                                            <li><a href="/forgot"><spring:message code="label.forgot" /></a></li>
                                             <c:if test="${user.username != null}">
                                            	 <li><a href="/edit-profile"><spring:message code="label.edit" /></a></li>
                                            </c:if>
                                           
                                        </ul>
                                    </li>
                                    <li><a href="/about"><spring:message code="label.about" /></a></li>
                                    <li><a href="/contact"><spring:message code="label.contact" /></a></li>
                                     <c:if test="${user.username != null}">
                                            <li><a href="/history">History</a></li>
                                    </c:if>
                                </ul>
                            </nav>
                            
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="main-page-banner home-3">
	<div class="main-shop-page pt-100 pb-100 ptb-sm-60">
		<div class="container">
			<!-- Row End -->
			<div class="row">
				<!-- Sidebar Shopping Option Start -->

				<div class="col-lg-3 order-2 order-lg-1">
					<div class="sidebar">
						<!-- Sidebar Electronics Categorie Start -->

						<!-- Sidebar Electronics Categorie End -->
						<!-- Price Filter Options Start -->
						<div class="search-filter mb-40">
							<form class="multi-range-field my-5 pb-5" action="searchByPrice"
								method="post">

								<h3 class="sidebar-title"><spring:message code="label.filterPrice" /></h3>
								<div data-role="rangeslider">
									<i style="margin-right: 10px; color: red"><spring:message code="label.min" />:</i><input
										style="width: 40px; border: 0; color: red" type="text"
										value="${param.min}"><br> <input
										style="width: 180px;" onchange="this.form.submit()"
										type="range" name="min" id="price-min" value="${param.min}"
										min="0" max="1000"><br> <i
										style="margin-right: 10px; color: red"><spring:message code="label.max" />:</i> <input
										style="width: 40px; border: 0;" type="text"
										;color:red"   value="${param.max}"><br> <input
										style="width: 180px; color: red" onchange="this.form.submit()"
										type="range" name="max" id="price-max" value="${param.max}"
										min="0" max="1000">

								</div>
							</form>
						</div>
						<!-- Price Filter Options End -->
						<!-- Sidebar Categorie Start -->

						<div class="sidebar-categorie mb-40">
							<h3 class="sidebar-title"><spring:message code="label.categories" /></h3>
							<ul class="sidbar-style">
								<c:forEach var="item" items="${itemsC}">
									<a href="filter?id=${item.id}">
										<li class="form-check"><label style="color: black"
											class="form-check-label" for=""><i
												style="margin-right: 30px" class="bi bi-caret-right-fill "></i>${item.name }</label>
									</li> <br>
									</a>
								</c:forEach>
							</ul>
						</div>

						<!-- Product Size End -->
						<!-- Product Color Start -->
						<div class="color mb-40">
							<h3 class="sidebar-title"><spring:message code="label.color" /></h3>
							<ul class="color-option sidbar-style">
								<c:forEach var="item" items="${itemsColor}">
									<a href="filterColor?cid=${item.id}">
										<li class="form-check"><span
											style="background-color: ${item.name}"></span> <label
											class="form-check-label" for="">${item.name }</label></li>
									</a>
								</c:forEach>
							</ul>
						</div>
						<!-- Product Color End -->
						<!-- Product Top Start -->
						<div class="top-new mb-40">
							<h3 class="sidebar-title"><spring:message code="label.topnew" /></h3>
							<div class="side-product-active owl-carousel">
								<!-- Side Item Start -->
								<div class="side-pro-item">
									<div class="row">
										<c:forEach var="item" items="${items4}">
											<!-- Single Product Start -->
											<div class="single-product single-product-sidebar">
												<!-- Product Image Start -->
												<div class="pro-img">
													<a href="/product?id=${item.id}"> <img
														class="primary-img" src="/img/${item.image}"
														alt="single-product">
													</a>
												</div>
												<!-- Product Image End -->
												<!-- Product Content Start -->
												<div class="pro-content">
													<h4>
														<a href="/product">${item.name }</a>
													</h4>
													<p>
														<span class="price">${item.price }</span>
													</p>
												</div>
												<!-- Product Content End -->
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<!-- Product Top End -->
						<!-- Single Banner Start -->
						<div class="col-img">
							<a href="/shop"><img src="img\banner\banner-sidebar.jpg"
								alt="slider-banner"></a>
						</div>
						<!-- Single Banner End -->
					</div>
				</div>
				<!-- Sidebar Shopping Option End -->
				<!-- Product Categorie List Start -->
				<div class="col-lg-9 order-1 order-lg-2">
					<!-- Grid & List View Start -->
					<div
						class="grid-list-top border-default universal-padding d-md-flex justify-content-md-between align-items-center mb-30">
						<div class="grid-list-view  mb-sm-15">
							<ul class="nav tabs-area d-flex align-items-center">
								<li><a class="active" data-toggle="tab" href="#grid-view"><i
										class="fa fa-th"></i></a></li>
								<li><a data-toggle="tab" href="#list-view"><i
										class="fa fa-list-ul"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="main-categorie mb-all-40">
						<!-- Grid & List Main Area End -->
						<div class="tab-content fix">
							<div id="grid-view" class="tab-pane fade show active">
								<div class="row">
									<c:forEach var="item" items="${items}">
										<!-- Single Product Start -->
										<div id="myTable" class="col-lg-4 col-4">

											<div class="single-product">

												<!-- Product Image Start -->
												<div class="pro-img">
													<input type="hidden" name="id" value="${item.id}">
													<a href="/product?id=${item.id }"> <img
														class="primary-img" src="/img/${item.image}"
														alt="single-product">
													</a> <a href="#" class="quick_view" data-toggle="modal"
														data-target="#myModal" title="Quick View"><i
														class="lnr lnr-magnifier"></i></a>
												</div>
												<!-- Product Image End -->
												<!-- Product Content Start -->
												<div class="pro-content">
													<div class="pro-info">
														<h4>
															<a href="/product">${item.name }</a>
														</h4>
														<p>
															<span class="price">${item.price }</span>
														</p>
													</div>
													<div class="pro-actions">
														<div class="actions-primary">
															<a onclick="addToCart(${item.id})" title="Add to Cart">
																+ Add To Cart
															</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="pro-pagination"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	 <footer class="off-white-bg2 pt-95 bdr-top pt-sm-55">
            <!-- Footer Top Start -->
            
            <!-- Footer Top End -->
            <!-- Footer Middle Start -->
            <div class="footer-middle text-center">
                <div class="container">
                    <div class="footer-middle-content pt-20 pb-30">
                            <ul class="social-footer">
                                <li><a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="https://twitter.com/"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="https://plus.google.com/"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="https://www.linkedin.com/"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><img src="img\icon\social-img1.png" alt="google play"></a></li>
                                <li><a href="#"><img src="img\icon\social-img2.png" alt="app store"></a></li>
                            </ul>
                    </div>
                </div>
                <!-- Container End -->
            </div>
            <!-- Footer Middle End -->
            <!-- Footer Bottom Start -->
            <div class="footer-bottom pb-30">
                <div class="container">

                     <div class="copyright-text text-center">                    
                        <p>Copyright © 2022 <a target="_blank" href="#">Truemart</a> All Rights Reserved.</p>
                     </div>
                </div>
            </div>
        </footer>



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