<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="stag" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<stag:url value="/" var="rootpath"/>
<fmt:setLocale value="${lag}"/>
<fmt:setBundle basename="language.mess_lag"/>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${rootpath}public/css/style.css">
    <link rel="stylesheet" href="${rootpath}public/plugin/dist/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="${rootpath}public/plugin/dist/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
</head>
<body>
    <!-- nenmoseacrch -->
    <div class="nenmosearch">
        <span>&times;</span>
        <div class="search-mo">
            <form>
                <input type="text" placeholder="Search here">
                <button><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
    </div>
    <!-- cart -->
    <div class="cart-max">
        <div class="cart-small">
            <div class="cart-small-content">
                <button><span>&times;</span></button>
                <div class="cart-small-body">
                    <h3 class="h31">My Cart (3)</h3>
                    <div class="products-cart-content">
                        <div class="products-cart">
                            <div class="products-cart-img">
                                <a href=""><img src="${rootpath}public/${rootpath}public/img/product14.png" alt=""></a>
                            </div>
                            <div class="products-cart-content">
                                <h3><a href="">Coronavirus Face Mask</a></h3>
                                <div class="products-cart-price">
                                    <span>1</span>
                                    <span>x</span>
                                    <span>80.000??</span>
                                </div>
                            </div>
                            <a class="delete-produt" href=""><i class="fa-solid fa-trash-can"></i></a>
                        </div>
                        <div class="products-cart">
                            <div class="products-cart-img">
                                <a href=""><img src="${rootpath}public/img/product10.png" alt=""></a>
                            </div>
                            <div class="products-cart-content">
                                <h3><a href="">Coronavirus Face Mask</a></h3>
                                <div class="products-cart-price">
                                    <span>1</span>
                                    <span>x</span>
                                    <span>80.000??</span>
                                </div>
                            </div>
                            <a class="delete-produt" href=""><i class="fa-solid fa-trash-can"></i></a>
                        </div>
                        <div class="products-cart">
                            <div class="products-cart-img">
                                <a href=""><img src="${rootpath}public/img/product12.png" alt=""></a>
                            </div>
                            <div class="products-cart-content">
                                <h3><a href="">Coronavirus Face Mask</a></h3>
                                <div class="products-cart-price">
                                    <span>1</span>
                                    <span>x</span>
                                    <span>80.000??</span>
                                </div>
                            </div>
                            <a class="delete-produt" href=""><i class="fa-solid fa-trash-can"></i></a>
                        </div>
                    </div>
                    <div class="products-cart-subtotal">
                        <span>subtotal</span>
                        <span>$228.000</span>
                    </div>
                    <div class="products-cart-btn">
                        <a href="">checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- modal-quickview -->
    <div class="modal-quick-view">
        <div class="modal-quickview-one">
            <button><i class="fa-solid fa-xmark"></i></button>
            <div class="modal-quick-view-body">
                <div class="row">
                    <div class="col-lg-5 col-md-6 col-sm-12 col-12">
                        <div class="modal-quick-view-img">
                            <div id="carouselId" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carouselId" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselId" data-slide-to="1"></li>
                                    <li data-target="#carouselId" data-slide-to="2"></li>
                                    <li data-target="#carouselId" data-slide-to="3"></li>
                                    <li data-target="#carouselId" data-slide-to="4"></li>
                                </ol>
                                <div class="carousel-inner" role="listbox">
                                    <div class="carousel-item active">
                                        <img src="${rootpath}public/img/product-20.png" alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="${rootpath}public/img/product-moi3.png" alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="${rootpath}public/img/product-20.png" alt="Third slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="${rootpath}public/img/product-moi3.png" alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="${rootpath}public/img/product-moi3.png" alt="Second slide">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-6 col-sm-12 col-12">
                        <div class="modal-quick-view-text">
                            <h3>Black fashion handbag JI9023</h3>
                            <div class="review-ratting">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <span>(2 Customer Review)</span>
                            </div>
                            <h4>$317.76</h4>
                            <p>
                                Standard dummy text ever since the 1500s, when an unknown printer took a galley of
                                type and scrambled it to make a type specimen.
                            </p>
                            <div class="color">
                                <span>Color</span>
                                <div class="chon-color">
                                 <label for="color-red">
                                     <input class="input-red" name="gender" type="radio" checked>
                                     <span class="product-cl-red"></span>
                                 </label>
                                 <label for="color-red">
                                      <input class="input-red" name="gender" type="radio">
                                      <span class="product-cl-red"></span>
                                 </label>
                                 <label for="color-red">
                                      <input class="input-red" name="gender" type="radio">
                                      <span class="product-cl-red"></span>
                                 </label>
                                </div>
                         </div>
                            <form class="form-quickview" action="">
                                <div class="product-count-one">
                                    <a href="cart.html">Add To Cart</a>
                                </div>
                            </form>
                            <div class="modal-product-icon">
                                <h4>SHARE THIS PRODUCT</h4>
                                <ul class="icon-quickview">
                                    <li><a href=""><i class="fa-brands fa-facebook-f"></i></a></li>
                                    <li><a href=""><i class="fa-brands fa-instagram"></i></a></li>
                                    <li><a href=""><i class="fa-brands fa-twitter"></i></a></li>
                                    <li><a href=""><i class="fa-brands fa-linkedin-in"></i></a></li>
                                    <li><a href=""><i class="fa-brands fa-google-plus-g"></i></a></li>
                                    <li><a href=""><i class="fa-brands fa-pinterest-p"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- nav-bar -->
    <jsp:include page="/PhanTrang/Header/MainMenu.jsp"></jsp:include>
    <!-- bannerproduct -->
    <div class="banner-product">
        <div class="row">
            <div class="col-lg-12">
                <div class="banner-product-text">
                    <h2>Cart</h2>
                    <ul class="">
                        <li>
                            <a href="">Home</a>
                        </li>
                        <li>
                            <i class="fa-solid fa-slash"></i>
                        </li>
                        <li>
                            Cart
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- cart -->
    <div class="cart-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="cart-area-table">
                    <form action="${rootpath}thanh-toan-tc" method="get" id="formcart">
                        <table id="bkh">
                                <tr>
                                    <th>Remove</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Color</th>
                                    <th>Size</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                </tr>
                                <c:forEach items="${lokk}" var="lop">
                                <tr>
                                    <td><a href=""><i class="fa-solid fa-trash-can"></i></a></td>
                                    <td><a href=""><img src="${rootpath}public/img/${lop.sanphamchitiet.mact.img}" alt=""></a></td>
                                    <td><a href="">${lop.sanphamchitiet.mact.name}</a></td>
                                    <td><a href="">${lop.sanphamchitiet.idms.name}</a></td>
                                    <td><a href="">${lop.sanphamchitiet.idkc.name}</a></td>
                                    <td><fmt:formatNumber value="${lop.sanphamchitiet.mact.price_new}" type="currency"/></td>
                                    <td><label for="">Quanlity</label><input type="number" name="quantity" min="1" max="100" value="${lop.sanphamchitiet.amount}" onblur="myFuntion()"></td>
                                    <td><fmt:formatNumber value="${lop.sanphamchitiet.mact.price_new * lop.sanphamchitiet.amount}" type="currency"/></td>
                                    <td><input type="hidden" value="${lop.sanphamchitiet.mact.name}" name="tensp" readonly="readonly"></td>
                                </tr>
                                </c:forEach>
                        </table>
                     </form>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="coupon-left">
                        <h3>COUPON</h3>
                        <div class="coupon-left-bottom">
                            <p>Enter your coupon code if you have one.</p>
                            <input type="text" placeholder="Nh???p code">
                            <button>APPLY COUPON</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="coupon-right">
                    <form action="${rootpath}xac-nhan-thanh-toan" method="get">
                        <table border="1" id="tdh" style="width: 100%">
                           <tr style="background-color: orange;">
                              <th colspan="2" style="text-align: center;font-weight: bold;font-size: 15px;">T???ng ????n h??ng</th>
                           </tr>
                           <tr>
                              <td>Gi?? tr??? ????n: </td>
                              <td><fmt:formatNumber value="${tt}" type="currency"/></td>
                           </tr>
                            <tr>
                              <td>Ph?? v???n chuy???n: </td>
                              <td>${pvc}</td>
                           </tr>
                            <tr>
                              <td>T???ng ti???n: </td>
                              <td><fmt:formatNumber value="${tt}" type="currency"/></td>
                           </tr>
                           <tr>
                              <td colspan="2" style="text-align: center;">
                                <span style="color: red;text-decoration: underline;padding-right: 111px;">${tbl}</span>
                                <br>
                                <c:if test="${tbl != null}">
                                    <span><b><a style="padding-right: 5px;" href="${rootpath}dang-nhap">????ng nh???p ngay</a></b></span>
                                </c:if>
                                 <button style="border: none; background-color: black;color: white;padding: 4px 9px;float: right;margin-right: 10px;">Thanh to??n</button>
                              </td>
                           </tr>
                        </table>
                      </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer-one">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-12 col-sm-12 col-12">
                    <div class="footer-one-widget">
                        <a href=""><img src="${rootpath}public/img/logo.png" alt=""></a>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Fuga eligendi neque molestias. Eum
                            architecto id modi asperiores sit ipsa, iusto officia? Tempore nisi praesentium deleniti
                            consectetur quisquam, neque quaerat nostrum?</p>
                        <div class="footer-icon">
                            <ul>
                                <li><a href=""><i class="fa-brands fa-facebook-f"></i></a></li>
                                <li><a href=""><i class="fa-brands fa-twitter"></i></a></li>
                                <li><a href=""><i class="fa-brands fa-linkedin"></i></a></li>
                                <li><a href=""><i class="fa-brands fa-instagram"></i></a></li>
                                <li><a href=""><i class="fa-brands fa-google-plus-g"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                    <div class="footer-one-widget">
                        <h3>INFORMATION</h3>
                        <ul>
                            <li><a href="">Home</a></li>
                            <li><a href="">About us</a></li>
                            <li><a href="">Privacy Policy</a></li>
                            <li><a href="">Frequently Questions</a></li>
                            <li><a href="">Order Tracking</a></li>
                            <li><a href="">Compare</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6 col-sm-12 col-12">
                    <div class="footer-one-widget">
                        <h3>INFORMATION</h3>
                        <ul>
                            <li><a href="">Home</a></li>
                            <li><a href="">About us</a></li>
                            <li><a href="">Privacy Policy</a></li>
                            <li><a href="">Frequently Questions</a></li>
                            <li><a href="">Order Tracking</a></li>
                            <li><a href="">Compare</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-12 col-sm-12 col-12">
                    <div class="footer-one-widget">
                        <h3>NEWSLETTER</h3>
                        <div class="subscribe-form">
                            <form action="">
                                <div class="mc-form">
                                    <input type="email" class="form-control" placeholder="Your Mail*" name="EMAIL">
                                </div>
                                <div class="clear">
                                    <button>
                                        Send mail
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- coppy-right-one -->
    <div class="coppy-right-one">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                    <div class="coppy-left">
                        <h6>
                            ?? CopyRight 2022
                            <span>AndShop</span>
                        </h6>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                    <div class="coppy-right">
                        <img src="${rootpath}public/img/payment.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="back-top">
        <a href=""><i class="fa-solid fa-angles-up"></i></a>
    </div>
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="${rootpath}public/js/cartthu.js"></script>
</body>
</html>