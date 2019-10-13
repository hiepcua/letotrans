<?php
$objmysql = new CLS_MYSQL();
if(isset($_POST['save_register'])){
	$name = isset($_POST['txt_name']) ? addslashes($_POST['txt_name']) : '';
	$email = isset($_POST['txt_email']) ? addslashes($_POST['txt_email']) : '';
	$sql = "INSERT INTO tbl_subscribe (`name`, `email`) VALUES ('".$name."', '".$email."')";
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
						Đăng ký nhận tin
					</li>
				</ol>
			</nav>

			<div class="page-content">
				<div class="content" style="padding: 50px 0px;">
					<div class="text-center">Đăng ký nhận tin thành công!</div>
				</div>
			</div>
		</div>
	</div>
</section>