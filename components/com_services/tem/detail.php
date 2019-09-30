<?php
$thisUrl = curPageURL();
$code = isset($_GET['code']) ? addslashes(trim($_GET['code'])) : '';
if($code == '') {
	page404();
}

$sql = "SELECT * FROM tbl_service WHERE isactive = 1 AND `code` ='".$code."'";
$objmysql->Query($sql);
if ($objmysql->Num_rows()>0) {
	$result = $objmysql->Fetch_Assoc();
	$service_id = $result['id'];

	if(!isset($_SESSION['VIEW-CONTENT-'.$service_id])){
		$sql_update = "UPDATE `tbl_service` SET `visited` = `visited` + 1 WHERE `id` = ".$service_id;
		$_SESSION['VIEW-CONTENT-'.$service_id] = 1;
		$objdata->Exec($sql_update);
	}

	// $cat_id 	= $result['category_id'];
	// $views 		= $result['visited'];
	// $cdate 		= convert_date($result['cdate']);
	// $thumb 		= getThumb($result['thumb'], '', 'img-responsive');
	// $link  		= ROOTHOST.$r_cate['code'].'/'.$result['code'].'.html';
	// $images 	= json_decode($result['images']);
	// $num_image	= count($images);
	// $intro		= stripslashes($result['intro']);
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
					<div class="col-md-9 col-sm-8">
						<h1 class="page-title">Dịch vụ dịch thuật</h1>

						<div class="block-package row row-flex">
							<?php
							$sql_package = "SELECT * FROM tbl_package WHERE isactive = 1 ORDER BY `order` ASC";
							$objmysql->Query($sql_package);
							$i = 0;

							while ($r_package = $objmysql->Fetch_Assoc()) {
								$i++;
								echo '<div class="col-md-4 col-sm-4 wrap-item">
									<div class="item">
										<div class="header">
											<div class="name">'.$r_package['name'].'</div>
											<div class="price">'.$r_package['price'].'đ mỗi từ</div>
											<div class="radio">
												<span class="radio-button">
													<input id="radio_'.$i.'" name="radio" type="radio" value="'.$i.'"/>
												</span>
											</div>
										</div>
										<div class="content">
											<div><label>Điểm nổi bật</label></div>
											'.$r_package['intro'].'
										</div>
									</div>
								</div>';
							}
							?>
						</div>
						<div class="full_text">
							<?php //echo stripslashes(html_entity_decode($result['fulltext'])); ?>
						</div>
					</div>
					<div class="col-md-3 col-sm-4">
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
	})
</script>