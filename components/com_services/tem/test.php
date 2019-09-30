<?php
if(isset($_FILES["txt_file"])){
	$file = $_FILES["txt_file"];

	var_dump($file);
}
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
					<form method="post" action="<?php echo ROOTHOST; ?>test" enctype="multipart/form-data">
						<input type="file" name="txt_file">
						<input type="submit" name="txt-submit">
					</form>

				</div>
				<div class="col-md-3 col-sm-4 wrap-aside"></div>
			</div>
		</div>
	</div>
</section>