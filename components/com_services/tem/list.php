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
				$objdata3 			= new CLS_MYSQL();
				$sql = "SELECT * FROM tbl_service WHERE isactive = 1 ORDER BY `order` ASC";
				$objmysql->Query($sql);
				while ($r_service = $objmysql->Fetch_Assoc()) {
					$service_id 	= (int)$r_service['id'];
					$title 			= stripcslashes($r_service['name']);
					$code 			= $r_service['code'];
					$sapo 			= stripslashes($r_service['sapo']);
					$link 			= ROOTHOST.'dich-vu/'.$code.'.html';
					// $service_type 	= ($r_service['service_type_id'] !== NULL && $r_service['service_type_id'] !== '') ? json_decode($r_service['service_type_id']) : [];

					echo '<div class="row-service row-flex">';
					echo '<div class="item item-service">
						<div class="inner">
						<div class="header-title"><i class="fa fa-circle" aria-hidden="true"></i>'.$title.'</div>
						<div class="content">'.$sapo.'</div>
						</div>
					</div>';

					$shtml1 = '';
					$shtml2 = '';

					// if($service_type !== []){
						// $service_type = implode(',', $service_type);
						$sql1 = "SELECT * FROM tbl_service_doc WHERE isactive = 1 AND service_id = ".$service_id;
						$objdata->Query($sql1);

						// Danh sách loại tài liệu
						$shtml1.= '<ul>';
						$i = 1;
						while ($r1 = $objdata->Fetch_Assoc()) {
							if($i == 1){
								$link_order = ROOTHOST.'order?service='.$r_service['id'].'&service_type='.$r1['id'];
							}
							$shtml1.='<li><i class="fa fa-circle" aria-hidden="true"></i>'.$r1['name'].'</li>';
							$i++;
						}
						$shtml1.= '</ul>';

						// Bảng giá dịch theo từng trang
						// $sql2 = "SELECT * FROM tbl_package WHERE isactive = 1 AND service_id = ".$r_service['id']." AND service_type_id IN(".$service_type.")";
						// $objdata->Query($sql2);

						// $shtml2.= '<div class="header-title">BẢNG GIÁ DỊCH THEO TỪNG TRANG</div>';
						// $shtml2.= '<div class="content">';
						// $shtml2.= '<ul>';
						// while ($r2 = $objdata->Fetch_Assoc()) {
						// 	$sql3 = "SELECT * FROM tbl_service_type WHERE isactive = 1 AND id = ".$r2['service_type_id'];
						// 	$objdata3->Query($sql3);
						// 	$r3 = $objdata3->Fetch_Assoc();

						// 	$shtml2.='<li><i class="fa fa-circle" aria-hidden="true"></i>'.$r3['name'].'<span class="price">'.$r2['price_basic'].'đ</span></li>';
						// }
						// $shtml2.= '</ul>';
						// $shtml2.= '<div class="text-center"><a href="'.$link_order.'" class="btn btn-order">TÌM HIỂU THÊM</a></div>';
						// $shtml2.= '</div>';
					// }
					$tmp = 'DANH SÁCH LOẠI TÀI LIỆU';

					echo '<div class="item item-service-type">
						<div class="inner">
						<div class="header-title">'.$tmp.'</div>
						<div class="content">'.$shtml1.'</div>
						</div>
					</div>';

					// echo '<div class="item item-service-price">
					// 	<div class="inner">'.$shtml2.'</div>
					// </div>';
					echo '</div>';
					echo '<div class="text-center"><a href="'.$link.'" title="Tìm hiểu kỹ hơn về '.$title.'" class="view-detail">TÌM HIỂU KỸ HƠN VỀ '.$title.'</a></div>';
				}
				?>
			</div>
		</div>
	</div>
</section>