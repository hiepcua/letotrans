<?php
$code = 'cau-hoi-thuong-gap';
$sql_cate = "SELECT * FROM tbl_categories WHERE isactive = 1 AND `code` = '".$code."'";
$objmysql->Query($sql_cate);
$r_cate = $objmysql->Fetch_Assoc();
?>
<section class="page page-FAQ">
	<div class="container">
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="<?= ROOTHOST; ?>" title="Trang chủ">
						Trang chủ
					</a>
				</li>
				<li class="breadcrumb-item active" aria-current="page">
					Câu hỏi thường gặp
				</li>
			</ol>
		</nav>
		<div class="page-content">
			<h1 class="page-title"><span>Câu hỏi thường gặp</span></h1>
			<div class="list-items">
				<?php
				$sql_cate2 = "SELECT * FROM tbl_categories WHERE isactive = 1 AND `par_id` = '".$r_cate['id']."'";
				$objmysql->Query($sql_cate2);
				while ($r_cate2 = $objmysql->Fetch_Assoc()) {
					$cate_name = stripslashes($r_cate2['name']);
					echo '<div id="faq-group-'.$r_cate2['id'].'">';
					echo '<h2>'.$cate_name.'</h2>';

					$sql = "SELECT * FROM tbl_contents WHERE isactive = 1 AND `category_id` = '".$r_cate2['id']."' ORDER BY `cdate` DESC";
					$objdata->Query($sql);
					while ($r_con = $objdata->Fetch_Assoc()) {
						$title 	= stripcslashes($r_con['title']);
						$code 	= $r_con['code'];
						$thumb 	= getThumb($r_con['thumb'], 'img-responsive', '');
						$views 	= (int)$r_con['visited'];
						$cdate 	= convert_date($r_con['cdate']);
						$intro 	= stripslashes($r_con['intro']);
						$link 	= ROOTHOST.$r_cate['code'].'/'.$code.'.html';
					
						echo '<div class="item">
							<h3 class="title"><i class="fa fa-circle" aria-hidden="true"></i><a data-toggle="collapse" data-parent="#faq-group-'.$r_cate2['id'].'" href="#faq-collapse-'.$r_con['id'].'" title="'.$title.'">'.$title.'</a></h3>
							<div id="faq-collapse-'.$r_con['id'].'" class="panel-collapse collapse">
								<div class="sapo">'.$intro.'</div>
							</div>
						</div>';
					}
					echo '</div><hr>';
				}
				?>
			</div>
		</div>
	</div>
</section>