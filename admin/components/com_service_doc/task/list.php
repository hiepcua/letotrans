<?php
defined('ISHOME') or die('Can not acess this page, please come back!');
define('OBJ_PAGE','PACKAGE');
$strwhere='';

// Khai báo SESSION
$service = isset($_GET['cbo_service']) ? addslashes(trim($_GET['cbo_service'])) : '';
$service_type = isset($_GET['cbo_service_type']) ? addslashes(trim($_GET['cbo_service_type'])) : '';

// Gán strwhere
if($service !== '' && $service !== 'all' ){
    $strwhere.=" AND `service_id` = '$service'";
}
if($service_type !== '' && $service_type !== 'all' ){
    $strwhere.=" AND `service_type_id` = '$service_type'";
}


// Begin pagging
if(!isset($_SESSION['CUR_PAGE_'.OBJ_PAGE])){
    $_SESSION['CUR_PAGE_'.OBJ_PAGE] = 1;
}
if(isset($_POST['txtCurnpage'])){
    $_SESSION['CUR_PAGE_'.OBJ_PAGE] = (int)$_POST['txtCurnpage'];
}

$sql="SELECT COUNT(*) AS count FROM tbl_service_doc WHERE 1=1 ".$strwhere;
$objmysql->Query($sql);
$row_count = $objmysql->Fetch_Assoc();
$total_rows = $row_count['count'];

if($_SESSION['CUR_PAGE_'.OBJ_PAGE] > ceil($total_rows/20)){
    $_SESSION['CUR_PAGE_'.OBJ_PAGE] = ceil($total_rows/20);
}
$cur_page = (int)$_SESSION['CUR_PAGE_'.OBJ_PAGE]>0 ? $_SESSION['CUR_PAGE_'.OBJ_PAGE] : 1;
// End pagging
?>
<style type="text/css">
    .ajax-price{
        width: 100px;
    }    
</style>

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

<div id="path">
    <ol class="breadcrumb">
        <li><a href="<?php echo ROOTHOST_ADMIN;?>">Admin</a></li>
        <li class="active">Danh sách dịch vụ loại tài liệu</li>
    </ol>
</div>

<div class=''>
    <div class="com_header color">
        <form id="frm_list" method="get" action="<?php echo ROOTHOST_ADMIN.COMS;?>">
            <div class="frm-search-box form-inline pull-left">
                <select name="cbo_service" class="form-control" id="cbo_service">
                    <option value="">-- Tất cả dịch vụ --</option>
                    <?php
                    $sql_service = "SELECT * FROM tbl_service WHERE isactive = 1";
                    $objmysql->Query($sql_service);
                    while ($r_service1 = $objmysql->Fetch_Assoc()) {
                        echo '<option value="'.$r_service1['id'].'">'.$r_service1['name'].'</option>';
                    }
                    ?>
                    <script language="javascript">
                        cbo_Selected('cbo_service','<?php echo $service;?>');
                    </script>
                </select>
                <select name="cbo_service_type" class="form-control" id="cbo_service_type">
                    <option value="">-- Tất cả dịch vụ --</option>
                    <?php
                    $sql_service = "SELECT * FROM tbl_service_type WHERE isactive = 1";
                    $objmysql->Query($sql_service);
                    while ($r_service1 = $objmysql->Fetch_Assoc()) {
                        echo '<option value="'.$r_service1['id'].'">'.$r_service1['name'].'</option>';
                    }
                    ?>
                    <script language="javascript">
                        cbo_Selected('cbo_service_type','<?php echo $service_type;?>');
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
</div>


<div class="table-responsive">
  <table class="table table-bordered">
     <tr class="header">
        <th width="30" align="center">#</th>
        <th width="30" align="center"><input type="checkbox" name="chkall" id="chkall" value="" onclick="docheckall('chk',this.checked);" /></th>
        <th align="center">Tên</th>
        <th align="center">Dịch vụ</th>
        <th align="center">Lĩnh vực</th>
        <th width="70" align="center" style="text-align: center;">Sắp xếp
            <a href="javascript:saveOrder()"><i class="fa fa-floppy-o" aria-hidden="true"></i></a>
        </th>
        <th width="50" align="center">Hiển thị</th>
        <th width="50" align="center">Sửa</th>
        <th width="50" align="center">Xóa</th>
    </tr>
    <?php
    $star = ($cur_page - 1) * 20;
    $leng = 20;
    $sql = "SELECT * FROM tbl_service_doc WHERE 1=1 ".$strwhere." ORDER BY `order` ASC LIMIT ".$star.", ".$leng;
    $objmysql->Query($sql);  $i=0;
    while($rows = $objmysql->Fetch_Assoc()){
        $i++;
        $ids = $rows['id'];
        
        /* Get service */
        $sql_service = "SELECT * FROM tbl_service WHERE isactive = 1 AND id = ".$rows['service_id'];
        $objdata->Query($sql_service);
        $r_service = $objdata->Fetch_Assoc();

        /* Get service type */
        $sql_service_type = "SELECT * FROM tbl_service_type WHERE isactive = 1 AND id = ".$rows['service_type_id'];
        $objdata->Query($sql_service_type);
        $r_service_type = $objdata->Fetch_Assoc();

        if($rows['isactive']==1) 
            $icon_active="<i class='fa fa-check cgreen' aria-hidden='true'></i>";
        else $icon_active='<i class="fa fa-times-circle-o cred" aria-hidden="true"></i>';

        echo "<tr name=\"trow\">";
        echo "<td width=\"30\" align=\"center\">$i</td>";
        echo "<td width=\"30\" align=\"center\"><label>";
        echo "<input type=\"checkbox\" name=\"chk\" id=\"chk\"   onclick=\"docheckonce('chk');\" value=\"$ids\" />";
        echo "</label></td>";
        echo "<td>".$rows['name']."</td>";
        echo "<td>".$r_service['name']."</td>";
        echo "<td>".$r_service_type['name']."</td>";

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
            paging($total_rows,20,$cur_page);
            ?>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function ajax_update_price(attr){
        var id = parseInt(attr.getAttribute('data-id'));
        var name = attr.getAttribute('name');
        var price = attr.value;
        var _price = parseInt(price.replace(/,/g, ''));
        $.ajax({
            url : '<?php echo ROOTHOST_ADMIN.'ajaxs/package/update_price.php' ?>',
            type : 'POST',
            data : {
                'id' : id,
                'name' : name,
                'price' : _price,
            },
            cache: false,
            success: function (res) {
                attr.value = res;
            }
        })
    }
</script>
<?php //----------------------------------------------?>
