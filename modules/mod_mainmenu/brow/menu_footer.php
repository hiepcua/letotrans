<?php 
$objmysql = new CLS_MYSQL();
$mnuid = isset($r['menu_id']) ? $r['menu_id'] : 0;
$sql = "SELECT * FROM `tbl_mnuitems` WHERE `menu_id` = ". $mnuid." ORDER BY `order`";
$objmysql->Query($sql);
$str = '';

if($objmysql->Num_rows() > 0) {
	$str.= '<ul>';
	while ($res = $objmysql->Fetch_Assoc()) {
		$str.= '<li><span class="glyphicon glyphicon-chevron-right"></span><a href="'.$res['link'].'" title="'.$res['name'].'">'.$res['name'].'</a></li>';
	}
	$str.= '</ul>';
	echo $str;
}
?>