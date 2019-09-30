<section class="page page-service">
	<div class="container">
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="<?= ROOTHOST; ?>" title="Trang chủ">
						Trang chủ
					</a>
				</li>
				<li class="breadcrumb-item active" aria-current="page">
					Dịch vụ
				</li>
			</ol>
		</nav>
		<div class="page-content">
			<h1 class="page-title"><span>Dịch vụ chúng tôi cung cấp</span></h1>
			<div class="list-service">
				<?php
				$sql = "SELECT * FROM tbl_service WHERE isactive = 1 ORDER BY `order` ASC";
				$objmysql->Query($sql);
				while ($r_service = $objmysql->Fetch_Assoc()) {
					$title 	= stripcslashes($r_service['name']);
					$code 	= $r_service['code'];
					$sapo 	= stripslashes($r_service['sapo']);
					$link 	= ROOTHOST.'dich-vu/'.$code.'.html';

					$sql_service_type = "SELECT * FROM tbl_service_type WHERE isactive = 1 AND service_id = ".$r_service['id'];
					$objdata->Query($sql_service_type);
					$link_order = ROOTHOST.'order';
					
					echo '<div class="row-service row-flex">';
				
					echo '<div class="item item-service">
						<div class="inner">
						<div class="header-title"><i class="fa fa-circle" aria-hidden="true"></i>'.$title.'</div>
						<div class="content">'.$sapo.'</div>
						</div>
					</div>';

					$shtml1 = '<ul>';
					$shtml2 = '<ul>';

					while ($r_service_type = $objdata->Fetch_Assoc()) {
						$shtml1.='<li><i class="fa fa-circle" aria-hidden="true"></i>'.$r_service_type['name'].'</li>';
						$shtml2.='<li><i class="fa fa-circle" aria-hidden="true"></i>'.$r_service_type['name'].'<span class="price">'.$r_service_type['price'].'đ</span></li>';
					}

					$shtml1.= '</ul>';
					$shtml2.= '</ul>';
					$shtml2.= '<div class="text-center"><a href="'.$link_order.'" class="btn btn-order">TÌM HIỂU THÊM</a></div>';

					echo '<div class="item item-service-type">
						<div class="inner">
						<div class="header-title">DANH SÁCH LĨNH VỰC</div>
						<div class="content">'.$shtml1.'</div>
						</div>
					</div>';

					echo '<div class="item item-service-price">
						<div class="inner">
						<div class="header-title">BẢNG GIÁ DỊCH THEO TỪNG TỪ</div>
						<div class="content">'.$shtml2.'</div>
						</div>
					</div>';
					echo '</div>';
					echo '<div class="text-center"><a href="'.$link.'" title="Tìm hiểu kỹ hơn về '.$title.'" class="view-detail">TÌM HIỂU KỸ HƠN VỀ '.$title.'</a></div>';
				}
				?>
			</div>
		</div>
	</div>
</section>