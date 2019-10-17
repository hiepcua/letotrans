<?php 
session_start();
include_once("../global/libs/gfinit.php");
include_once("../global/libs/gfconfig.php");
include_once("../libs/cls.mysqli.php");
$objmysql = new CLS_MYSQL();
$objdata = new CLS_MYSQL();

$lang1 		= isset($_POST['lang1'])  ? (int)$_POST['lang1'] : 0;
$lang2 		= isset($_POST['lang2'])  ? (int)$_POST['lang2'] : 0;
$lang_df 	= isset($_POST['lang_df'])  ? (int)$_POST['lang_df'] : 0;
$numpage 	= isset($_POST['numpage'])  ? (int)$_POST['numpage'] : 1;
$time 		= isset($_POST['time'])  ? (int)$_POST['time'] : 0;
$ccd 		= isset($_POST['ccd'])  ? (int)$_POST['ccd'] : 0; // trong bảng languages
$ccg 		= isset($_POST['ccg'])  ? (int)$_POST['ccg'] : 0; // 120k
$ship 		= isset($_POST['ship'])  ? (int)$_POST['ship'] : 0; // 50k
$total 		= 0;

if($lang1 != 0 && $lang2 != 0){
	$sql = "SELECT * FROM tbl_price WHERE lang1 = ".$lang1." AND lang2 = ".$lang2;
	$objdata->Query($sql);
	$row = $objdata->Fetch_Assoc();
	$dfprice = (float)$row['price'];

	$sql1 = "SELECT * FROM tbl_languages WHERE isactive = 1 AND id = ".$lang2;
	$objdata->Query($sql1);
	$row1 = $objdata->Fetch_Assoc();

	if($ccg != 0) $ccg = 120000;
	if($ccd != 0) $ccd = (int)$row1['price_cc'];
	if($ship != 0) $ccg = 50000;

	if($time == 0){
		$total = $dfprice * $numpage + $ccg + $ccd + $ship;
	}else{
		$total = $dfprice * $numpage + ($dfprice * $numpage) * 0.25 + $ccg + $ccd + $ship;
	}
	echo number_format($total);
}
?>