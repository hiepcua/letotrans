<?php
session_start();
require_once("../../../global/libs/gfinit.php");
require_once("../../../global/libs/gfconfig.php");
require_once("../../libs/cls.mysql.php");

$objdata = new CLS_MYSQL;
$objmysql = new CLS_MYSQL;
$language_id = isset($_POST['language_id']) ? (int)$_POST['language_id'] : 0;

$shtml = '<label>Giá dịch theo từng ngôn ngữ</label>
<table class="table table-bordered">
<thead>
<th>Ngôn ngữ</th>
<th>Ngôn ngữ</th>
<th>Giá (đồng)</th>
</thead>
<tbody>';

if($language_id !== 0){
	$sql = "SELECT * FROM tbl_languages WHERE isactive = 1 AND id = ".$language_id;
	$objmysql->Query($sql);
	$row = $objmysql->Fetch_Assoc();

	if ($row['name'] !== '') {
		$sql = "SELECT * FROM tbl_languages WHERE isactive = 1 AND id <> ".$language_id;
		$objmysql->Query($sql);
		while ($row2 = $objmysql->Fetch_Assoc()) {
			$shtml.='<tr>
			<td>'.$row['name'].'</td>
			<td>'.$row2['name'].'<input type="hidden" name="txt_lang2[]" value="'.$row2['id'].'"/></td>
			<td><input type="number" name="txt_price[]" value=""/></td>
			</tr>';	
		}
	}
}
$shtml.= '</tbody>
</table>';
echo $shtml;
?>