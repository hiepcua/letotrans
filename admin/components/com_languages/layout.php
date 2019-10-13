<?php
defined('ISHOME') or die('Can not acess this page, please come back!');
define('COMS','languages');
define('THIS_COM_PATH',COM_PATH.'com_'.COMS.'/');

// Begin Toolbar
include_once(EXT_PATH.'cls.upload.php');
$objmysql = new CLS_MYSQL();
$objUpload = new CLS_UPLOAD();

// End toolbar
if(isset($_POST["cmdsave"])){		
	$Name 		= isset($_POST['txt_name']) ? addslashes($_POST['txt_name']) : "";
	$ISO 		= isset($_POST['txt_iso']) ? addslashes($_POST['txt_iso']) : "";
	$Price 		= isset($_POST['txt_price_cc']) ? (int)$_POST['txt_price_cc'] : NULL;
	$isActive 	= '1';
    if(isset($_POST["txtthumb"]))
        $Thumb = addslashes($_POST["txtthumb"]);
    if(isset($_POST['txtid'])){
		$ID = $_POST['txtid'];
		$sql = "UPDATE `tbl_languages` SET  
		`name` 	= '".$Name."',
		`iso` 	= '".$ISO."',
		`price_cc` 	= ".$Price.",
		`image` 	= '".$Thumb."'
		WHERE `id` 	= '".$ID."'";
		$objmysql->Exec($sql);
	}else{
		$sql = "INSERT INTO `tbl_languages` ( `name`, `iso`, `image`, `price_cc`, `isactive`) VALUES ('".$Name."','".$ISO."','".$Thumb."', '".$Price."', '".$isActive."')";
		$objmysql->Exec($sql);
	}
	echo "<script language=\"javascript\">window.location='".ROOTHOST_ADMIN.COMS."'</script>";
}

if(isset($_POST["txtaction"]) && $_POST["txtaction"]!=""){
	$ids=trim($_POST["txtids"]);
	if($ids!='')
		$ids = substr($ids,0,strlen($ids)-1);
	$ids=str_replace(",","','",$ids);

	switch ($_POST["txtaction"]){
		case "public": 
			$sql_active = "UPDATE `tbl_languages` SET `isactive`='1' WHERE `id` in ('$ids')";
			$objmysql->Exec($sql_active);
			break;
		case "unpublic":
			$sql_unactive = "UPDATE `tbl_languages` SET `isactive`='0' WHERE `id` in ('$ids')";
			$objmysql->Exec($sql_unactive);
			break;
		case "delete":
			$sql_del = "DELETE FROM `tbl_languages` WHERE `id` in ('$ids')";
	        $objmysql->Exec($sql_del);
	        break;
		case 'order':
			$sls = explode(',',$_POST['txtorders']); 
			$ids = explode(',',$_POST['txtids']);
			$n = count($ids);
			for($i=0;$i<$n;$i++){
				$sql_order = "UPDATE `tbl_languages` SET `order`='".$sls[$i]."' WHERE `id` = '".$ids[$i]."' ";
				$objmysql->Exec($sql_order);
			}
	}
	echo "<script language=\"javascript\">window.location='".ROOTHOST_ADMIN.COMS."'</script>";
}

$task='';
if(isset($_GET['task']))
	$task=$_GET['task'];
if(!is_file(THIS_COM_PATH.'task/'.$task.'.php')){
	$task='list';
}
include_once(THIS_COM_PATH.'task/'.$task.'.php');
unset($obj); unset($task);	unset($objlang); unset($ids);
?>