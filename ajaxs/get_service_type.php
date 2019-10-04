<?php 
session_start();
include_once("../global/libs/gfinit.php");
include_once("../global/libs/gfconfig.php");
include_once("../libs/cls.mysql.php");
$objmysql = new CLS_MYSQL();

$id 	= isset($_POST['id'])  ? (int)$_POST['id'] : 0;
$name 	= isset($_POST['name'])  ? addslashes($_POST['name']) : 0;
if($id !== 0){
	$sql1 = "SELECT * FROM tbl_service WHERE isactive=1 AND id = ".$id;
	$objmysql->Query($sql1);
	$row = $objmysql->Fetch_Assoc();

	$service_type 	= ($row['service_type_id'] !== NULL && $row['service_type_id'] !== '') ? json_decode($row['service_type_id']) : [];

	$str_service_type = implode(',', $service_type);
	if($name !== 'Dịch bản địa hóa'){
?>
<label>Chọn lĩnh vực:<small class="red"> (*)</small><span id="err_service_type" class="mes-error"></span></label>
<div class="block-service-type">
	<?php
	$sql2 = "SELECT * FROM tbl_service_type WHERE isactive = 1 AND id IN (".$str_service_type.")";
	$objmysql->Query($sql2);
	$i = 1;
	while ($r2 = $objmysql->Fetch_Assoc()) {
		if($i == 1){
			echo '<div class="item selected" onclick="select_service_type(this)" data-id="'.$r2['id'].'">';
			echo '<input id="txt_service_type" type="hidden" name="service_type" value="'.$r2['id'].'">';
		}else{
			echo '<div class="item" onclick="select_service_type(this)" data-id="'.$r2['id'].'">';
		}
		
		echo '<span data-toggle="tooltip" title="'.$r2['name'].'"><img src="'.$r2['icon'].'" class="img-responsive"></span>';
		echo '</div>';
		$i++;
	}
	?>
</div>
<?php }else{ ?>
<label>Loại sản phẩm:<small class="red"> (*)</small><span id="err_service_type" class="mes-error"></span></label>
<div class="block-service-type">
	<?php
	$sql2 = "SELECT * FROM tbl_service_type WHERE isactive = 1 AND id IN (".$str_service_type.")";
	$objmysql->Query($sql2);
	$i = 1;
	while ($r2 = $objmysql->Fetch_Assoc()) {
		if($i == 1){
			echo '<div class="item selected" onclick="select_service_type(this)" data-id="'.$r2['id'].'">';
			echo '<input id="txt_service_type" type="hidden" name="service_type" value="'.$r2['id'].'">';
		}else{
			echo '<div class="item" onclick="select_service_type(this)" data-id="'.$r2['id'].'">';
		}
		
		echo '<span data-toggle="tooltip" title="'.$r2['name'].'">'.$r2['name'].'</span>';
		echo '</div>';
		$i++;
	}
	?>
</div>
<?php } }; ?>
<script type="text/javascript">
	$('[data-toggle="tooltip"]').tooltip();
</script>