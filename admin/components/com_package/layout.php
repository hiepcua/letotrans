<?php
defined('ISHOME') or die('Can not acess this page, please come back!');
define('COMS','package');
define('THIS_COM_PATH',COM_PATH.'com_'.COMS.'/');
$objmysql = new CLS_MYSQL();
$objdata = new CLS_MYSQL();

if(isset($_POST['cmdsave'])){
	$Intro1 			= addslashes($_POST['txt_intro1']);
	$Intro2 			= addslashes($_POST['txt_intro2']);
	$Intro3 			= addslashes($_POST['txt_intro3']);

	$Service_id 		= isset($_POST['cbo_service']) ? (int)$_POST['cbo_service'] : 0;
	$txt_service_type 	= isset($_POST['txt_service_type']) ? $_POST['txt_service_type'] : [];

	$Price_basic 		= isset($_POST['txt_price_basic']) ? $_POST['txt_price_basic'] : [];
	$Price_pro 			= isset($_POST['txt_price_pro']) ? $_POST['txt_price_pro'] : [];
	$Price_vip 			= isset($_POST['txt_price_vip']) ? $_POST['txt_price_vip'] : [];

	if(isset($_POST['txtid'])){
		$ID = (int)$_POST['txtid'];

		foreach ($txt_service_type as $k => $v) {
			$sql = "UPDATE tbl_package SET 
				`service_id`='".$Service_id."',
				`service_type_id`='".$v."',
				`intro_basic`='".$Intro1."',
				`intro_pro`='".$Intro2."',
				`intro_vip`='".$Intro3."',
				`price_basic`='".$Price_basic[$k]."',
				`price_pro`='".$Price_pro[$k]."',
				`price_vip`='".$Price_vip[$k]."'
				WHERE id = ".$ID;
			$objmysql->Exec($sql);
		}
	}else{
		foreach ($txt_service_type as $k => $v) {
			$sql = "INSERT INTO tbl_package (`service_id`, `service_type_id`, `intro_basic`, `intro_pro`, `intro_vip`, `price_basic`, `price_pro`, `price_vip`) VALUES ('".$Service_id."', '".$v."', '".$Intro1."', '".$Intro2."', '".$Intro3."', '".$Price_basic[$k]."', '".$Price_pro[$k]."', '".$Price_vip[$k]."' )";
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
			$sql_active = "UPDATE tbl_package SET `isactive`='1' WHERE `id` in ('$ids')";
			$objmysql->Exec($sql_active);
			break;
		case "unpublic":
			$sql_unactive = "UPDATE tbl_package SET `isactive`='0' WHERE `id` in ('$ids')";
			$objmysql->Exec($sql_unactive);
			break;
		case "delete":
			$sql_del = "DELETE FROM tbl_package WHERE `id` in ('$ids')";
	        $objmysql->Exec($sql_del);
	        break;
		case 'order':
			$sls = explode(',',$_POST['txtorders']); 
			$ids = explode(',',$_POST['txtids']);
			$n = count($ids);
			for($i=0;$i<$n;$i++){
				$sql_order = "UPDATE tbl_package SET `order`='".$sls[$i]."' WHERE `id` = '".$ids[$i]."' ";
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