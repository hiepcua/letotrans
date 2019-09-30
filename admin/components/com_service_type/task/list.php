<?php
defined('ISHOME') or die('Can not acess this page, please come back!');
define('OBJ_PAGE','SERVICE_TYPE');
$strwhere='';

// Khai báo SESSION
$keyword = isset($_GET['q']) ? addslashes(trim($_GET['q'])) : '';
$action = isset($_GET['cbo_action']) ? addslashes(trim($_GET['cbo_action'])) : '';
$cbo_service = isset($_GET['cbo_service']) ? addslashes(trim($_GET['cbo_service'])) : '';

// Gán strwhere
if($keyword !== ''){
    $strwhere.=" AND ( `name` like '%$keyword%' )";
}
if($action !== '' && $action !== 'all' ){
    $strwhere.=" AND `isactive` = '$action'";
}
if($cbo_service !== '' && $cbo_service !== 'all' ){
    $strwhere.=" AND `service_id` = $cbo_service";
}

// Begin pagging
if(!isset($_SESSION['CUR_PAGE_'.OBJ_PAGE])){
    $_SESSION['CUR_PAGE_'.OBJ_PAGE] = 1;
}
if(isset($_POST['txtCurnpage'])){
    $_SESSION['CUR_PAGE_'.OBJ_PAGE] = (int)$_POST['txtCurnpage'];
}

$sql="SELECT COUNT(*) AS count FROM tbl_service_type WHERE 1=1 ".$strwhere;
$objmysql->Query($sql);
$row_count = $objmysql->Fetch_Assoc();
$total_rows = $row_count['count'];

if($_SESSION['CUR_PAGE_'.OBJ_PAGE] > ceil($total_rows/MAX_ROWS_ADMIN)){
    $_SESSION['CUR_PAGE_'.OBJ_PAGE] = ceil($total_rows/MAX_ROWS_ADMIN);
}
$cur_page = (int)$_SESSION['CUR_PAGE_'.OBJ_PAGE]>0 ? $_SESSION['CUR_PAGE_'.OBJ_PAGE] : 1;
// End pagging
?>
<script language="javascript">
	function checkinput(){
		var strids=document.getElementById("txtids");
		if(strids.value==""){
			alert('You are select once record to action');
			return false;
		}
		return true;
	}
</script>

<style type="text/css">
    .table-bordered td .title{
        margin-bottom: 8px;
    }
    .table-bordered td .info {
        font-size: 12px;
        color: #6b6b6b;
    }
    .table-bordered td .info span{
        border: 1px solid #66666621;
        border-radius: 10px;
        padding: 0 6px;
        background-color: #cccccc38;
    }
    .ispay.green {
        background-color: #5cb85c;
        color: #FFF;
    }
</style>

<div id="path">
    <ol class="breadcrumb">
        <li><a href="<?php echo ROOTHOST_ADMIN;?>">Admin</a></li>
        <li class="active">Danh sách lĩnh vực</li>
    </ol>
</div>

<div class=''>
    <div class="com_header color">
        <form id="frm_list" method="get" action="<?php echo ROOTHOST_ADMIN.COMS;?>">
            <div class="frm-search-box form-inline pull-left">
                <input class="form-control" type="text" value="<?php echo $keyword?>" name="q" id="txtkeyword" placeholder="Từ khóa"/>&nbsp;

                <select name="cbo_service" class="form-control" id="cbo_service">
                    <option value="">-- Tất cả --</option>
                    <?php
                    $sql_service = "SELECT * FROM tbl_service WHERE isactive = 1 ORDER BY name ASC";
                    $objmysql->Query($sql_service);
                    while ($r_ser = $objmysql->Fetch_Assoc()) {
                        echo '<option value="'.$r_ser['id'].'">'.$r_ser['name'].'</option>';
                    }
                    ?>
                    <script language="javascript">
                        cbo_Selected('cbo_service','<?php echo $cbo_service;?>');
                    </script>
                </select>
                <button type="submit" id="_btnSearch" class="btn btn-success">Tìm kiếm</button>
            </div>
        </form>
        <div class="pull-right">
            <div id="menus" class="toolbars">
                <form id="frm_menu" name="frm_menu" method="post" action="">
                    <input type="hidden" name="txtorders" id="txtorders" />
                    <input type="hidden" name="txtids" id="txtids" />
                    <input type="hidden" name="txtaction" id="txtaction" />
                    <ul class="list-inline">
                        <li><button class="btn btn-default" onclick="dosubmitAction('frm_menu','public');"><i class="fa fa-check-circle-o cgreen" aria-hidden="true"></i> Hiển thị</button></li>
                        <li><button class="btn btn-default" onclick="dosubmitAction('frm_menu','unpublic');"><i class="fa fa-times-circle-o cred" aria-hidden="true"></i> Ẩn</button></li>
                        <li><a class="addnew btn btn-default" href="<?php echo ROOTHOST_ADMIN.COMS;?>/add" title="Thêm mới"><i class="fa fa-plus-circle cgreen" aria-hidden="true"></i> Thêm mới</a></li>
                        <li><a class="delete btn btn-default" href="#" onclick="javascript:if(confirm('Bạn có chắc chắn muốn xóa thông tin này không?')){dosubmitAction('frm_menu','delete'); }" title="Xóa"><i class="fa fa-times-circle cred" aria-hidden="true"></i> Xóa</a></li>
                    </ul>
                </form>
            </div>
        </div>
    </div>
