<?php
$thisUrl 	= curPageURL();
$code 		= isset($_GET['code']) ? addslashes(trim($_GET['code'])) : '';
$par_code 	= isset($_GET['par_code']) ? addslashes(trim($_GET['par_code'])) : '';
if($code == '' || $par_code == '') {
	page404();
}

$sql1 = "SELECT * FROM tbl_service WHERE isactive = 1 AND `code` ='".$par_code."'";
$objmysql->Query($sql1);
if ($objmysql->Num_rows()>0) {
	$result 		= $objmysql->Fetch_Assoc();
	$service_id 	= $result['id'];
	$service_type 	= ($result['service_type_id'] !== NULL && $result['service_type_id'] !== '') ? json_decode($result['service_type_id']) : [];

	if(!isset($_SESSION['VIEW-CONTENT-'.$service_id])){
		$sql_update = "UPDATE `tbl_service` SET `visited` = `visited` + 1 WHERE `id` = ".$service_id;
		$_SESSION['VIEW-CONTENT-'.$service_id] = 1;
		$objdata->Exec($sql_update);
	}
}

$sql2 = "SELECT * FROM tbl_service_type WHERE isactive = 1 AND `code` ='".$code."'";
$objmysql->Query($sql2);
$row2 = $objmysql->Fetch_Assoc();

$sql = "SELECT * FROM tbl_service_doc WHERE isactive = 1 AND service_id = ".$result['id']." AND service_type_id = ".$row2['id'];
$objmysql->Query($sql);
$row = $objmysql->Fetch_Assoc();
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
					<li class="breadcrumb-item" aria-current="page">
						<a href="<?= ROOTHOST.'dich-vu/'.$result['code'].'.html'; ?>" title="Dịch vụ <?php echo $result['name']; ?>">
							Dịch vụ <?php echo $result['name']; ?>
						</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">
						<?php echo $row['name'] ?>
					</li>
				</ol>
			</nav>

			<div class="page-content">
				<div class="row">
					<div class="col-md-8 col-sm-8">
						<h1 class="page-title"><?php echo $row['name'] ?></h1>
						<div class="full_text">
							<?php 
							echo stripslashes($row['fulltext']);
							$link = ROOTHOST.'order?service='.$result['id'].'&service_name='.$result['name'].'&service_type='.$row2['id'].'&service_type_name='.$row2['name'];
							echo '<div class="text-center use-service"><a href="'.$link.'" class="btn btn-use-service" title="">ĐẶT DỊCH TÀI LIỆU</a></div>';
							?>
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