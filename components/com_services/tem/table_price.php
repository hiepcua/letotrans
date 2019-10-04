<?php
$first_service_id = '';
?>
<section class="page page-table-price">
	<div class="table-price">
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
						Bảng giá
					</li>
				</ol>
			</nav>

			<div class="page-content">
				<div class="row">
					<div class="col-md-9 col-sm-8">
						<h1 class="page-title">BẢNG GIÁ</h1>
						<form method="get" action="<?php echo ROOTHOST; ?>order" enctype="multipart/form-data">
							<label>Chọn dịch vụ:<small class="red"> (*)</small><span id="err_service" class="mes-error"></span></label>
							<div class="block-service">
								<?php
								$sql1 = "SELECT * FROM tbl_service WHERE isactive=1";
								$objmysql->Query($sql1);
								$i=1;
								while ($r1 = $objmysql->Fetch_Assoc()) {
									if($i==1){
										$service_type = ($r1['service_type_id'] !== NULL && $r1['service_type_id'] !== '') ? implode(',', json_decode($r1['service_type_id'])) : [];
										$first_service_id = $service_type;
										echo '<input id="txt_service" type="hidden" name="service" value="'.$r1['id'].'">';
										echo '<div class="item selected" data-id="'.$r1['id'].'" data-name="'.$r1['name'].'">';
									}else{
										echo '<div class="item" data-id="'.$r1['id'].'" data-name="'.$r1['name'].'">';
									}
									echo '<span>'.$r1['name'].'</span>';
									echo '</div>';
									$i++;
								}
								?>
							</div>
							<div id="block_service_type">
								<label>Chọn lĩnh vực:<small class="red"> (*)</small><span id="err_service_type" class="mes-error"></span></label>
								<div class="block-service-type">
									<?php
									$sql2 = "SELECT * FROM tbl_service_type WHERE isactive=1 AND id IN(".$first_service_id.")";
									$objmysql->Query($sql2);
									$i2 = 1;
									while ($r2 = $objmysql->Fetch_Assoc()) {
										if($i2 == 1){
											echo '<div class="item selected" onclick="select_service_type(this)" data-id="'.$r2['id'].'">';
											echo '<input id="txt_service_type" type="hidden" name="service_type" value="'.$r2['id'].'">';
										}else{
											echo '<div class="item" onclick="select_service_type(this)" data-id="'.$r2['id'].'">';
										}
										
										echo '<span data-toggle="tooltip" title="'.$r2['name'].'"><img src="'.$r2['icon'].'" class="img-responsive"></span>';
										echo '</div>';
										$i2++;
									}
									?>
								</div>
							</div>
							
							<label>Chọn gói<small class="red"> (*)</small><span id="err_package" class="mes-error"></span></label>
							<input id="txt_package" name="package" type="hidden" value="1"/>
							<div class="block-package row row-flex" style="margin-bottom: 0;">
								<?php
								$sql_package = "SELECT * FROM tbl_package WHERE isactive = 1 ORDER BY `order` ASC LIMIT 0,1";
								$objmysql->Query($sql_package);
								$r_package = $objmysql->Fetch_Assoc();

								echo '<div class="col-md-4 col-sm-4 wrap-item">
									<div class="item basic selected" data-id="1">
										<div class="header">
											<div class="name">GÓI CƠ BẢN</div>
											<div class="price">'.$r_package['price_basic'].'đ mỗi từ</div>
											<div class="radio">
												<span class="radio-button"></span>
											</div>
										</div>
										<div class="content">
											<div><label>Điểm nổi bật</label></div>
											'.$r_package['intro_basic'].'
										</div>
									</div>
								</div>';

								echo '<div class="col-md-4 col-sm-4 wrap-item">
									<div class="item pro" data-id="2">
										<div class="header">
											<div class="name">GÓI PRO</div>
											<div class="price">'.$r_package['price_pro'].'đ mỗi từ</div>
											<div class="radio">
												<span class="radio-button"></span>
											</div>
										</div>
										<div class="content">
											<div><label>Điểm nổi bật</label></div>
											'.$r_package['intro_pro'].'
										</div>
									</div>
								</div>';

								echo '<div class="col-md-4 col-sm-4 wrap-item">
									<div class="item vip" data-id="3">
										<div class="header">
											<div class="name">GÓI VIP</div>
											<div class="price">'.$r_package['price_vip'].'đ mỗi từ</div>
											<div class="radio">
												<span class="radio-button"></span>
											</div>
										</div>
										<div class="content">
											<div><label>Điểm nổi bật</label></div>
											'.$r_package['intro_vip'].'
										</div>
									</div>
								</div>';
								?>
							</div>
							<div class="text-center">
								<input type="submit" class="btn btn-use-service" onclick="return check_input();" value="BẮT ĐẦU DỊCH">
							</div>
						</form>
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

						<!-- <aside class="aside feedback">
							<h3 class="aside-title"><i class="fa fa-circle" aria-hidden="true"></i><span>Ngôn ngữ nổi bật</span></h3>
							<div class="content">
								
							</div>
						</aside> -->
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

	$('[data-toggle="tooltip"]').tooltip();

	$('.block-service .item').click(function(){
		var service_id 		= $(this).attr('data-id');
		var service_name 	= $(this).attr('data-name');
		$('.block-service .item').removeClass('selected');
		$(this).addClass('selected');
		$('#txt_service').val(service_id);


		$.ajax({
            url : '<?php echo ROOTHOST.'ajaxs/get_service_type.php' ?>',
            type : 'POST',
            data : {
                'id' : service_id,
                'name' : service_name,
            },
            success: function (res) {
            	$('#block_service_type').empty();
            	$('#block_service_type').append(res);
            }
        })
	})

	function select_service_type(attr){
		$('.block-service-type .item').removeClass('selected');
		attr.classList.add('selected');
		var id = attr.getAttribute('data-id');
		$('#txt_service_type').val(id);
	}

	$('.block-package .item').click(function(){
		$('.block-package .item').removeClass('selected');
		$(this).addClass('selected');
		var id = $(this).attr('data-id');
		$('#txt_package').val(id);
	})

	function check_input(){
		var service 		= $('#txt_service').val();
		var service_type 	= $('#txt_service_type').val();
		var package 		= $('#txt_package').val();

		if(service == ""){
			$("#err_service").fadeTo(200,0.1, function(){
				$(this).html('Bạn chưa chọn dịch vụ').fadeTo(900,1);
			});
			return false;
		}

		if(service_type == ""){
			$("#err_service_type").fadeTo(200,0.1, function(){
				$(this).html('Bạn chưa chọn lĩnh vực').fadeTo(900,1);
			});
			return false;
		}

		if(package == ""){
			$("#err_package").fadeTo(200,0.1, function(){
				$(this).html('Bạn chưa chọn gói nào').fadeTo(900,1);
			});
			return false;
		}
		return true;
	}
</script>