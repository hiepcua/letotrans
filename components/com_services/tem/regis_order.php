<?php
$objdata = new CLS_MYSQL();
$from_id 		= isset($_POST['cbo_from']) ? (int)$_POST['cbo_from'] : 0;
$to_id 			= isset($_POST['cbo_to']) ? (int)$_POST['cbo_to'] : 0;
$service 		= isset($_POST['txt_service']) ? (int)$_POST['txt_service'] : 0;
$service_type 	= isset($_POST['txt_service_type']) ? (int)$_POST['txt_service_type'] : 0;
$time		 	= isset($_POST['txt_time']) ? (int)$_POST['txt_time'] : 0;
$ccd		 	= isset($_POST['txt_ccd']) ? (int)$_POST['txt_ccd'] : 0;
$ccg		 	= isset($_POST['txt_ccg']) ? (int)$_POST['txt_ccg'] : 0;
$ship		 	= isset($_POST['txt_ship']) ? (int)$_POST['txt_ship'] : 0;
$payment_type 	= isset($_POST['txt_payment_type']) ? (int)$_POST['txt_payment_type'] : 0;

$lastname 		= isset($_POST['txt-lastname']) ? addslashes($_POST['txt-lastname']) : '';
$firstname 		= isset($_POST['txt-firstname']) ? addslashes($_POST['txt-firstname']) : '';
$email  		= isset($_POST['txt-email']) ? addslashes($_POST['txt-email']) : '';
$phone  		= isset($_POST['txt-phone']) ? addslashes($_POST['txt-phone']) : '';
$address  		= isset($_POST['txt-address']) ? addslashes($_POST['txt-address']) : '';
$note  			= isset($_POST['txt-note']) ? addslashes($_POST['txt-note']) : '';

$success = false;
if(isset($_POST['save-order'])){
	$numpage = 0;
	foreach ($_POST['numpage'] as $key => $value) {
		$numpage += (int)$value;
	}

	// Files handle
	$arr_file = array();
	$target_dir = 'uploads/';

	if(isset($_FILES['txt-files'])){
		$objmedia = new CLS_UPLOAD();
		$objmedia->setPath($target_dir);
		$arr_file = $objmedia->UploadFiles("txt-files", $target_dir);
		$new_arr_file = array();

		foreach ($arr_file as $key => $value) {
			$tmp = array();
			$tmp['name'] = $value;
			$tmp['numpage'] = $_POST['numpage'][$key];
			array_push($new_arr_file, $tmp);
		}
	}
	$json_files = json_encode($new_arr_file);
	$json_files = mysql_real_escape_string($json_files);

	// Get price
	$sql = "SELECT * FROM tbl_price WHERE lang1 = ".$from_id." AND lang2 = ".$to_id;
	// echo $sql.'<br>';
	$objdata->Query($sql);
	$row = $objdata->Fetch_Assoc();
	$dfprice = (float)$row['price'];

	// // Get price_cc languages
	$sql1 = "SELECT * FROM tbl_languages WHERE isactive = 1 AND id = ".$to_id;
	$objdata->Query($sql1);
	$row1 = $objdata->Fetch_Assoc();

	if($ccg != 0) $ccg = 120000;
	if($ccd != 0) $ccd = (int)$row1['price_cc'];
	if($ship != 0) $ccg = 50000;

	if($time == 0){
		$total = $dfprice * $numpage + $ccg + $ccd + $ship;
	}else{
		// echo $dfprice.'<br>';
		// echo $numpage.'<br>';
		// echo $ccg.'<br>';
		// echo $ccd.'<br>';
		// echo $ship.'<br>';
		$total = $dfprice * $numpage + ($dfprice * $numpage) * 0.25 + $ccg + $ccd + $ship;
	}

	$sql = "INSERT INTO tbl_order (`from`, `to`, `service`, `service_type`, `numpage`, `time`, `ccd`, `ccg`, `firstname`, `lastname`, `email`, `phone`, `address`, `note`, `total`, `files`, `pay_type`, `cdate`, `lang_price`) VALUES ('".$from_id."', '".$to_id."', '".$service."', '".$service_type."', '".$numpage."', '".$time."', '".$ccd."', '".$ccg."', '".$firstname."', '".$lastname."', '".$email."', '".$phone."', '".$address."', '".$note."', '".$total."', '".$json_files."', '".$payment_type."', '".time()."', '".$dfprice."')";
	// echo $sql;
	// exit();
	if($objdata->Query($sql)){
		$success = true;
	}
}

?>
<section class="page page-regis-order">
	<div class="container">
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="<?= ROOTHOST; ?>" title="Trang chủ">
						Trang chủ
					</a>
				</li>
				<li class="breadcrumb-item active" aria-current="page">
					Gửi yêu cầu dịch thuật
				</li>
			</ol>
		</nav>

		<div class="page-content">
			<div class="jumbotron text-center">
				<?php if($success){ ?>
					<h1 class="display-3">Thank You!</h1>
					<p class="lead"><strong>Yêu cầu dịch thuật thành công,</strong> chúng tôi sẽ liên hệ lại với bạn trong 24h</p>
					<hr>
					<p class="lead">
						<a class="btn btn-primary" href="<?php echo ROOTHOST; ?>" role="button">Quay về trang chủ</a>
					</p>
				<?php }else{ ?>
					<h1 class="display-3" style="font-size: 36px;">Gặp sự cố!</h1>
					<p class="lead"><strong>Gặp sự cố trong quá trình gửi yêu cầu dịch thuật,</strong> vui lòng thử lại.</p>
					<hr>
					<p class="lead">
						<a class="btn btn-primary" href="<?php echo ROOTHOST; ?>order" role="button">Yêu cầu dịch thuật</a>
					</p>
				<?php } ?>
				
			</div>
		</div>
	</div>
</section>