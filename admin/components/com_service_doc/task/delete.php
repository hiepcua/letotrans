<?php
	defined('ISHOME') or die('Can not acess this page, please come back!');
	$id='';
	if(isset($_GET['id']))
		$id=(int)$_GET['id'];

	$sql = "SELECT * FROM tbl_service_doc WHERE id = ".$id;
	$objmysql->Query($sql);
	$row = $objmysql->Fetch_Assoc();

	$sql1 = "SELECT * FROM tbl_service WHERE id = ".$row['service_id'];
	$objmysql->Query($sql1);
	$row1 = $objmysql->Fetch_Assoc();

	$sql2 = "SELECT * FROM tbl_service_type WHERE id = ".$row['service_id'];
	$objmysql->Query($sql2);
	$row2 = $objmysql->Fetch_Assoc();


	$seo_link   = ROOTHOST.'dich-vu/'.$row1['code'].'/'.$row2['code'];
	
	$objmysql->Query("BEGIN");
	$sql_del1 	= "DELETE FROM `tbl_seo` WHERE `link` = '".$seo_link."'";
	$result 	= $objmysql->Exec($sql_del1);

	$sql_del 	= "DELETE FROM `tbl_service_doc` WHERE `id` in ('$id')";
	$result2 	= $objmysql->Exec($sql_del);

	if($result && $result2){
		$objmysql->Exec('COMMIT');
	}
	else
		$objmysql->Exec('ROLLBACK');

	echo "<script language=\"javascript\">window.location='".ROOTHOST_ADMIN.COMS."'</script>";
?>