<?php
defined('ISHOME') or die('Can not acess this page, please come back!');
define('COMS','price');
define('THIS_COM_PATH',COM_PATH.'com_'.COMS.'/');
$objmysql = new CLS_MYSQL();
$objdata = new CLS_MYSQL();

if(isset($_POST['cmdsave'])){
	$Lang1 	= isset($_POST['cbo_languages']) ? (int)$_POST['cbo_languages'] : 0;
	$Lang2 	= isset($_POST['txt_lang2']) ? $_POST['txt_lang2'] : [];
	$Price 	= isset($_POST['txt_price']) ? $_POST['txt_price'] : [];

	if(isset($_POST['txtid'])){
		$ID 	= (int)$_POST['txtid'];
		$Price 	= isset($_POST['txt_price']) ? (float)$_POST['txt_price'] : 0;
		$sql = "UPDATE tbl_price SET 
		`price`='".$Price."'
		WHERE id = ".$ID;
		$objmysql->Exec($sql);
	}else{
		foreach ($Price as $k => $v) {
			$sql = "INSERT INTO tbl_price (`lang1`, `lang2`, `price`) VALUES ('".$Lang1."', '".$Lang2[$k]."', '".$v."')";
			$objmysql->Exec($sql);
		}
	}
	echo "<script language=\"javascript\">window.location.href='".ROOTHOST_ADMIN.COMS."'</script>";
}


if(isset($_POST["txtaction"]) && $_POST["txtaction"]!=""){
	$ids=trim($_POST["txtids"]);
	if($ids!='')
		$ids = substr($ids,0,strlen($ids)-1);
	$ids=str_replace(",","','",$ids);
	switch ($_POST["txtaction"]){
		case "public": 
		$sql_active = "UPDATE tbl_price SET `isactive`='1' WHERE `id` in ('$ids')";
		$objmysql->Exec($sql_active);
		break;
		case "unpublic":
		$sql_unactive = "UPDATE tbl_price SET `isactive`='0' WHERE `id` in ('$ids')";
		$objmysql->Exec($sql_unactive);
		break;
		case "delete":
		$sql_del = "DELETE FROM tbl_price WHERE `id` in ('$ids')";
		$objmysql->Exec($sql_del);
		break;
		case 'order':
		$sls = explode(',',$_POST['txtorders']); 
		$ids = explode(',',$_POST['txtids']);
		$n = count($ids);
		for($i=0;$i<$n;$i++){
			$sql_order = "UPDATE tbl_price SET `order`='".$sls[$i]."' WHERE `id` = '".$ids[$i]."' ";
			$objmysql->Exec($sql_order);
		}
	}
	echo "<script language=\"javascript\">window.location='".ROOTHOST_ADMIN.COMS."'</script>";
}

$task = '';
if(isset($_GET['task']))
	$task=$_GET['task'];
if(!is_file(THIS_COM_PATH.'task/'.$task.'.php')){
	$task='list';
}
include_once(THIS_COM_PATH.'task/'.$task.'.php');
unset($task); unset($ids);
?>