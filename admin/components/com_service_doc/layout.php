<?php
defined('ISHOME') or die('Can not acess this page, please come back!');
define('COMS','service_doc');
define('THIS_COM_PATH',COM_PATH.'com_'.COMS.'/');
$objmysql = new CLS_MYSQL();
$objdata = new CLS_MYSQL();

if(isset($_POST['cmdsave'])){
	$Service_id 		= isset($_POST['cbo_service']) ? (int)$_POST['cbo_service'] : 0;
	$Service_type_id 	= isset($_POST['cbo_service_type']) ? (int)$_POST['cbo_service_type'] : 0;
	$Intro 				= isset($_POST['txt_intro']) ? addslashes($_POST['txt_intro']) : '';
	$Name 				= isset($_POST['txt_name']) ? addslashes($_POST['txt_name']) : '';
	$Code 				= un_unicode($_POST['txt_name']);
	$Fulltext 			= isset($_POST['txt_fulltext']) ? addslashes($_POST['txt_fulltext']) : '';
	$Thumb 				= isset($_POST['txtthumb']) ? addslashes($_POST['txtthumb']) : '';

	$sql_service = "SELECT * FROM tbl_service WHERE isactive = 1 AND id = ".$Service_id;
	$objdata->Query($sql_service);
	$r1 = $objdata->Fetch_Assoc();

	$sql_service_type = "SELECT * FROM tbl_service_type WHERE isactive = 1 AND id = ".$Service_type_id;
	$objdata->Query($sql_service_type);
	$r2 = $objdata->Fetch_Assoc();

	$Meta_title 	= isset($_POST['txt_metatitle']) ? addslashes(htmlentities($_POST['txt_metatitle'])) : '';
	$Meta_key 		= isset($_POST['txt_metakey']) ? addslashes(htmlentities($_POST['txt_metakey'])) : '';
	$Meta_desc 		= isset($_POST['txt_metadesc']) ? addslashes(htmlentities($_POST['txt_metadesc'])) : '';
	$seo_link 		= isset($_POST['txt_seo_link']) ? $_POST['txt_seo_link'] : '';
	$Link 			= ROOTHOST.'dich-vu/'.$r1['code'].'/'.$r2['code'].'/';

	if(isset($_POST['txtid'])){
		$ID = (int)$_POST['txtid'];

		$objmysql->Query("BEGIN");
		$sql = "UPDATE tbl_service_doc SET 
		`name` 				= '".$Name."',
		`code` 				= '".$Code."',
		`service_id` 		= '".$Service_id."',
		`service_type_id` 	= '".$Service_type_id."',
		`intro` 			= '".$Intro."',
		`fulltext` 			= '".$Fulltext."'
		WHERE id  			= ".$ID;
		// echo $sql;
        $result = $objmysql->Exec($sql);

        $sql2 = "UPDATE tbl_seo SET 
		`title` 		= '".$Name."', 
		`link` 			= '".$Link."',
		`image` 		= '".$Thumb."',
		`meta_title` 	= '".$Meta_title."',
		`meta_key` 		= '".$Meta_key."',
		`meta_desc` 	= '".$Meta_desc."'
		WHERE `link` 	= '".$seo_link."'";
		// echo $sql2;
		$result2 = $objmysql->Exec($sql2);

		if($result && $result2){
			$objmysql->Exec('COMMIT');
		}
		else
			$objmysql->Exec('ROLLBACK');
	}else{
		$objmysql->Exec("BEGIN");
		$sql = "INSERT INTO tbl_service_doc (`name`, `code`, `service_id`, `service_type_id`, `intro`, `fulltext`) VALUES ('".$Name."', '".$Code."', '".$Service_id."', '".$Service_type_id."', '".$Intro."', '".$Fulltext."')";
		$result = $objmysql->Exec($sql);

		$sql2 = "INSERT INTO tbl_seo (`title`,`link`,`image`,`meta_title`,`meta_key`,`meta_desc`) VALUES ('".$Name."','".$Link."','".$Thumb."','".$Meta_title."','".$Meta_key."','".$Meta_desc."')";
		$result2 = $objmysql->Exec($sql2);

		if($result && $result2){
			$objmysql->Exec('COMMIT');
		}else{
			$objmysql->Exec('ROLLBACK');
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
		$sql_active = "UPDATE tbl_service_doc SET `isactive`='1' WHERE `id` in ('$ids')";
		$objmysql->Exec($sql_active);
		break;
		case "unpublic":
		$sql_unactive = "UPDATE tbl_service_doc SET `isactive`='0' WHERE `id` in ('$ids')";
		$objmysql->Exec($sql_unactive);
		break;
		case "delete":

		$sql = "SELECT * FROM tbl_service_doc WHERE id in ('$ids')";
		$objmysql->Query($sql);
		$seo_links = array();

		while ( $row = $objmysql->Fetch_Assoc() ) {
			$sql1 = "SELECT * FROM tbl_service WHERE id = ".$row['service_id'];
			$objdata->Query($sql1);
			$row1 = $objdata->Fetch_Assoc();

			$sql2 = "SELECT * FROM tbl_service_type WHERE id = ".$row['service_type_id'];
			$objdata->Query($sql2);
			$row2 = $objdata->Fetch_Assoc();

			$seo_link   = ROOTHOST.'dich-vu/'.$row1['code'].'/'.$row2['code'].'/';
			array_push($seo_links, $seo_link);

			$sql_del = "DELETE FROM `tbl_service_doc` WHERE `id` in ('$ids')";
			$objdata->Exec($sql_del);
		}


		foreach ($seo_links as $key => $value) {
			$sql_del1 = "DELETE FROM `tbl_seo` WHERE `link` = '".$value."'";
			$objmysql->Exec($sql_del1);
		}

		break;
		case 'order':
		$sls = explode(',',$_POST['txtorders']); 
		$ids = explode(',',$_POST['txtids']);
		$n = count($ids);
		for($i=0;$i<$n;$i++){
			$sql_order = "UPDATE tbl_service_doc SET `order`='".$sls[$i]."' WHERE `id` = '".$ids[$i]."' ";
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