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
					<form method="post" action="<?php echo ROOTHOST; ?>yeu-cau-dich-vu"></form>
					
				</div>
				<div class="col-md-3 col-sm-4 wrap-aside"></div>
			</div>
		</div>
	</div>
</section>