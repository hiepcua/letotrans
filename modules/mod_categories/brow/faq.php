<?php
$catid='';
$objmysql = new CLS_MYSQL();
if($r['category_id']>0) $catid = $r['category_id'];

$arr_ids = array();
array_push($arr_ids, $catid);
$sql1 = "SELECT * FROM tbl_categories WHERE isactive = 1 AND par_id = ".$catid;
$objmysql->Query($sql1);
while ($r_par = $objmysql->Fetch_Assoc()) {
	array_push($arr_ids, $r_par['id']);
}

$ids = implode(',', $arr_ids);

$sql = "SELECT * FROM tbl_contents WHERE isactive = 1 AND category_id IN (".$ids.")";
$objmysql->Query($sql);
while ($row = $objmysql->Fetch_Assoc()) {
	echo '<div class="item">';
	echo '<div class="question">'.$row['title'].'</div>';
	echo '<div class="answer">'.$row['fulltext'].'</div>';
	echo '</div>';
}; ?>