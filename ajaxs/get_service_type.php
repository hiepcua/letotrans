<?php 
session_start();
include_once("../global/libs/gfinit.php");
include_once("../global/libs/gfconfig.php");
include_once("../libs/cls.mysqli.php");
$objmysql = new CLS_MYSQL();
$objdata = new CLS_MYSQL();

$id = isset($_POST['id'])  ? (int)$_POST['id'] : 0;
if($id !== 0){
	$sql = "SELECT * FROM tbl_service_doc WHERE isactive=1 AND service_id = ".$id;
	$objmysql->Query($sql);
	$i = 1;
	while ($row = $objmysql->Fetch_Assoc()) {

		$sql1 = "SELECT * FROM tbl_service_type WHERE isactive=1 AND id = ".$row['service_type_id'];
		$objdata->Query($sql1);

		while ($row1 = $objdata->Fetch_Assoc()) {
			if($i == 1) $active = 'active';
			else $active = '';
			echo '<div class="item '.$active.'" data-id="'.$row1['id'].'" data-name="'.$row1['name'].'" onclick="select_service_type(this)" data-toggle="tooltip" title="'.$row1['name'].'"><div class="inside"><img src="'.$row1['icon'].'" class="img-responsive"></div></div>';
			$i++;
		}
	}
}
?>