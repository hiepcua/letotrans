<?php 
session_start();
include_once("../global/libs/gfinit.php");
include_once("../global/libs/gfconfig.php");
include_once("../libs/cls.mysqli.php");
$objmysql = new CLS_MYSQL();
$objdata = new CLS_MYSQL();

$id = isset($_POST['id'])  ? (int)$_POST['id'] : 0;
$lang_df = isset($_POST['lang_df'])  ? (int)$_POST['lang_df'] : 0;

if($id == $lang_df){
	$sql = "SELECT * FROM tbl_languages WHERE isactive=1 AND id <> ".$lang_df;
	$objdata->Query($sql);

	while ($row = $objdata->Fetch_Assoc()) {
		echo '<option value="'.$row['id'].'">'.$row['name'].'</option>';
	}
}else{
	$sql = "SELECT * FROM tbl_languages WHERE isactive = 1 AND id = ".$lang_df;
	$objdata->Query($sql);
	$row = $objdata->Fetch_Assoc();
	echo '<option value="'.$row['id'].'">'.$row['name'].'</option>';
}
?>