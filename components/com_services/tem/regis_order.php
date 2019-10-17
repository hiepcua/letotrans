<?php
$objdata = new CLS_MYSQL();
// $from_id 		= isset($_POST['cbo_from']) ? (int)$_POST['cbo_from'] : 0;
// $to_id 			= isset($_POST['cbo_from']) ? (int)$_POST['cbo_from'] : 0;
// $service 		= isset($_POST['txt_service']) ? (int)$_POST['txt_service'] : 0;
// $service_type 	= isset($_POST['txt_service_type']) ? (int)$_POST['txt_service_type'] : 0;
// $time		 	= isset($_POST['txt_time']) ? (int)$_POST['txt_time'] : 0;
// $ccd		 	= isset($_POST['txt_ccd']) ? (int)$_POST['txt_ccd'] : 0;
// $ccg		 	= isset($_POST['txt_ccg']) ? (int)$_POST['txt_ccg'] : 0;
// $ship		 	= isset($_POST['txt_ship']) ? (int)$_POST['txt_ship'] : 0;
// $numpage = 0;
// foreach ($_POST['numpage'] as $key => $value) {
// 	$numpage += (int)$value;
// }

// $lastname 		= isset($_POST['txt-lastname']) ? addslashes($_POST['txt-lastname']) : '';
// $firstname 		= isset($_POST['txt-firstname']) ? addslashes($_POST['txt-firstname']) : '';
// $email  		= isset($_POST['txt-email']) ? addslashes($_POST['txt-email']) : '';
// $phone  		= isset($_POST['txt-phone']) ? addslashes($_POST['txt-phone']) : '';
// $address  		= isset($_POST['txt-address']) ? addslashes($_POST['txt-address']) : '';
// $note  			= isset($_POST['txt-note']) ? addslashes($_POST['txt-note']) : '';


// Files handle
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["txt-files"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));


// Count total files
$countfiles = count($_FILES['txt-files']['name']);

// Looping all files
for($i=0; $i < $countfiles; $i++){
	$filename = $_FILES['file']['name'][$i];
	// Upload file
	move_uploaded_file($_FILES['file']['tmp_name'][$i],'upload/'.$filename);

}

// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
	$check = getimagesize($_FILES["txt-files"]["tmp_name"]);
	if($check !== false) {
		echo "File is an image - " . $check["mime"] . ".";
		$uploadOk = 1;
	} else {
		echo "File is not an image.";
		$uploadOk = 0;
	}
}
// Check if file already exists
if (file_exists($target_file)) {
	echo "Sorry, file already exists.";
	$uploadOk = 0;
}
// Check file size
if ($_FILES["txt-files"]["size"] > 500000) {
	echo "Sorry, your file is too large.";
	$uploadOk = 0;
}
// Allow certain file formats
if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
	&& $imageFileType != "gif" ) {
	echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
$uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
	echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
	if (move_uploaded_file($_FILES["txt-files"]["tmp_name"], $target_file)) {
		echo "The file ". basename( $_FILES["txt-files"]["name"]). " has been uploaded.";
	} else {
		echo "Sorry, there was an error uploading your file.";
	}
}

if(isset($_POST['save-order'])){
	// Get price
	// $sql = "SELECT * FROM tbl_price WHERE lang1 = ".$from_id." AND lang2 = ".$to_id;
	// $objdata->Query($sql);
	// $row = $objdata->Fetch_Assoc();
	// $dfprice = (float)$row['price'];

	// // Get price_cc languages
	// $sql1 = "SELECT * FROM tbl_languages WHERE isactive = 1 AND id = ".$to_id;
	// $objdata->Query($sql1);
	// $row1 = $objdata->Fetch_Assoc();

	// if($ccg != 0) $ccg = 120000;
	// if($ccd != 0) $ccd = (int)$row1['price_cc'];
	// if($ship != 0) $ccg = 50000;

	// if($time == 0){
	// 	$total = $dfprice * $numpage + $ccg + $ccd + $ship;
	// }else{
	// 	$total = $dfprice * $numpage + ($dfprice * $numpage) * 0.25 + $ccg + $ccd + $ship;
	// }

	// $sql = "INSERT INTO tbl_order (`from`, `to`, `service`, `service_type`, `numpage`, `time`, `ccd`, `ccg`, `firstname`, `lastname`, `email`, `phone`, `address`, `note`, `total`) VALUES ('".$from_id."', '".$to_id."', '".$service."', '".$service_type."', '".$numpage."', '".$time."', '".$ccd."', '".$ccg."', '".$firstname."', '".$lastname."', '".$email."', '".$phone."', '".$address."', '".$note."', '".$total."')";
	// if($objdata->Query($sql)){
	// 	$txt = "Đặt yêu cầu dịch thuật thành công";
	// }else{
	// 	$txt = "Có lỗi trong quá trình sử lý. Vui lòng thực hiện lại!";
	// }

	$txt = "Có lỗi trong quá trình sử lý. Vui lòng thực hiện lại!";
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
					Gửi yêu cầu dịch thuật
				</li>
			</ol>
		</nav>

		<div class="page-content">
			<div class="row">
				<div class="col-md-9 col-sm-8">
					<div class="tex-center"><?php echo $txt; ?></div>
				</div>
				<div class="col-md-3 col-sm-4 wrap-aside"></div>
			</div>
		</div>
	</div>
</section>