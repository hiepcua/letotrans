<?php
defined('ISHOME') or die('Can not acess this page, please come back!');
define('OBJ_PAGE','ORDER');
$strwhere='';

// Khai báo SESSION
$keyword = isset($_GET['q']) ? addslashes(trim($_GET['q'])) : '';

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

$sql_count = "SELECT COUNT(*) AS count FROM tbl_order WHERE 1=1 ".$strwhere;
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
    .yctime{
        padding: 4px 10px;
    }
    .yctime.gap{
        color: #fff;
        border: 1px solid #ff6600;
        background-color: #ff6600;
    }
    .status {
        padding: 5px 15px;
    }
    .new{
        color: #ffffff;
        background-color: #5cb85c;
    }
    .cancel{
        color: #949494;
    }
    .pending{
        color: #ffffff;
        background-color: #ff6600;
    }
    .done{
        color: #ffffff;
        background-color: #5cb85c;
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
        <li class="active">Danh sách yêu cầu dịch vụ</li>
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
                    <li><a class="addnew btn btn-default" href="<?php echo ROOTHOST_ADMIN.COMS;?>/add" title="Thêm mới"><i class="fa fa-plus-circle cgreen" aria-hidden="true"></i> Thêm mới</a></li>
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
            <th>Họ tên</th>
            <th>Email</th>
            <th>SĐT</th>
            <th>Dịch từ</th>
            <th>Sang</th>
            <th width="100">Yc về thời gian</th>
            <th>Ngày tạo</th>
            <th>Tổng tiền</th>
            <th>Trạng thái</th>
            <th>Cập nhật</th>
        </thead>
        <tbody>
            <?php
            $star = ($cur_page - 1) * MAX_ROWS_ADMIN;
            $sql = "SELECT * FROM tbl_order WHERE 1=1 $strwhere ORDER BY `cdate` DESC LIMIT $star,".MAX_ROWS_ADMIN;
            $objmysql->Query($sql);
            $i = 0;
            while($rows = $objmysql->Fetch_Assoc()){
                $i++;
                $ids        = $rows['id'];
                $name       = $rows['lastname'].' '.$rows['firstname'];
                $cdate      = convert_date($rows['cdate']);
                // $price      = number_format($rows['price']);

                if($rows['time'] == 0)
                    $time  = '<a class="yctime">Bình thường</a>';
                else $time = '<a class="yctime gap">Gấp</a>';

                if($rows['status'] == 1) {
                    $status = '<a class="status new">Mới</a>';
                }else if($rows['status'] == 2){
                    $status = '<a class="status pending">Đang chờ</a>';
                }else if($rows['status'] == -1){
                    $status = '<a class="status cancel">Hủy</a>';
                }else {
                    $status = '<a class="status done">Hoàn thành</a>';
                }

                // Get language name
                $sql1 = "SELECT name FROM tbl_languages WHERE id = ".$rows['from'];
                $objdata = new CLS_MYSQL();
                $objdata->Query($sql1);
                $r1 = $objdata->Fetch_Assoc();

                // Get language name
                $sql2 = "SELECT name FROM tbl_languages WHERE id = ".$rows['to'];
                $objdata->Query($sql2);
                $r2 = $objdata->Fetch_Assoc();

                echo "<tr name='trow'>";
                echo "<td width='30' align='center'>$i</td>";
                echo "<td>".$name."</td>";
                echo "<td>".$rows['email']."</td>";
                echo "<td>".$rows['phone']."</td>";
                echo "<td>".$r1['name']."</td>";
                echo "<td>".$r2['name']."</td>";
                echo "<td class='text-center'>".$time."</td>";
                echo "<td>".$cdate."</td>";
                echo "<td>".number_format($rows['total'])."</td>";
                echo "<td class='text-center'>".$status."</td>";

                echo "<td align='center' width='10'><a href='".ROOTHOST_ADMIN.COMS."/edit/$ids'><i class='fa fa-edit' aria-hidden='true'></i></a></td>";
                echo "</tr>";
            }
            ?>
        </tbody>
    </table>
</div>
<?php //----------------------------------------------?>