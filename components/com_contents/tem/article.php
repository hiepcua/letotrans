<?php
$thisUrl = curPageURL();
$code = isset($_GET['code']) ? addslashes(trim($_GET['code'])) : '';
$par_code = isset($_GET['par_code']) ? addslashes(trim($_GET['par_code'])) : '';
if($code == '' || $par_code == '') {
	page404();
}

$sql = "SELECT * FROM tbl_categories WHERE `code` ='".$par_code."'";
$objmysql->Query($sql);
$r_cate		= $objmysql->Fetch_Assoc();
$cat_id 	= $r_cate['id'];
$par_id 	= $r_cate['par_id'];
$cat_name 	= stripslashes($r_cate['name']);

$sql = "SELECT * FROM tbl_contents WHERE isactive = 1 AND `code` ='".$code."'";
$objmysql->Query($sql);
if ($objmysql->Num_rows()>0) {
	$result = $objmysql->Fetch_Assoc();
	$con_id = $result['id'];

	if(!isset($_SESSION['VIEW-CONTENT-'.$con_id])){
		$sql_update = "UPDATE `tbl_contents` SET `visited` = `visited` + 1 WHERE `id` = ".$con_id;
		$_SESSION['VIEW-CONTENT-'.$con_id] = 1;
		$objdata->Exec($sql_update);
	}

	$cat_id 	= $result['category_id'];
	$views 		= $result['visited'];
	$cdate 		= convert_date($result['cdate']);
	$thumb 		= getThumb($result['thumb'], '', 'img-responsive');
	$link  		= ROOTHOST.$r_cate['code'].'/'.$result['code'].'.html';
	$images 	= json_decode($result['images']);
	$num_image	= count($images);
	$intro		= stripslashes($result['intro']);
}
?>
<section class="page page-contents">
	<div class="article">
		<div class="container">
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="<?= ROOTHOST; ?>" title="Trang chủ">
							Trang chủ
						</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">
						Tin tức
					</li>
				</ol>
			</nav>

			<div class="page-content">
				<div class="content">
					<div class="row-flex">
						<div class="box-thumb"><?php echo $thumb; ?></div>
						<div class="col-right">
							<h1 class="page-title"><?php echo stripslashes(html_entity_decode($result['title'])); ?></h1>
							<div class="meta-info">
								<ul class="list-inline">
									<li class="date">Thời gian: <?php echo $cdate; ?></li>
									<?php
									if($views > 0){
										echo '<li class="views">Lượt xem: '.$views.'</li>';
									}else{
										echo '<li class="views">Lượt xem: 1</li>';
									}
									?>
								</ul>

								<ul class="list-inline article-social">
									<li><div class="fb-like" data-href="<?php echo $thisUrl; ?>" data-layout="button_count" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div></li>	
								</ul>
							</div>
							<div class="intro"><?php echo $intro; ?></div>
						</div>
					</div>

					<div class="full_text">
						<?php echo stripslashes(html_entity_decode($result['fulltext'])); ?>
					</div>
				</div>

				<div class="clearfix"><br></div>
				<ul class="list-inline">
					<!-- <li><div class="fb-like" data-href="<?= $thisUrl; ?>" data-layout="button_count" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div></li>		 -->
				</ul>	
				<div class="clearfix"></div>
				<!-- <div class="fb-comments" data-href="<?= $thisUrl; ?>" data-width="100%" data-numposts="10"></div>				 -->
				<div class="clearfix"></div>

				<!-- Related news -->
				<div class="releated_news">
					<h2><i class="fa fa-circle" aria-hidden="true"></i><span>Bài viết cùng chuyên mục</span></h2>
					<ul>
						<?php 
						$sql = "SELECT * FROM tbl_contents WHERE isactive = 1 AND id <> $con_id AND category_id = $cat_id ORDER BY cdate DESC LIMIT 0,6";
						$objmysql->Query($sql);
						while($r = $objmysql->Fetch_Assoc()) { 
							$name = stripslashes(html_entity_decode($r['title'])); 
							$code = $r['code'];
							$link = ROOTHOST.$par_code.'/'.$code.'.html';
							echo '<li><a href="'.$link.'" title="'.$name.'"><i class="fa fa-circle" aria-hidden="true"></i>'.$name.'</a></li>';
						} ?>
					</ul>
				</div>
				<!-- End Related news -->
			</div>
		</div>
	</div>
</div>