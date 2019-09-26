<?php
// Begin pagging
define('OBJ_PAGE','LIST_CONTENTS');
if(!isset($_SESSION['CUR_PAGE_'.OBJ_PAGE])){
	$_SESSION['CUR_PAGE_'.OBJ_PAGE] = 1;
}
if(isset($_POST['txtCurnpage'])){
	$_SESSION['CUR_PAGE_'.OBJ_PAGE] = (int)$_POST['txtCurnpage'];
}

$sql_count = "SELECT COUNT(*) AS count FROM tbl_feedback WHERE isactive = 1";
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
<section class="page page-feedback">
	<div class="container">
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="<?= ROOTHOST; ?>" title="Trang chủ">
						Trang chủ
					</a>
				</li>
				<li class="breadcrumb-item active" aria-current="page">
					Ý kiến khách hàng
				</li>
			</ol>
		</nav>
		<div class="page-content">
			<h1 class="page-title"><span>Ý kiến khách hàng</span></h1>
			<div class="list-feedback">
				<?php
				$star = ($cur_page - 1) * $MAX_ROWS;
				$sql = "SELECT * FROM tbl_feedback WHERE isactive = 1 ORDER BY `order` ASC LIMIT $star,".$MAX_ROWS;
				$objmysql->Query($sql);
				while ($r_con = $objmysql->Fetch_Assoc()) {
					$name 		= stripcslashes($r_con['name']);
					$avatar 	= getThumb($r_con['avatar'], 'img-responsive', '');
					$comment 	= stripslashes($r_con['comment']);
					$career 	= stripslashes($r_con['career']);
					
					echo '<div class="item">
					<div class="box-thumb">'.$avatar.'</div>
					<div class="content">
					<h3 class="name"><i class="fa fa-circle" aria-hidden="true"></i>'.$name.'</h3>
					<div class="career">'.$career.'</div>
					<div class="comment">'.$comment.'</div>
					</div>
					</div>';
				}
				?>
			</div>
			<div class="text-center">
				<?php paging($total_rows,$MAX_ROWS,$cur_page); ?>
			</div>
		</div>
	</div>
</section>