</div><br>
<div class='col-md-12 user_list'>
	<div class="table-responsive">
		<table class="table table-bordered table-bordered">
			<tr class="header">
                <th width="30" align="center">#</th>
                <th width="30" align="center"><input type="checkbox" name="chkall" id="chkall" value="" onclick="docheckall('chk',this.checked);" /></th>
                <th align="center">Tên</th>
                <th align="center">Giá mỗi từ</th>
                <th width="70" align="center" style="text-align: center;">Sắp xếp
                    <a href="javascript:saveOrder()"><i class="fa fa-floppy-o" aria-hidden="true"></i></a>
                </th>
                <th width="50" align="center">Hiển thị</th>
                <th width="50" align="center">Sửa</th>
                <th width="50" align="center">Xóa</th>
            </tr>
            <?php
            $star = ($cur_page - 1) * MAX_ROWS;
            $leng = MAX_ROWS;
            $sql = "SELECT * FROM tbl_service_type WHERE 1=1 ".$strwhere." ORDER BY `order` ASC LIMIT ".$star.", ".$leng;
            $objmysql->Query($sql);  $i=0;
            while($rows = $objmysql->Fetch_Assoc()){
                $i++;
                $ids        = $rows['id'];
                $price      = $rows['price'];
                $service_id = $rows['service_id'];
                $title      = stripslashes($rows['name']);

                // Get service name
                $sql_cate = "SELECT name FROM tbl_service WHERE id = ".$service_id;
                $objmysql2 = new CLS_MYSQL();
                $objmysql2->Query($sql_cate);
                $r_service  = $objmysql2->Fetch_Assoc();
                $service    = $r_service['name'];
                // End Get service name

                if($rows['isactive']==1) 
                    $icon_active="<i class='fa fa-check cgreen' aria-hidden='true'></i>";
                else $icon_active='<i class="fa fa-times-circle-o cred" aria-hidden="true"></i>';

                echo "<tr name=\"trow\">";
                echo "<td width=\"30\" align=\"center\">$i</td>";
                echo "<td width=\"30\" align=\"center\"><label>";
                echo "<input type=\"checkbox\" name=\"chk\" id=\"chk\"   onclick=\"docheckonce('chk');\" value=\"$ids\" />";
                echo "</label></td>";
                echo "<td>
                <div class='title'>$title</div>
                <div class='info'>
                <span>".$service."</span>
                </div>
                </td>";
                echo "<td>".$price." đ</td>";
                $order=$rows['order'];
                echo "<td align=\"center\"><input type=\"text\" name=\"txt_order\" id=\"txt_order\" value=\"$order\" size=\"4\" class=\"order\"></td>";
                echo "<td align=\"center\">";
                echo "<a href=\"".ROOTHOST_ADMIN.COMS."/active/$ids\">";
                echo $icon_active;
                echo "</a></td>";
                echo "<td align=\"center\">";
                echo "<a href=\"".ROOTHOST_ADMIN.COMS."/edit/$ids\">";
                echo "<i class='fa fa-edit' aria-hidden='true'></i>";
                echo "</a></td>";
                echo "<td align='center' width='10'><a href='".ROOTHOST_ADMIN.COMS."/delete/$ids' onclick=\" return confirm('Bạn chắc chắn muốn xóa ?')\"><i class='fa fa-trash cgray' aria-hidden='true'></i></a></td>";
                echo "</tr>";
            }
            ?>
        </table>
    </form>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Footer_list">
        <tr>
            <td align="center">
                <?php
                paging($total_rows,MAX_ROWS,$cur_page);
                ?>
            </td>
        </tr>
    </table>
</div>
<?php //----------------------------------------------?>
