<?php
$thisUrl = curPageURL();
$code = isset($_GET['code']) ? addslashes(trim($_GET['code'])) : '';
if($code == '') {
	page404();
}

$sql = "SELECT * FROM tbl_service WHERE isactive = 1 AND `code` ='".$code."'";
$objmysql->Query($sql);
if ($objmysql->Num_rows()>0) {
	$result 		= $objmysql->Fetch_Assoc();
	$service_id 	= $result['id'];

	if(!isset($_SESSION['VIEW-CONTENT-'.$service_id])){
		$sql_update = "UPDATE `tbl_service` SET `visited` = `visited` + 1 WHERE `id` = ".$service_id;
		$_SESSION['VIEW-CONTENT-'.$service_id] = 1;
		$objdata->Exec($sql_update);
	}
}
?>
<section class="page page-service">
	<div class="service-detail">
		<div class="container">
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="<?= ROOTHOST; ?>" title="Trang chủ">
							Trang chủ
						</a>
					</li>
					<li class="breadcrumb-item" aria-current="page">
						<a href="<?= ROOTHOST; ?>dich-vu" title="Dịch vụ">
							Dịch vụ
						</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">
						<?php echo $result['name']; ?>
					</li>
				</ol>
			</nav>

			<div class="page-content">
				<div class="row">
					<div class="col-md-8 col-sm-8">
						<h1 class="page-title">Dịch vụ dịch thuật</h1>
						<input type="hidden" name="txt_package" id="txt_package">

						<div class="block-service-type">
							<?php
							$sql1 = "SELECT * FROM tbl_service_doc WHERE isactive = 1 AND service_id = ".$result['id'];
							$objmysql->Query($sql1);

							echo '<div class="title"><div class="left">CÁC LĨNH VỰC CHÍNH</div><div class="right">'.$result['intro'].'</div></div>';
							echo '<div class="service-type-items">';
							while ($r_service_doc = $objmysql->Fetch_Assoc()) {
								$name 	= stripslashes($r_service_doc['name']);
								$link1 	= ROOTHOST.'dich-vu/'.$result['code'].'/'.$r_service_doc['code'].'/';
								echo '<div class="item">
								<a href="'.$link1.'" title="'.$name.'">'.$name.'</a>
								</div>';
							}
							echo '</div>';

							$link = ROOTHOST.'order?service='.$result['id'].'&service_name='.$result['name'];
							?>
						</div>
						<div class="full_text">
							<?php echo stripslashes($result['fulltext']); ?>
							<div class="text-center use-service"><a href="<?php echo $link; ?>" class="btn btn-use-service" title="">ĐẶT DỊCH TÀI LIỆU</a></div>';
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<?php $this->loadModule('box8'); ?>
						<?php $this->loadModule('ads1'); ?>
						<?php $this->loadModule('ads2'); ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>