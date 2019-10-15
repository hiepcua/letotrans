<?php
$thisUrl 	= curPageURL();
$code 		= isset($_GET['code']) ? addslashes(trim($_GET['code'])) : '';
$par_code 	= isset($_GET['par_code']) ? addslashes(trim($_GET['par_code'])) : '';
if($code == '' || $par_code == '') {
	page404();
}

$sql = "SELECT * FROM tbl_service WHERE isactive = 1 AND `code` ='".$code."'";
$objmysql->Query($sql);
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

						<!-- <div class="block-package row row-flex"> -->
							<?php
							// $sql_package = "SELECT * FROM tbl_package WHERE isactive = 1 AND service_id = ".$result['id']." ORDER BY `order` ASC LIMIT 0,1";
							// $objmysql->Query($sql_package);
							// $r_package = $objmysql->Fetch_Assoc();

							// echo '<div class="col-md-4 col-sm-4 wrap-item">
							// 	<div class="item basic selected">
							// 		<div class="header">
							// 			<div class="name">GÓI CƠ BẢN</div>
							// 			<div class="price">'.$r_package['price_basic'].'đ mỗi từ</div>
							// 			<div class="radio">
							// 				<span class="radio-button">
							// 					<input class="radio-package" name="radio" type="radio" value="1"/>
							// 				</span>
							// 			</div>
							// 		</div>
							// 		<div class="content">
							// 			<div><label>Điểm nổi bật</label></div>
							// 			'.$r_package['intro_basic'].'
							// 		</div>
							// 	</div>
							// </div>';

							// echo '<div class="col-md-4 col-sm-4 wrap-item">
							// 	<div class="item pro">
							// 		<div class="header">
							// 			<div class="name">GÓI PRO</div>
							// 			<div class="price">'.$r_package['price_pro'].'đ mỗi từ</div>
							// 			<div class="radio">
							// 				<span class="radio-button">
							// 					<input class="radio-package" name="radio" type="radio" value="2"/>
							// 				</span>
							// 			</div>
							// 		</div>
							// 		<div class="content">
							// 			<div><label>Điểm nổi bật</label></div>
							// 			'.$r_package['intro_pro'].'
							// 		</div>
							// 	</div>
							// </div>';

							// echo '<div class="col-md-4 col-sm-4 wrap-item">
							// 	<div class="item vip">
							// 		<div class="header">
							// 			<div class="name">GÓI VIP</div>
							// 			<div class="price">'.$r_package['price_vip'].'đ mỗi từ</div>
							// 			<div class="radio">
							// 				<span class="radio-button">
							// 					<input class="radio-package" name="radio" type="radio" value="3"/>
							// 				</span>
							// 			</div>
							// 		</div>
							// 		<div class="content">
							// 			<div><label>Điểm nổi bật</label></div>
							// 			'.$r_package['intro_vip'].'
							// 		</div>
							// 	</div>
							// </div>';
							?>
						<!-- </div> -->

						<div class="block-service-type">
							<?php
							if($service_type !== []){
								$str_service_type = implode(',', $service_type);
								$sql1 = "SELECT * FROM tbl_service_type WHERE isactive = 1 AND id IN (".$str_service_type.")";
								$objmysql->Query($sql1);

								echo '<div class="title">CÁC LĨNH VỰC CHÍNH</div>';
								echo '<div class="service-type-items">';
								while ($r_service1 = $objmysql->Fetch_Assoc()) {
									$name = stripslashes($r_service1['name']);
									$link1 = ROOTHOST.'dich-vu/'.$result['code'].'/'.$r_service1['code'].'/';
									echo '<div class="item"><a href="'.$link1.'" title="'.$name.'">'.$name.'</a></div>';
								}
								echo '</div>';

								$link = ROOTHOST.'order?service='.$result['code'].'&service_type='.$service_type['0'].'&package=1'.'&urgency_type_id=2';
								echo '<div class="text-center use-service"><a href="'.$link.'" target="_blank" class="btn btn-use-service" title="">ĐẶT DỊCH TÀI LIỆU</a></div>';
							}
							?>
						</div>
						<div class="full_text">
							<?php echo stripslashes($result['fulltext']); ?>

							<?php
							$link = ROOTHOST.'order?service='.$result['code'].'&service_type='.$service_type['0'].'&package=1'.'&urgency_type_id=2';
							echo '<div class="text-center use-service"><a href="'.$link.'" class="btn btn-use-service" title="">ĐẶT DỊCH TÀI LIỆU</a></div>';
							?>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<aside class="aside feedback">
							<h3 class="aside-title"><i class="fa fa-circle" aria-hidden="true"></i><span>Ý kiến khách hàng</span></h3>
							<div id="aside-feedback" class="owl-carousel owl-theme">
								<?php
								$sql="SELECT * FROM tbl_feedback WHERE isactive = 1 ORDER BY `order` DESC LIMIT 0, 3";
								$objmysql->Query($sql);
								while($row 	= $objmysql->Fetch_Assoc()) {
									$name 		= stripcslashes($row['name']);
									$comment 	= stripcslashes($row['comment']);
									$career 	= stripcslashes($row['career']);
									$thumb 		= getThumb($row['avatar'], 'img-responsive', '');
									?>
									<div class="item">
										<div class="box-thumb">
											<div class="wrap-thumb"><?php echo $thumb;?></div>
											<div class="name"><?php echo $name; ?></div>
											<div class="career"><?php echo $career; ?></div>
										</div>
										<div class="content"><?php echo $comment; ?></div>
									</div>
								<?php } ?>
							</div>
						</aside>

						<?php $this->loadModule('ads1'); ?>
						<?php $this->loadModule('ads2'); ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('#aside-feedback').owlCarousel({
		navigation : true,
		slideSpeed : 3000,
		paginationSpeed : 400,
		loop: true,
		autoplay:true,
		items : 1, 
		itemsDesktop : false,
		itemsDesktopSmall : false,
		itemsTablet: false,
		itemsMobile : false
	});

	$('.block-package .item').click(function(){
		$('.block-package .item').removeClass('selected');
		$(this).addClass('selected');
		var val = $(this).find('.radio-package').val();
		var link = '<?php echo ROOTHOST; ?>' + 'order?service=<?php echo $result['code']; ?>' + '&service_type=<?php echo $service_type['0']; ?>' + '&urgency_type_id=2&package='+ val;
		$('.use-service>a').attr('href', link);

	})
</script>