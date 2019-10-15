<?php
defined('ISHOME') or die('Can not acess this page, please come back!');
define('OBJ_PAGE','PRICE');
$strwhere='';

// Khai báo SESSION
$keyword = isset($_GET['q']) ? addslashes(trim($_GET['q'])) : '';
$language = isset($_GET['cbo_languages']) ? addslashes(trim($_GET['cbo_languages'])) : '';

// Gán strwhere
if($keyword !== ''){
    $strwhere.=" AND ( `name` like '%$keyword%' )";
}
if($language !== '' && $language !== 'all' ){
    $strwhere.=" AND `lang1` = '$language'";
}


// Begin pagging
if(!isset($_SESSION['CUR_PAGE_'.OBJ_PAGE])){
    $_SESSION['CUR_PAGE_'.OBJ_PAGE] = 1;
}
if(isset($_POST['txtCurnpage'])){
    $_SESSION['CUR_PAGE_'.OBJ_PAGE] = (int)$_POST['txtCurnpage'];
}

$sql="SELECT COUNT(*) AS count FROM tbl_price WHERE 1=1 ".$strwhere;
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
        <li class="active">Danh sách giá dịch</li>
    </ol>
</div>

<div class=''>
    <div class="com_header color">
        <form id="frm_list" method="get" action="<?php echo ROOTHOST_ADMIN.COMS;?>">
            <div class="frm-search-box form-inline pull-left">
                <select name="cbo_languages" class="form-control" id="cbo_languages" style="width: 200px; font-weight: 400;">
                    <option value="">-- Tất cả ngôn ngữ --</option>
                    <?php
                    $sql = "SELECT * FROM tbl_languages WHERE isactive = 1";
                    $objmysql->Query($sql);
                    while ($r = $objmysql->Fetch_Assoc()) {
                        echo '<option value="'.$r['id'].'">'.$r['name'].'</option>';
                    }
                    ?>
                    <script language="javascript">
                        cbo_Selected('cbo_languages','<?php echo $language;?>');
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
        <th width="50" align="center">Xóa</th>
        <th align="center">Ngôn ngữ</th>
        <th align="center">Ngôn ngữ</th>
        <th align="center">Giá (vnđ)/ 1 page</th>
        <th width="50" align="center">Sửa</th>
    </tr>
    <?php
    $star = ($cur_page - 1) * 20;
    $leng = 20;
    $sql = "SELECT * FROM tbl_price WHERE 1=1 ".$strwhere." LIMIT ".$star.", ".$leng;
    $objmysql->Query($sql);  $i=0;
    while($rows = $objmysql->Fetch_Assoc()){
        $i++;
        $ids = $rows['id'];
        
        /* Get languages 1 */
        $sql1 = "SELECT * FROM tbl_languages WHERE isactive = 1 AND id = ".$rows['lang1'];
        $objdata->Query($sql1);
        $r1 = $objdata->Fetch_Assoc();

        /* Get languages 2 */
        $sql2 = "SELECT * FROM tbl_languages WHERE isactive = 1 AND id = ".$rows['lang2'];
        $objdata->Query($sql2);
        $r2 = $objdata->Fetch_Assoc();

        echo "<tr name=\"trow\">";
        echo "<td width=\"30\" align=\"center\">$i</td>";

        echo "<td width=\"30\" align=\"center\"><label>";
        echo "<input type=\"checkbox\" name=\"chk\" id=\"chk\" onclick=\"docheckonce('chk');\" value=\"$ids\" />";
        echo "</label></td>";

        echo "<td align='center' width='10'><a href='".ROOTHOST_ADMIN.COMS."/delete/$ids' onclick=\" return confirm('Bạn chắc chắn muốn xóa ?')\"><i class='fa fa-trash cgray' aria-hidden='true'></i></a></td>";

        echo "<td>".$r1['name']."</td>";
        echo "<td>".$r2['name']."</td>";

        echo "<td>
        <input class='ajax-price' data-id='".$ids."' onchange=\"ajax_update_price(this)\" type='text' name='txt_price' value='".number_format($rows['price'])."'>
        </td>";

        echo "<td align=\"center\">";
        echo "<a href=\"".ROOTHOST_ADMIN.COMS."/edit/$ids\">";
        echo "<i class='fa fa-edit' aria-hidden='true'></i>";
        echo "</a></td>";
        
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
    $('#cbo_languages').select2();
    function ajax_update_price(attr){
        var id = parseInt(attr.getAttribute('data-id'));
        var name = attr.getAttribute('name');
        var price = attr.value;
        var _price = parseInt(price.replace(/,/g, ''));
        $.ajax({
            url : '<?php echo ROOTHOST_ADMIN.'ajaxs/price/update_price.php' ?>',
            type : 'POST',
            data : {
                'id' : id,
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
