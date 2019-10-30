<?php
defined('ISHOME') or die('Can not acess this page, please come back!');
define('OBJ_PAGE','SERVICE');
$strwhere='';

// Khai báo SESSION
$keyword    = isset($_GET['q']) ? addslashes(trim($_GET['q'])) : '';

// Gán strwhere
if($keyword !== ''){
    $strwhere.=" AND ( `name` like '%$keyword%' )";
}

// Begin pagging
if(!isset($_SESSION['CUR_PAGE_'.OBJ_PAGE])){
    $_SESSION['CUR_PAGE_'.OBJ_PAGE] = 1;
}
if(isset($_POST['txtCurnpage'])){
    $_SESSION['CUR_PAGE_'.OBJ_PAGE] = (int)$_POST['txtCurnpage'];
}

$sql_count = "SELECT COUNT(*) AS count FROM tbl_service WHERE 1=1 ".$strwhere;
$objmysql->Query($sql_count);
$row_count = $objmysql->Fetch_Assoc();
$total_rows = $row_count['count'];

if($_SESSION['CUR_PAGE_'.OBJ_PAGE] > ceil($total_rows/MAX_ROWS_ADMIN)){
    $_SESSION['CUR_PAGE_'.OBJ_PAGE] = ceil($total_rows/MAX_ROWS_ADMIN);
}
$cur_page=(int)$_SESSION['CUR_PAGE_'.OBJ_PAGE]>0 ? $_SESSION['CUR_PAGE_'.OBJ_PAGE] : 1;
// End pagging
?>
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
        <li class="active">Danh sách dịch vụ</li>
    </ol>
</div>

<div class="com_header color">
    <form id="frm_list" method="get" action="<?php echo ROOTHOST_ADMIN.COMS;?>">
        <div class="frm-search-box form-inline pull-left">
            <input class="form-control" type="text" value="<?php echo $keyword?>" name="q" id="txtkeyword" placeholder="Từ khóa"/>&nbsp;
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
</div><br>
<div class="clearfix"></div>


<div class="table-responsive">
    <table class="table table-bordered">
        <thead>
            <th width="30" align="center">STT</th>
            <th width="30" align="center"><input type="checkbox" name="chkall" id="chkall" value="" onclick="docheckall('chk',this.checked);" /></th>
            <th>Dịch vụ</th>
            <th align="center">Mô tả</th>
            <!-- <th align="center">Giá/ giá cơ bản</th> -->
            <th width="70" align="center" style="text-align: center;">Sắp xếp
                <a href="javascript:saveOrder()"><i class="fa fa-floppy-o" aria-hidden="true"></i></a>
            </th>
            <th colspan="3"></th>
        </thead>
        <tbody>
            <?php
            $obj->listTable($strwhere,0,0,0);
            ?>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    function ajax_update_price(attr){
        var id = parseInt(attr.getAttribute('data-id'));
        var price = attr.value;
        var _price = parseFloat(price.replace(/,/g, ''));
        $.ajax({
            url : '<?php echo ROOTHOST_ADMIN.'ajaxs/service/update_price.php' ?>',
            type : 'POST',
            data : {
                'id' : id,
                'price' : _price,
            },
            cache: false,
            success: function (res) {
                attr.value = res;
                console.log(res);
            }
        })
    }
</script>
<?php //----------------------------------------------?>