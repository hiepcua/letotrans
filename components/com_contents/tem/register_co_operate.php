<?php
$objmysql = new CLS_MYSQL();
if(isset($_POST['save-co-operate'])){
	$name 		= isset($_POST['txt_name']) ? addslashes($_POST['txt_name']) : '';
	$email 		= isset($_POST['txt_email']) ? addslashes($_POST['txt_email']) : '';
	$phone 		= isset($_POST['txt_phone']) ? addslashes($_POST['txt_phone']) : '';
	$company 	= isset($_POST['txt_company']) ? addslashes($_POST['txt_company']) : '';
	$sql = "INSERT INTO tbl_co_operate (`name`, `email`, `phone`, `company`) VALUES ('".$name."', '".$email."', '".$phone."', '".$company."')";
	$objmysql->Exec($sql);
}
?>
<section class="page page-contents">
	<div class="article">
		<div class="container">
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="<?= ROOTHOST; ?>" title="Trang chủ">
							Trang chủ
						</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">
						Đăng ký hợp tác
					</li>
				</ol>
			</nav>

			<div class="page-content">
				<div class="content" style="padding: 50px 0px;">
					<div class="text-center">Đăng ký hợp tác thành công!</div>
				</div>
			</div>
		</div>
	</div>
</section>