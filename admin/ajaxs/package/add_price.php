<?php
session_start();
require_once("../../../global/libs/gfinit.php");
require_once("../../../global/libs/gfconfig.php");
require_once("../../libs/cls.mysql.php");

$objdata = new CLS_MYSQL;
$objmysql = new CLS_MYSQL;
$service_id = isset($_POST['service_id']) ? (int)$_POST['service_id'] : 0;

$shtml = '<label>Giá gói dịch vụ theo từng loại</label>
<table class="table table-bordered">
<thead>
<th>Tên dịch vụ</th>
<th>Lĩnh vực/Loại sản phẩm</th>
<th>Gói cơ bản</th>
<th>Gói pro</th>
<th>Gói vip</th>
</thead>
<tbody>';

if($service_id !== 0){
	$sql = "SELECT * FROM tbl_service WHERE isactive = 1 AND id = ".$service_id;
	$objmysql->Query($sql);
	$row = $objmysql->Fetch_Assoc();
	$service_type = ($row['service_type_id'] !== '' && $row['service_type_id'] !== NULL) ? json_decode($row['service_type_id']) : [];

	if ($service_type !== []) {
		$service_type = implode(",",$service_type);
		$sql = "SELECT * FROM tbl_service_type WHERE isactive = 1 AND id IN(".$service_type.")";
		$objmysql->Query($sql);
		while ($row2 = $objmysql->Fetch_Assoc()) {
			$shtml.='<tr>
			<td>'.$row['name'].'</td>
			<td>'.$row2['name'].'<input type="hidden" name="txt_service_type[]" value="'.$row2['id'].'"/></td>
			<td><input type="number" name="txt_price_basic[]"></td>
			<td><input type="number" name="txt_price_pro[]"></td>
			<td><input type="number" name="txt_price_vip[]"></td>
			</tr>';	
		}
	}
}
$shtml.= '</tbody>
</table>';
echo $shtml;
?>