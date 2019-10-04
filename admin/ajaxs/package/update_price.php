<?php
session_start();
require_once("../../../global/libs/gfinit.php");
require_once("../../../global/libs/gfconfig.php");
require_once("../../libs/cls.mysql.php");

$objdata = new CLS_MYSQL;
$id 	= isset($_POST['id']) ? (float)$_POST['id'] : 0;
$name 	= isset($_POST['name']) ? $_POST['name'] : '';
$price 	= isset($_POST['price']) ? (float)$_POST['price'] : 0;

if($name == 'txt_price_basic'){
	$sql="UPDATE tbl_package SET price_basic = $price WHERE id = $id";
}else if($name == 'txt_price_pro'){
	$sql="UPDATE tbl_package SET price_pro = $price WHERE id = $id";
}else if($name == 'txt_price_vip'){
	$sql="UPDATE tbl_package SET price_vip = $price WHERE id = $id";
}
$objdata->Exec($sql);
echo number_format($price);
?>