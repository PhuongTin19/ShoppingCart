<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        	<li><span>Language</span> 
                                <!-- Dropdown Start -->
                                <ul class="ht-dropdown">
                                    <li><a href="/index?lang=en"><img src="img\header\1.jpg" alt="language-selector">English</a></li>
                                    <li><a href="/index?lang=vn"><img src="https://investone-law.com/wp-content/uploads/2019/06/quoc-ky-viet-nam.jpg" height="12px" alt="language-selector">VietNam</a></li>
                                </ul>
                                <!-- Dropdown End -->
                            </li>                                   
                            <li><a href="#">My accout<i class="lnr lnr-chevron-down"></i></a>
                                <ul class="ht-dropdown">
                          
                                    <li><a href="/login">Login</a></li>
                                    <li><a href="register">Register</a></li>
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
                                    <li>Xin chào,${user.username}</li>
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
                                
                                    <li><a href="/shop"> Shop<i class="fa fa-angle-down"></i></a>
                                        <ul class="ht-dropdown dropdown-style-two">
                                            <li><a href="/cart">cart</a>
                                            </li>
                                        </ul>
                                    </li>
                          
                                    <li><a href="#">Pages<i class="fa fa-angle-down"></i></a>
                                        <!-- Home Version Dropdown Start -->
                                        <ul class="ht-dropdown dropdown-style-two">
                                            <li><a href="register">register</a></li>
                                            <c:if test="${user.username == null}">
                                            	<li><a href="/login">sign in</a></li>
                                            </c:if>
                                            <c:if test="${user.username != null}">
                                            	<li><a href="/logoff">log off</a></li>
                                            </c:if>
                                            <li><a href="/forgot">forgot password</a></li>
                                             <c:if test="${user.username != null}">
                                            	<li><a href="/edit-profile">edit profile</a></li>
                                            </c:if>
                                        </ul>
                                    </li>
                                    <li><a href="/about">About Us</a></li>
                                    <li><a href="/contact">Contact Us</a></li>
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

        