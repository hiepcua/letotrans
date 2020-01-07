<section class="section sec-feedback">
	<div class="container">
		<h2 class="sec-title">Ý KIẾN KHÁCH HÀNG</h2>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<aside class="feedback">
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
				<div class="text-center"><a href="<?php echo ROOTHOST; ?>y-kien-khach-hang" target="_blank" title="Xem tất cả ý kiến khách hàng" class="btn btn-view-all-feed-back">XEM TẤT CẢ Ý KIẾN KHÁCH HÀNG</a></div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</section>
<script type="text/javascript">
	$(document).ready(function(){
		$('#aside-feedback').owlCarousel({
			nav: true,
			loop:true,
			margin:30,
			autoplay:true,
			slideSpeed : 3000,
			paginationSpeed : 400,
			responsiveClass:true,
			navText: ["<img src='<?php echo ROOTHOST; ?>images/icons/arrow_left.png'>","<img src='<?php echo ROOTHOST; ?>images/icons/arrow_right.png'>"],
			responsive:{
				0:{
					items:1,
					nav:true
				},
				600:{
					items:1,
					nav:false
				},
				1000:{
					items:2,
					nav:true,
					loop:false
				}
			}
		})
	});
</script>