<?php
define("isHOME",true);
session_start();
require_once("../../global/libs/gfinit.php");
require_once("../../global/libs/gfconfig.php");
require_once("../libs/cls.mysqli.php");

$objmysql = new CLS_MYSQL;
$id 		= isset($_POST['id']) ? (int)$_POST['id'] : 0;
$numpage 	= isset($_POST['numpage']) ? (int)$_POST['numpage'] : 0;
$total 		= '';

if($id !== 0 && $numpage !== 0){
	$sql = "SELECT * FROM tbl_order WHERE id = ".$id;
	$objmysql->Query($sql);
	$row = $objmysql->Fetch_Assoc();

	$dfprice = (int)$row['lang_price'];
	$ccd = (int)$row['ccd'];
	$ccg = ($row['ccg'] != 0) ? 120000 : 0;
	$ship = ($row['ship'] != 0) ? 50000 : 0;
	

	if($row['time'] == 0){
		$total = $dfprice * $numpage + $ccg + $ccd + $ship;
	}else{
		$total = $dfprice * $numpage + ($dfprice * $numpage) * 0.25 + $ccg + $ccd + $ship;
	}
	// echo $dfprice.'<br>';
	// echo $numpage.'<br>';
	// echo $ccg.'<br>';
	// echo $ccd.'<br>';
	// echo $ship.'<br>';
	echo $total;
}
?>
