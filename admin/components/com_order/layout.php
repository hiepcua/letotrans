<?php
defined('ISHOME') or die('Can not acess this page, please come back!');
define('COMS','order');
define('THIS_COM_PATH',COM_PATH.'com_'.COMS.'/');
$objmysql 	= new CLS_MYSQL();

if(isset($_POST["cmdsave"])){
	$status = isset($_POST['opt_status']) ? (int)$_POST['opt_status'] : 1;
	$price2 = isset($_POST['txt_total2']) ? (int)$_POST['txt_total2'] : 0;
	$filenames = isset($_POST['txt_filename']) ? $_POST['txt_filename'] : [];
	$numbers = isset($_POST['txt_number']) ? $_POST['txt_number'] : [];
	$new_arr_file = array();

	if($filenames !== [] && $numbers !== []){
		foreach ($filenames as $key => $value) {
			$tmp = array();
			$tmp['name'] = $value;
			$tmp['numpage'] = $_POST['txt_number'][$key];
			array_push($new_arr_file, $tmp);
		}
	}
	$json_files = json_encode($new_arr_file);
	$json_files = mysql_real_escape_string($json_files);
	if(isset($_POST['txtid'])){
		$ID = $_POST['txtid'];

		$sql = "UPDATE tbl_order SET 
		`total2` = '".$price2."',
		`files` = '".$json_files."',
		`status` = '".$status."'
		WHERE `id` 			= '".$ID."'";
		$objmysql->Exec($sql);
	}
	// echo "<script language=\"javascript\">window.location='".ROOTHOST_ADMIN.COMS."'</script>";
}

$task='';
if(isset($_GET['task'])) $task=$_GET['task'];
if(!is_file(THIS_COM_PATH.'task/'.$task.'.php')){
	$task='list';
}
include_once(THIS_COM_PATH.'task/'.$task.'.php');
unset($obj); unset($task);	unset($objlang); unset($ids);
?>
