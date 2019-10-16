<?php
$from_id 		= isset($_GET['from']) ? (int)$_GET['from'] : 0;
$to_id 			= isset($_GET['to']) ? (int)$_GET['to'] : 0;
$service 		= isset($_GET['service']) ? (int)$_GET['service'] : 0;
$service_type 	= isset($_GET['service_type']) ? (int)$_GET['service_type'] : 0;
$time		 	= isset($_GET['time']) ? (int)$_GET['time'] : 0;
?>
<section class="page page-order">
	<div class="container">
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="<?= ROOTHOST; ?>" title="Trang chủ">
						Trang chủ
					</a>
				</li>
				<li class="breadcrumb-item active" aria-current="page">
					Chi tiết yêu cầu dịch thuật
				</li>
			</ol>
		</nav>

		<div class="page-content">
			<div class="row">
				<div class="col-md-9 col-sm-8">
					<h1 class="page-title">CHỌN THÔNG TIN</h1>
					<form method="post" action="<?php echo ROOTHOST; ?>yeu-cau-dich-vu">
						<div class="block-service">
							<div class="block">
								<div class="label">Chọn dịch vụ:</div>
								<div class="content">
									<div class="item"><span>Dịch thuật</span></div>
									<div class="item"><span>Dịch thuật</span></div>
									<div class="item"><span>Dịch thuật</span></div>
									<div class="item"><span>Dịch thuật</span></div>
								</div>
							</div>
							<div class="block">
								<div class="label">Chọn lĩnh vực:</div>
								<div class="content">
									<div class="item"><img src="http://localhost:8000/letotrans/images/icons/icon-service-type-01.png" class="img-responsive"></div>
									<div class="item"><img src="http://localhost:8000/letotrans/images/icons/icon-service-type-01.png" class="img-responsive"></div>
									<div class="item"><img src="http://localhost:8000/letotrans/images/icons/icon-service-type-01.png" class="img-responsive"></div>
									<div class="item"><img src="http://localhost:8000/letotrans/images/icons/icon-service-type-01.png" class="img-responsive"></div>
									<div class="item"><img src="http://localhost:8000/letotrans/images/icons/icon-service-type-01.png" class="img-responsive"></div>
									<div class="item"><img src="http://localhost:8000/letotrans/images/icons/icon-service-type-01.png" class="img-responsive"></div>
									<div class="item"><img src="http://localhost:8000/letotrans/images/icons/icon-service-type-01.png" class="img-responsive"></div>
									<div class="item"><img src="http://localhost:8000/letotrans/images/icons/icon-service-type-01.png" class="img-responsive"></div>
								</div>
							</div>
						</div>
						<div class="block-languages">
							<div class="block">
								<div class="label">Dịch từ:</div>
								<div class="content">
									<select name="from" class="from-control">
										<option value="1">Tiếng Anh</option>
										<option value="1">Tiếng Anh</option>
										<option value="1">Tiếng Anh</option>
									</select>
								</div>
							</div>
							<div class="block">
								<div class="label">Sang:</div>
								<div class="content">
									<select name="to" class="from-control">
										<option value="1">Tiếng Anh</option>
										<option value="1">Tiếng Anh</option>
										<option value="1">Tiếng Anh</option>
									</select>
								</div>
							</div>
						</div>
						<div class="block-upload">
							<div class="block">
								<div class="label">Tải file cần dịch:</div>
								<div class="content">
									<div class="item"></div>
									<div class="item"></div>
								</div>
							</div>
							<div class="list-files">
								<div class="label"></div>
								<div class="content"></div>
							</div>
						</div>
						<div class="block-userinfo">
							<h2>THÔNG TIN KHÁCH HÀNG</h2>
							<div class="block">
								<div class="label">Họ và tên:</div>
								<div class="content">
									<div class="col">
										<input type="text" class="from-control" name="txt-lastname" placeholder="Họ và tên đệm">
									</div>
									<div class="col">
										<input type="text" class="from-control" name="txt-firstname" placeholder="Tên">
									</div>
								</div>
							</div>
							<div class="block">
								<div class="label">Email:</div>
								<div class="content">
									<div class="col">
										<input type="email" class="from-control" name="txt-email" placeholder="Email">
									</div>
								</div>
							</div>
							<div class="block">
								<div class="label">Điện thoại:</div>
								<div class="content">
									<div class="col">
										<input type="text" class="from-control" name="txt-phone" placeholder="Điện thoại">
									</div>
								</div>
							</div>
							<div class="block">
								<div class="label">Địa chỉ:</div>
								<div class="content">
									<div class="col full">
										<input type="text" class="from-control" name="txt-address" placeholder="Địa chỉ">
									</div>
								</div>
							</div>
						</div>
						<hr/>
						<div class="block-payment">
							<div class="block">
								<div class="label">Hình thức thanh toán</div>
								<div class="content">
									<div class="col">
										<img src="http://letotrans.vn/images/icons/mastercard.jpg" class="img-responsive">
									</div>
									<div class="col">
										<img src="http://letotrans.vn/images/icons/mastercard.jpg" class="img-responsive">
									</div>
									<div class="col">
										<img src="http://letotrans.vn/images/icons/mastercard.jpg" class="img-responsive">
									</div>
									<div class="col">
										<img src="http://letotrans.vn/images/icons/mastercard.jpg" class="img-responsive">
									</div>
								</div>
							</div>
						</div>
						<hr/>
						<div class="block-other">
							<div class="block">
								<div class="label">Yêu cầu thêm:</div>
								<div class="content">
									<textarea class="from-control" name="txt-note" rows="3" placeholder="Yêu cầu thêm"></textarea>
								</div>
							</div>
						</div>
						<input type="submit" name="save-order" class="from-control" value="Bắt đầu dịch">
					</form>
				</div>
				<div class="col-md-3 col-sm-4 wrap-aside"></div>
			</div>
		</div>
	</div>
</section>