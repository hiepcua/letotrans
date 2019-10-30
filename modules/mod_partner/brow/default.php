<?php
$objmysql = new CLS_MYSQL();
$sql="SELECT * FROM tbl_partner WHERE isactive = 1 ORDER BY `order` ASC";
$objmysql->Query($sql);
?>
<div id="slide-partner" class="owl-carousel owl-theme">
	<?php
	while($row 	= $objmysql->Fetch_Assoc()) {
		$name 	= stripcslashes($row['name']);
		$link 	= stripcslashes($row['link']);
		$thumb 	= stripcslashes($row['images']);
		?>
		<div class="item">
			<div class="bn-mask"></div>
			<a href="<?php echo $link; ?>" target="_blank" title="<?php echo $name; ?>">
				<img src="<?= $thumb ?>" class="img-responsive">
			</a>
		</div>
	<?php } ?>
</div>
<script type="text/javascript">
	$('#slide-partner').owlCarousel({
		loop:true,
		margin:10,
		responsiveClass:true,
		responsive:{
			0:{
				items:2,
				nav:true
			},
			600:{
				items:4,
				nav:false
			},
			1000:{
				items:5,
				nav:true,
				loop:false
			}
		}
	})
</script>