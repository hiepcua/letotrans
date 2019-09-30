<?php
defined('ISHOME') or die('Can not acess this page, please come back!');
define('COMS','service');
define('THIS_COM_PATH',COM_PATH.'com_'.COMS.'/');

$objmysql 	= new CLS_MYSQL();

if(isset($_POST["cmdsave"])){
	$isActive 		= isset($_POST['opt_isactive']) ? (int)$_POST['opt_isactive'] : 0;

	$Title 			= isset($_POST['txt_name']) ? addslashes($_POST['txt_name']) : '';
	$Code 			= un_unicode($_POST['txt_name']);
	$Author 		= $_SESSION[MD5($_SERVER['HTTP_HOST']).'_USERLOGIN']['username'];
	$Sapo 			= isset($_POST['txt_sapo']) ? addslashes(htmlentities($_POST['txt_sapo'])) : '';
	$Fulltext 		= isset($_POST['txt_fulltext']) ? addslashes($_POST['txt_fulltext']) : '';
	$Thumb 			= isset($_POST['txtthumb']) ? addslashes($_POST['txtthumb']) : '';
	$date 			= time();

	$Meta_title 	= isset($_POST['txt_metatitle']) ? addslashes(htmlentities($_POST['txt_metatitle'])) : '';
	$Meta_key 		= isset($_POST['txt_metakey']) ? addslashes(htmlentities($_POST['txt_metakey'])) : '';
	$Meta_desc 		= isset($_POST['txt_metadesc']) ? addslashes(htmlentities($_POST['txt_metadesc'])) : '';
	$seo_link 		= isset($_POST['txt_seo_link']) ? $_POST['txt_seo_link'] : '';

	$Link 			= ROOTHOST.'dich-vu/'.$Code.'.html';

	if(isset($_POST['txtid'])){
		$Mdate = $date;
		$ID = $_POST['txtid'];

		$objmysql->Query("BEGIN");
		$sql = "UPDATE tbl_service SET 
		`code` 		= '".$Code."',
		`thumb` 	= '".$Thumb."',
		`mdate` 	= '".$Mdate."',
		`author` 	= '".$Author."',
		`isactive` 	= '".$isActive."',
		`name` 		= '".$Title."',
		`sapo` 		= '".$Sapo."',
		`fulltext` 	= '".$Fulltext."'
		WHERE `id` 	= '".$ID."'";
		
		$result = $objmysql->Exec($sql);

		$sql2 = "UPDATE tbl_seo SET 
		`title` = '".$Title."', 
		`link` = '".$Link."',
		`image` = '".$Thumb."',
		`meta_title` = '".$Meta_title."',
		`meta_key` = '".$Meta_key."',
		`meta_desc` = '".$Meta_desc."'
		WHERE `link` = '".$seo_link."'";
		
		$result2 = $objmysql->Exec($sql2);

		if($result && $result2){
			$objmysql->Exec('COMMIT');
		}
		else
			$objmysql->Exec('ROLLBACK');
	}else{
		$Cdate = $date;

		$objmysql->Exec("BEGIN");
		$sql = "INSERT INTO tbl_service (`code`,`thumb`,`cdate`,`author`,`isactive`,`name`,`sapo`,`fulltext`) VALUES ('".$Code."','".$Thumb."','".$Cdate."','".$Author."','".$isActive."','".$Title."','".$Sapo."', '".$Fulltext."')";
		
		$result = $objmysql->Exec($sql);

		$sql2 = "INSERT INTO tbl_seo (`title`,`link`,`image`,`meta_title`,`meta_key`,`meta_desc`) VALUES ('".$Title."','".$Link."','".$Thumb."','".$Meta_title."','".$Meta_key."','".$Meta_desc."')";
		
		$result2 = $objmysql->Exec($sql2);

		if($result && $result2){
			$objmysql->Exec('COMMIT');
		}else{
			$objmysql->Exec('ROLLBACK');
		}
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
			$sql_active = "UPDATE `tbl_service` SET `isactive`='1' WHERE `id` in ('$ids')";
			$objmysql->Exec($sql_active);
			break;
		case "unpublic":
			$sql_unactive = "UPDATE `tbl_service` SET `isactive`='0' WHERE `id` in ('$ids')";
			$objmysql->Exec($sql_unactive);
			break;
		case "delete":
			$sql_del = "DELETE FROM `tbl_service` WHERE `id` in ('$ids')";
	        $objmysql->Exec($sql_del);
	        break;
		case 'order':
			$sls = explode(',',$_POST['txtorders']); 
			$ids = explode(',',$_POST['txtids']);
			$n = count($ids);
			for($i=0;$i<$n;$i++){
				$sql_order = "UPDATE `tbl_service` SET `order`='".$sls[$i]."' WHERE `id` = '".$ids[$i]."' ";
				$objmysql->Exec($sql_order);
			}
	}
	echo "<script language=\"javascript\">window.location='".ROOTHOST_ADMIN.COMS."'</script>";
}

$task='';
if(isset($_GET['task'])) $task=$_GET['task'];
if(!is_file(THIS_COM_PATH.'task/'.$task.'.php')){
	$task='list';
}
include_once(THIS_COM_PATH.'task/'.$task.'.php');
unset($obj); unset($task);	unset($objlang); unset($ids);
?>
