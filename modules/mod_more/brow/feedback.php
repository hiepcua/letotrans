<?php $objmysql = new CLS_MYSQL(); ?>
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
</script>