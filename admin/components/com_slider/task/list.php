<?php
defined('ISHOME') or die('Can not acess this page, please come back!');
define('OBJ_PAGE','SLIDER');
$strwhere='';

// Khai báo 
$keyword = isset($_GET['q']) ? addslashes(trim($_GET['q'])) : '';
$action = isset($_GET['cbo_action']) ? addslashes(trim($_GET['cbo_action'])) : '';

// Gán strwhere
if($keyword!='')
    $strwhere.=" AND ( `slogan` like '%$keyword%' )";
if($action!='' && $action!='all' ){
    $strwhere.=" AND `isactive` = '$action'";
}

// Pagging
if(!isset($_SESSION['CUR_PAGE_'.OBJ_PAGE]))
    $_SESSION['CUR_PAGE_'.OBJ_PAGE] = 1;
if(isset($_POST['txtCurnpage'])){
    $_SESSION['CUR_PAGE_'.OBJ_PAGE] = (int)$_POST['txtCurnpage'];
}

$sql="SELECT COUNT(*) AS count FROM tbl_slider WHERE 1=1 ".$strwhere;
$objmysql->Query($sql);
$row_count = $objmysql->Fetch_Assoc();
$total_rows = $row_count['count'];

if($_SESSION['CUR_PAGE_'.OBJ_PAGE] > ceil($total_rows/MAX_ROWS)){
    $_SESSION['CUR_PAGE_'.OBJ_PAGE] = ceil($total_rows/MAX_ROWS);
}
$cur_page=(int)$_SESSION['CUR_PAGE_'.OBJ_PAGE] > 0 ? (int)$_SESSION['CUR_PAGE_'.OBJ_PAGE]:1;
// End pagging
?>
<script language="javascript">
    function checkinput(){
        var strids=document.getElementById("txtids");
        if(strids.value==""){
            alert('Bạn chưa lựa chọn đối tượng nào.');
            return false;
        }
        return true;
    }
</script>

<div id="path">
    <ol class="breadcrumb">
        <li><a href="<?php echo ROOTHOST_ADMIN;?>">Admin</a></li>
        <li class="active">Danh sách banner</li>
    </ol>
</div>

<div class="com_header color">
    <form id="frm_list" method="get" action="<?php echo ROOTHOST_ADMIN.COMS;?>">
        <div class="frm-search-box form-inline pull-left">
            <label class="mr-sm-2" for="">Từ khóa: </label>
            <input class="form-control" type="text" value="<?php echo $keyword?>" name="q" id="txtkeyword" placeholder="Từ khóa"/>&nbsp;
            <button type="submit" id="_btnSearch" class="btn btn-success">Tìm kiếm</button>
            <select name="cbo_action" class="form-control" id="cbo_action">
                <option value="all">Tất cả</option>
                <option value="1">Hiển thị</option>
                <option value="0">Ẩn</option>
                <script language="javascript">
                    cbo_Selected('cbo_action','<?php echo $action;?>');
                </script>
            </select>
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

<table class="table table-bordered">
    <tr class="header">
        <th width="30" align="center">#</th>
        <th width="30" align="center"><input type="checkbox" name="chkall" id="chkall" value="" onclick="docheckall('chk',this.checked);" /></th>
        <th>Hình ảnh</th>
        <th>Slogan</th>
        <th width="70" style="text-align: center;">Sắp xếp
            <a href="javascript:saveOrder()">
                <i class="fa fa-floppy-o" aria-hidden="true"></i>
            </a>
        </th>
        <th width="50" align="center">Hiển thị</th>
        <th width="50" align="center">Sửa</th>
        <th width="50" align="center">Xóa</th>
    </tr>
    <?php
    $star   = ($cur_page - 1) * MAX_ROWS;
    $leng   = MAX_ROWS;
    $i      = 0;
    $sql    = "SELECT tbl_slider.* FROM tbl_slider $strwhere ORDER BY `order` ASC LIMIT $star,$leng";
    $objmysql->Query($sql); 
    while($rows = $objmysql->Fetch_Assoc()){
        $i++;
        $ids    = $rows['id'];
        $link   = $rows['link'];
        $slogan = Substring($rows['slogan'], 0, 10);
        $img    = $rows['thumb'];
        $order  = $rows['order'];
        if($rows['isactive'] == 1) 
            $icon_active="<i class='fa fa-check cgreen' aria-hidden='true'></i>";
        else $icon_active='<i class="fa fa-times-circle-o cred" aria-hidden="true"></i>';

        echo "<tr name=\"trow\">";
        echo "<td width=\"30\" align=\"center\">$i</td>";

        echo "<td width=\"30\" align=\"center\"><input type=\"checkbox\" name=\"chk\" id=\"chk\" onclick=\"docheckonce('chk');\" value=\"$ids\"/></td>";

        echo "<td><img src='$img' class='img-obj pull-left' width='100px'> $link</td>";
        echo "<td>$slogan</td>";

        echo "<td width=\"50\" align=\"center\"><input type=\"text\" name=\"txt_order\" id=\"txt_order\" value=\"$order\" class=\"order\"></td>";
        echo "<td align=\"center\">";
        echo "<a href=\"index.php?com=".COMS."&amp;task=active&amp;id=$ids\">";
        echo $icon_active;
        echo "</a>";
        echo "</td>";
        echo "<td align=\"center\">";
        
        echo "<a href=\"".ROOTHOST_ADMIN.COMS."/edit/$ids\">";
        echo "<i class='fa fa-edit' aria-hidden='true'></i>";
        echo "</a>";
        
        echo "</td>";

        echo "<td align='center' width='10'><a href='".ROOTHOST_ADMIN.COMS."/delete/$ids' onclick=\" return confirm('Bạn có chắc muốn xóa ?')\">";
        echo "<i class='fa fa-times-circle cred' aria-hidden='true'></i></a></td>";

        echo "</tr>";
    }
    ?>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Footer_list">
    <tr>
        <td align="center">
            <?php 
            paging($total_rows,MAX_ROWS,$cur_page);
            ?>
        </td>
    </tr>
</table>
<?php //----------------------------------------------?>
