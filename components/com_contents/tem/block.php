<?php
$code = isset($_GET['code']) ? addslashes(trim($_GET['code'])) : '';
if($code =='') page404();

$sql_cate = "SELECT * FROM tbl_categories WHERE isactive = 1 AND `code` = '".$code."'";
$objmysql->Query($sql_cate);
$r_cate = $objmysql->Fetch_Assoc();

// Begin pagging
define('OBJ_PAGE','BLOCK_CONTENTS');
if(!isset($_SESSION['CUR_PAGE_'.OBJ_PAGE])){
	$_SESSION['CUR_PAGE_'.OBJ_PAGE] = 1;
}
if(isset($_POST['txtCurnpage'])){
	$_SESSION['CUR_PAGE_'.OBJ_PAGE] = (int)$_POST['txtCurnpage'];
}

$sql_count = "SELECT COUNT(*) AS count FROM tbl_contents WHERE isactive = 1 AND `category_id` = '".$r_cate['id']."'";
$objmysql->Query($sql_count);
$row_count = $objmysql->Fetch_Assoc();
$total_rows = $row_count['count'];

$MAX_ROWS = 9;
if($_SESSION['CUR_PAGE_'.OBJ_PAGE] > ceil($total_rows/$MAX_ROWS)){
	$_SESSION['CUR_PAGE_'.OBJ_PAGE] = ceil($total_rows/$MAX_ROWS);
}
$cur_page=(int)$_SESSION['CUR_PAGE_'.OBJ_PAGE]>0 ? $_SESSION['CUR_PAGE_'.OBJ_PAGE] : 1;
// End pagging
?>
<section class="page page-contents">
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
			<div class="row">
				<div class="col-md-9 col-sm-8">
					<h1 class="page-title"><span>Tin tức</span></h1>
					<div class="list-articles">
						<?php
						$star = ($cur_page - 1) * $MAX_ROWS;
						$sql = "SELECT * FROM tbl_contents WHERE isactive = 1 AND `category_id` = '".$r_cate['id']."' ORDER BY `cdate` DESC LIMIT $star,".$MAX_ROWS;
						$objmysql->Query($sql);
						while ($r_con = $objmysql->Fetch_Assoc()) {
							$title 	= stripcslashes($r_con['title']);
							$code 	= $r_con['code'];
							$thumb 	= getThumb($r_con['thumb'], 'img-responsive', '');
							$views 	= (int)$r_con['visited'];
							$cdate 	= convert_date($r_con['cdate']);
							$intro 	= stripslashes($r_con['intro']);
							$link 	= ROOTHOST.$r_cate['code'].'/'.$code.'.html';
						
							echo '<div class="item">
								<div class="box-thumb">
									<a href="'.$link.'" title="'.$title.'">'.$thumb.'</a>
									<h3 class="title"><a href="'.$link.'" title="'.$title.'">'.$title.'</a></h3>
								</div>
								<div class="content">
									<div class="sapo">'.$intro.'</div>
									<div class="info">
										<span class="date">'.$cdate.'</span>
										<div class="readmore"><a href="'.$link.'" title="Xem chi tiết">Xem chi tiết</a></div>
									</div>
								</div>
							</div>';
						}
						?>
					</div>
					<div class="text-center">
						<?php paging($total_rows,$MAX_ROWS,$cur_page); ?>
					</div>
				</div>

				<div class="col-md-3 col-sm-4 wrap-aside">
					<aside class="aside subscribe">
						<h3 class="aside-title"><i class="fa fa-circle" aria-hidden="true"></i><span>Đăng ký nhận tin</span></h3>
						<form id="frm-subscribe" method="post" action="">
							<input type="text" name="txt-name" class="form-control" placeholder="Họ và tên" required>
							<input type="email" name="txt-email" class="form-control" placeholder="Email" required>
							<div class="text-center">
								<input type="submit" id="txt-save" class="btn" name="txt-save" value="ĐĂNG KÝ NGAY">
							</div>
						</form>
					</aside>
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
										<?php echo $thumb;?>
										<div class="name"><?php echo $name; ?></div>
										<div class="career"><?php echo $career; ?></div>
									</div>
									<div class="content"><?php echo $comment; ?></div>
								</div>
							<?php } ?>
						</div>
					</aside>
					<aside class="aside latest-news">
						<h3 class="aside-title"><i class="fa fa-circle" aria-hidden="true"></i><span>Tin mới nhất</span></h3>
						<?php
						$sql="SELECT * FROM tbl_contents WHERE isactive=1 ORDER BY cdate DESC LIMIT 0,5";
						$objmysql->Query($sql);
						$i=1;
						while ($row = $objmysql->Fetch_Assoc()) {
							$title 	= stripcslashes($row['title']);
							$code 	= $row['code'];
							$thumb 	= getThumb($row['thumb'], 'img-responsive', '');
							$views 	= (int)$row['visited'];
							$cdate 	= convert_date($row['cdate']);

							$sql_cate="SELECT * FROM tbl_categories WHERE isactive=1 AND id=".$row['category_id'];
							$objdata->Query($sql_cate);
							$r_cate = $objdata->Fetch_Assoc();
							$link 	= ROOTHOST.$r_cate['code'].'/'.$code.'.html';

							echo '<div class="item">
							<div class="number">'.$i.'.</div>
							<div class="content">
							<div class="title"><a href="'.$link.'" title="'.$title.'">'.$title.'</a></div>
							<div class="info">
							<span class="date">'.$cdate.'</span>';
							if($views > 0){
								echo '<span class="views">'.$views.'views</span>';
							}
							echo '</div>
							</div>
							<div class="box-thumb"><a href="'.$link.'" title="'.$title.'">'.$thumb.'</a></div>
							</div>';
							$i++;
						}
						?>
					</aside>

					<aside class="aside advertisement">
						<h3 class="aside-title"><i class="fa fa-circle" aria-hidden="true"></i><span>Trending</span></h3>
						<div>
							<a href="" title="Trending"><img src="<?php echo ROOTHOST; ?>images/advantisement.jpg" align=""></a>
						</div>
					</aside>
				</div>
			</div>
		</div>
	</div>
	<div class="shake-hands">
		<div class="bg-overlay"></div>
		<div class="content text-center">
			<h2>BẠN CẦN DỊCH TÀI LIỆU SANG TIẾNG VIỆT?</h2>
			<a href="" title="" class="btn">LIÊN HỆ LETOTRANS NGAY</a>
		</div>
	</div>
</section>
<script type="text/javascript">
	$('#aside-feedback').owlCarousel({
		navigation : true,
		slideSpeed : 3000,
		paginationSpeed : 400,
		loop: true,
		items : 1, 
		itemsDesktop : false,
		itemsDesktopSmall : false,
		itemsTablet: false,
		itemsMobile : false
	})
</script>