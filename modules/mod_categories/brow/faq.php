<?php
$catid='';
$objmysql = new CLS_MYSQL();
if($r['category_id']>0) $catid = $r['category_id'];
$sql = "SELECT * FROM tbl_contents WHERE isactive = 1 AND category_id = ".$catid;
$objmysql->Query($sql);
while ($row = $objmysql->Fetch_Assoc()) {
	echo '<div class="item">';
	echo '<div class="question">'.$row['title'].'</div>';
	echo '<div class="answer">'.$row['fulltext'].'</div>';
	echo '</div>';
}; ?>