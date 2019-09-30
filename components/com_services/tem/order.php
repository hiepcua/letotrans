<?php
$from_id 	= isset($_GET['from']) ? (int)$_GET['from'] : 0;
$to_id 		= isset($_GET['to']) ? (int)$_GET['to'] : 0;

if($from_id == 0 && $to_id == 0){
	page404();
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

					
				</div>
				<div class="col-md-3 col-sm-4 wrap-aside"></div>
			</div>
		</div>
	</div>
</section>