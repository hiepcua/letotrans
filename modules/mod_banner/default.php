<?php
$objmysql = new CLS_MYSQL();
$sql = "SELECT * FROM tbl_slider WHERE isactive = 1 ORDER BY `order` ASC";
$objmysql->Query($sql);
$num = $objmysql->Num_rows();
?>
<div id="main-banner" class="owl-carousel owl-theme">
	<?php
	while($row = $objmysql->Fetch_Assoc()) {
		$slogan = stripslashes($row['slogan']);
		$intro = stripslashes($row['intro']);
		$link = stripslashes($row['link']);
		$thumb = stripslashes($row['thumb']);
		?>
		<div class="item">
			<?php if($slogan!='' || $intro!='') { ?>
				<div class="content">
					<?php if($slogan!="") {?><p class="slogan"><?php echo $slogan;?></p><?php } ?>
					<!-- <?php if($intro!="") {?><p class="intro"><?php echo $intro;?></p><?php } ?> -->
					<div class="intro">
						<a href="" class="btn btn1" title="">TÌM HIỂU NGAY</a>
						<a href="" class="btn btn2" title="">TƯ VẤN NGAY</a>
					</div>
				</div> 
			<?php } ?>
			<img src="<?php echo $thumb;?>" class="img-responsive"/>
			<div class="bn-mask"></div>
		</div>
	<?php } ?>
</div>