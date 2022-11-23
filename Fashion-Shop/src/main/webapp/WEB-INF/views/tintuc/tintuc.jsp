<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="stag" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<stag:url value="/" var="rootpath" />
<fmt:setLocale value="${lag}" />
<fmt:setBundle basename="language.mess_lag" />
<meta charset="utf-8">
<style type="text/css">
.mota {
	color: inherit !important;
	text-transform: uppercase;
	font-size: 19px;
	font-weight: bold;
	font-family: auto;
}

.tintucdau {
	margin-top: 60px
}
</style>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${rootpath}public/css/style.css">
<link rel="stylesheet"
	href="${rootpath}public/plugin/dist/assets/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${rootpath}public/plugin/dist/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
</head>
<body>
	<!-- nenmoseacrch -->
	<div class="nenmosearch">
		<span>&times;</span>
		<div class="search-mo">
			<form>
				<input type="text" placeholder="Search here">
				<button>
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</form>
		</div>
	</div>
	<!-- cart -->
	<div class="cart-max">
		<div class="cart-small">
			<div class="cart-small-content">
				<button>
					<span>&times;</span>
				</button>
				<div class="cart-small-body">
					<h3 class="h31">My Cart (3)</h3>
					<div class="products-cart-content">
						<div class="products-cart">
							<div class="products-cart-img">
								<a href=""><img
									src="${rootpath}public/${rootpath}public/img/A280-Ao-kieu-xep-ta-phoi-nut-Den.jpg"
									alt=""></a>
							</div>
							<div class="products-cart-content">
								<h3>
									<a href="">Coronavirus Face Mask</a>
								</h3>
								<div class="products-cart-price">
									<span>1</span> <span>x</span> <span>80.000đ</span>
								</div>
							</div>
							<a class="delete-produt" href=""><i
								class="fa-solid fa-trash-can"></i></a>
						</div>
						<div class="products-cart">
							<div class="products-cart-img">
								<a href=""><img src="${rootpath}public/img/product10.png"
									alt=""></a>
							</div>
							<div class="products-cart-content">
								<h3>
									<a href="">Coronavirus Face Mask</a>
								</h3>
								<div class="products-cart-price">
									<span>1</span> <span>x</span> <span>80.000đ</span>
								</div>
							</div>
							<a class="delete-produt" href=""><i
								class="fa-solid fa-trash-can"></i></a>
						</div>
						<div class="products-cart">
							<div class="products-cart-img">
								<a href=""><img src="${rootpath}public/img/product12.png"
									alt=""></a>
							</div>
							<div class="products-cart-content">
								<h3>
									<a href="">Coronavirus Face Mask</a>
								</h3>
								<div class="products-cart-price">
									<span>1</span> <span>x</span> <span>80.000đ</span>
								</div>
							</div>
							<a class="delete-produt" href=""><i
								class="fa-solid fa-trash-can"></i></a>
						</div>
					</div>
					<div class="products-cart-subtotal">
						<span>subtotal</span> <span>$228.000</span>
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
			<button>
				<i class="fa-solid fa-xmark"></i>
			</button>
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
										<img src="${rootpath}public/img/product-20.png"
											alt="First slide">
									</div>
									<div class="carousel-item">
										<img src="${rootpath}public/img/product-moi3.png"
											alt="Second slide">
									</div>
									<div class="carousel-item">
										<img src="${rootpath}public/img/product-20.png"
											alt="Third slide">
									</div>
									<div class="carousel-item">
										<img src="${rootpath}public/img/product-moi3.png"
											alt="Second slide">
									</div>
									<div class="carousel-item">
										<img src="${rootpath}public/img/product-moi3.png"
											alt="Second slide">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-7 col-md-6 col-sm-12 col-12">
						<div class="modal-quick-view-text">
							<h3>${sp.name}</h3>
							<div class="review-ratting">
								<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i> <span>(2 Customer
									Review)</span>
							</div>
							<h4>$317.76</h4>
							<p>Standard dummy text ever since the 1500s, when an unknown
								printer took a galley of type and scrambled it to make a type
								specimen.</p>
							<div class="color">
								<span>Color</span>
								<div class="chon-color">
									<label for="color-red"> <input class="input-red"
										name="gender" type="radio" checked> <span
										class="product-cl-red"></span>
									</label> <label for="color-red"> <input class="input-red"
										name="gender" type="radio"> <span
										class="product-cl-red"></span>
									</label> <label for="color-red"> <input class="input-red"
										name="gender" type="radio"> <span
										class="product-cl-red"></span>
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
	<jsp:include page="/PhanTrang/Header/MainMenu.jsp"></jsp:include>
	<!-- bannerproduct -->
	<div class="banner-product">
		<div class="row">
			<div class="col-lg-12">
				<div class="banner-product-text">
					<h2>${tintuc}</h2>
					<ul class="">
						<li><a href="">Home</a></li>
						<li><i class="fa-solid fa-slash"></i></li>
						<li>Product single</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- style-product -->
	<div class="container">
		<div class="tintucdau">
			<a class="mota" href="#"> ${ltt.descripe} </a>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<c:if test="${ltt.id == 3}">
					<p>
						<span style="font-weight: 400;">Những chiếc áo dài tay, cổ
							kín luôn là món đồ mà nàng có thể thoải mái phối hợp, tạo nên
							những bộ quần áo thanh lịch, chỉn chu. Mẫu áo kiểu họa tiết tay
							dài A279 nhà GUCO với tính ứng dụng cao sẽ thích hợp với những cô
							nàng công sở muốn đa dạng hóa phong cách của bản thân.</span>
					</p>
					<p class="text-center">
						<img style="width: 50%;" src="${rootpath}public/img/${ltt.img}">
					</p>
					<strong>ÁO KIỂU HOẠ TIẾT TAY DÀI “CÂN” MỌI PHONG CÁCH</strong>
					<p>
						<span style="font-weight: 400px">Ngày nay, xu hướng capsule
							wardrobe lên ngôi và đặc biệt được nhiều chị em phụ nữ ưa chuộng.
							Với xu hướng này, bạn có thể xây dựng tủ quần áo chỉ gồm những
							item cơ bản nhưng có thể phối hợp với nhau một cách đa dạng. .</span>
					</p>
					<p>
						<span style="font-weight: 400px">Đối với các nàng công sở
							đi theo xu hướng xây dựng capsule wardrobe, hoặc chỉ đơn giản
							muốn có cho mình những chiếc áo hợp với mọi ngày đi làm, mẫu áo
							kiểu hoạ tiết tay dài GUCO là lựa chọn hợp lý nhất. Bởi sản phẩm
							có thiết kế lịch thiệp, thoải mái và đặc biệt có đen trắng cơ bản
							cực kỳ dễ sử dụng, phối đồ.</span>
					</p>
					<p class="text-center">
						<img style="width: 50%;" src="${rootpath}public/img/27f.jpg">
					</p>
					<p class="text-center">
						<em> <span style="font-weight: 400px">Mẫu áo kiểu hoạ
								tiết tay dài A279 GUCO</span>
						</em>
					</p>
					<p>
						<span style="font-weight: 400px">Sản phẩm hợp với dân văn
							phòng, các cô nàng công sở lẫn những bạn gái yêu thích phong cách
							nữ tính, nhẹ nhàng. Thậm chí những nàng năng động cũng cần có cho
							mình một, hai mẫu áo tay dài lịch thiệp trong tủ quần áo. </span>
					</p>
					<p>
						<span style="font-weight: 400px">Với chất liệu voan mềm
							mại, thoải mái và không nhăn, áo giữ được nét lịch sự, lại thích
							hợp phối với nhiều item đa dạng chất liệu. Áo kiểu hoạ tiết tay
							dài thích hợp đi với nhiều kiểu chân váy, tạo nên set đồ thanh
							lịch chuẩn công sở.</span>
					</p>
					<p>
						<span style="font-weight: 400px">Áo đi cùng với chất liệu
							Jeans giúp người mặc thêm trẻ trung, năng động. Hoạ tiết to màu
							đen nổi bật của áo cũng thích hợp với những cô nàng yêu thích
							phong cách bohemian phóng khoáng. Bạn chỉ cần kết hợp những phụ
							kiện và chân váy đậm chất “du mục” để có được set đồ phong cách,
							ưng ý. </span>
					</p>
					<p>
						<span style="font-weight: 400px">Hoạ tiết độc đáo khiến áo
							phù hợp nhiều phong cách</span>
					</p>
					<strong> MẪU ÁO CHẤT LIỆU CAO CẤP, FORM DÁNG THOẢI MÁI </strong>
					<p>
						<span style="font-weight: 400px">Sản phẩm hợp với dân văn
							phòng, các cô nàng công sở nhờ thiết kế đẹp và dễ sử dụng. Form
							áo rộng rãi để người mặc dễ dàng vận động mà không tạo cảm giác
							lùng bùng, nuốt dáng. </span>
					</p>
					<p class="text-center">
						<img width="50%" src="${rootpath}public/img/27b.jpg">
					</p>
					<p class="text-center">
						<em> <span style="font-weight: 400px">Áo kiểu hoạ tiết
								tay dài thiết kế phóng khoáng, thanh lịch</span>
						</em>
					</p>
					<p>
						<span style="font-weight: 400px">Những cô nàng công sở dành
							8 tiếng mỗi ngày tại văn phòng sẽ cực kỳ hài lòng với sự thoải
							mái mà sản phẩm mang lại. Bởi bên cạnh form dáng đẹp, áo còn được
							sản xuất với chất liệu voan thoáng mát. </span>
					</p>
				</c:if>
				<c:if test="${ltt.id == 2}">
					<p>
						<strong>Chân váy bút chì phối nút CV153</strong> <span
							style="font-weight: 400;"> là một trong những mẫu chân váy
							được ưa thích và là lựa chọn hàng đầu của các nàng công sở. Với
							thiết kế đơn giản nhưng sang trọng, sản phẩm dễ dàng chiếm trọn
							ánh nhìn của những bạn gái theo đuổi phong cách trưởng thành,
							tinh tế và thanh lịch. </span>
					</p>
					<p class="text-center">
						<img src="${rootpath}public/img/${ltt.img}">
					</p>
					<strong>CHÂN VÁY BÚT CHÌ PHỐI NÚT THIẾT KẾ SANG TRỌNG,
						THANH LỊCH</strong>
					<p>
						<span style="font-weight: 400px">Không phải tự nhiên mà
							chân váy bút chì trở thành món đồ mà mọi cô nàng thanh lịch đều
							cần có trong tủ. Những ai yêu thích thời trang chắc chắn biết
							rằng mẫu váy này được ưa chuộng và lăng xê ra sao, đặc biệt là
							bởi những fashionista nổi tiếng với phong cách Chic (Chic Style).</span>
					</p>
					<p>
						<span style="font-weight: 400px">Mẫu chân váy bút chì phối
							nút CV153 của GUCO được thiết kế dành cho nàng đam mê những bộ
							trang phục sang trọng và lịch thiệp. Sản phẩm đủ tối giản để giúp
							bạn dễ dàng phối hợp với các loại phụ kiện, mẫu quần áo khác
							nhau, song vẫn có điểm nhấn riêng..</span>
					</p>
					<p>
						<span style="font-weight: 400px">Đầu tiên phải kể đến thiết
							kế và độ dài tuyệt vời của chân váy. Váy có cạp cao, vừa phần eo
							nhỏ và tạo đường thắt eo mềm mại. Với mẫu váy này, bộ cánh của
							bạn sẽ “hack” dáng và trở nên gọn gàng, kéo dài phần chân một
							cách hiệu quả. </span>
					</p>
					<p class="text-center">
						<img
							src="${rootpath}public/img/thiet-ke-sang-trong-cua-chan-vay-but-chi-phoi-nut-cv153-guco.jpg">
					</p>
					<p class="text-center">
						<em> <span style="font-weight: 400px">Thiết kế sang
								trọng của chân váy bút chì phối nút</span>
						</em>
					</p>
					<p>
						<span style="font-weight: 400px">Sản phẩm ôm sát và tạo
							đường cong rõ ràng ở phần thắt eo và hông, tuy nhiên lại suôn
							thẳng xuống dưới. Với những bạn gái có chân và đùi mũm mĩm, váy
							che khuyết điểm tốt, đồng thời không bó sát và giữ được sự thoải
							mái cho người mặc khi sải bước.</span>
					</p>
					<p>
						<span style="font-weight: 400px">Điểm nhấn của sản phẩm nằm
							ở 2 hàng cúc nằm đối xứng 2 bên, tạo điểm nhấn và giúp phần hông
							váy được chú ý nhiều hơn. Chạy dọc theo 2 hàng cúc xuống mép váy
							là đường ráp được may tinh tế, tạo ấn tượng thị giác giúp phần
							thân dưới thon dài hơn. </span>
					</p>
					<strong>TỰ TIN SẢI BƯỚC VỚI NHỮNG MẪU CHÂN VÁY BÚT CHÌ
						DUYÊN DÁNG</strong>
					<p>
						<span style="font-weight: 400px">Với thiết kế che khuyết
							điểm tốt và tôn vinh phần eo, hông mềm mại của phái nữ, chân váy
							bút chì phối nút CV124 cũng sẽ là lựa chọn hàng đầu cho chị em
							phụ nữ khi diện đi làm, đi chơi. Bạn có thể thoải mái sải bước
							trên phố với mẫu váy cao cấp, tinh tế của GUCO.</span>
					</p>
					<p class="text-center">
						<img
							src="${rootpath}public/img/trang-phuc-dao-pho-ly-tuong-cua-nhung-co-nang-thanh-lich.jpg">
					</p>
					<p class="text-center">
						<em> <span style="font-weight: 400px">Trang phục dạo
								phố lý tưởng của những cô nàng thanh lịch</span>
						</em>
					</p>
					<p>
						<span style="font-weight: 400px">Chỉ với một chiếc chân váy
							bút chì phối nút CV153 nhà GUCO, bạn có thể phối hợp với vô vàn
							kiểu áo, đem lại sự đa dạng cho bộ trang phục mà vẫn giữ được nét
							sang trọng, thanh lịch. Sản phẩm được thiết kế và sản xuất độc
							quyền bởi GUCO, liên hệ ngay để được tư vấn size và đặt mua nàng
							nhé!</span>
					</p>
				</c:if>
				<c:if test="${ltt.id == 5}">
					<p>
						<span style="font-weight: 400;">Nếu nàng đang tìm kiếm cho
							mình mẫu đầm “đa năng”, diện được mọi dịp và đem lại cảm giác
							thoải mái lẫn lịch thiệp, đầm xòe hoa tùng bèo 3716 nhà GUCO
							chính là lựa chọn số một. Cùng khám phá thiết kế tinh tế, nữ tính
							và chất liệu cao cấp của mẫu đầm đẹp mọi góc nhìn này nhé! </span>
					</p>
					<p class="text-center">
						<img style="width: 50%" src="${rootpath}public/img/${ltt.img}">
					</p>
					<strong>THIẾT KẾ NỮ TÍNH CỦA ĐẦM XOÈ HOA TÙNG BÈO 3716</strong>
					<p>
						<span style="font-weight: 400px">Những chiếc đầm hoạ tiết
							hoa cỏ luôn đem lại cho người mặc cảm giác sáng sủa, nhẹ nhàng và
							không kém phần nữ tính. Đó cũng là lý do vì sao mẫu đầm xoè hoa
							tùng bèo 3716 nhà GUCO được khách hàng yêu quý.</span>
					</p>
					<p>
						<span style="font-weight: 400px">Sản phẩm thu hút ánh nhìn
							người đối diện bằng màu cam vàng nhạt, điểm xuyết hoa cỏ. Hoạ
							tiết cỡ nhỏ khiến đầm tạo cảm giác trẻ trung, nhẹ nhàng như một
							thảm cỏ ngày hè rực rỡ..</span>
					</p>
					<p class="text-center">
						<img width="50%"
							src="${rootpath}public/img/dam-xoe-tung-beo-3716-tuoi-sang-thanh-lich.jpg">
					</p>
					<p class="text-center">
						<em> <span style="font-weight: 400px">Đầm xoè tùng bèo
								3716 tươi sáng, thanh lịch</span>
						</em>
					</p>
					<p>
						<span style="font-weight: 400px">Mẫu đầm có thiết kế không
							quá đơn giản, song cũng không cầu kỳ và nhờ đó có tính ứng dụng
							cực cao. Đầm tay ngắn, cổ tròn và dài qua đầu gối. Phần nhấn eo
							được đặt eo, tạo nên đường thắt tinh tế, giúp cân bằng tỷ lệ ⅓. </span>
					</p>
					<p>
						<span style="font-weight: 400px">Cách nhấn eo này giúp vòng
							2 của người mặc có cảm giác thon gọn, nhỏ nhắn hơn. Bên cạnh đó,
							phần thân dưới của váy khá dài, suôn thẳng tạo cảm giác phần thân
							dưới của người mặc dài hơn, “hack” chân hiệu quả.</span>
					</p>
					<p class="text-center">
						<img width="50%"
							src="${rootpath}public/img/thiet-ke-phan-co-an-tuong-cua-san-pham.jpg">
					</p>
					<p class="text-center">
						<em> <span style="font-weight: 400px">Thiết kế phần cổ
								ấn tượng của sản phẩm</span>
						</em>
					</p>
					<p>
						<span style="font-weight: 400px">Phần cổ của đầm dạng tròn,
							song được may nhíu tạo thành 2 nếp gấp đối xứng đẹp mắt. Ngoài
							ra, phần chân váy viền bèo đắp chéo giúp mọi chuyển động, sải
							bước của nàng trở nên dịu dàng, thanh thoát hơn.</span>
					</p>
				</c:if>
			</div>
		</div>
	</div>
	<div class="instagram">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="center-heading text-center">
						<h2 style="border-top: 2px solid black; padding-top: 30px">
							<fmt:message key="instagram" />
						</h2>
						<p>
							<fmt:message key="thank" />
							<span><i class="fa-solid fa-heart"></i></span>
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="card-group">
						<div class="owl-carousel owl-theme" id="cardxoay">
							<div class="item">
								<div class="card">
									<a href=""> <span><i class="fa-brands fa-instagram"></i></span>
										<img class="card-img-top"
										src="${rootpath}public/img/post11.png" alt="Card image cap">
									</a>
								</div>
							</div>
							<div class="item">
								<div class="card">
									<a href=""> <span><i class="fa-brands fa-instagram"></i></span>
										<img class="card-img-top"
										src="${rootpath}public/img/post10.png" alt="Card image cap">
									</a>
								</div>
							</div>
							<div class="item">
								<div class="card">
									<a href=""><span><i class="fa-brands fa-instagram"></i></span>
										<img class="card-img-top"
										src="${rootpath}public/img/post12.png" alt="Card image cap"></a>
								</div>
							</div>
							<div class="item">
								<div class="card">
									<a href=""> <span><i class="fa-brands fa-instagram"></i></span>
										<img class="card-img-top"
										src="${rootpath}public/img/post6.png" alt="Card image cap">
									</a>
								</div>
							</div>
							<div class="item">
								<div class="card">
									<a href=""> <span><i class="fa-brands fa-instagram"></i></span>
										<img class="card-img-top"
										src="${rootpath}public/img/post8.png" alt="Card image cap">
									</a>
								</div>
							</div>
							<div class="item">
								<div class="card">
									<a href=""> <span><i class="fa-brands fa-instagram"></i></span>
										<img class="card-img-top"
										src="${rootpath}public/img/post9.png" alt="Card image cap">
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/PhanTrang/Footer/footer.jsp"></jsp:include>
	<div class="back-top">
		<a href=""><i class="fa-solid fa-angles-up"></i></a>
	</div>
	<script src="https://code.jquery.com/jquery.min.js"></script>
	<script
		src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
	<script src="${rootpath}public/plugin/cloundzoom/jquery.js"></script>
	<script src="${rootpath}public/plugin/cloundzoom/zoom.js"></script>
	<script src="${rootpath}public/plugin/cloundzoom/script.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="${rootpath}public/plugin/dist/owl.carousel.min.js"></script>
	<script src="${rootpath}public/js/product.js"></script>
	<script src="${rootpath}public/js/jquery.js"></script>
</body>

</html>