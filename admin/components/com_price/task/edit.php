<?php
defined("ISHOME") or die("Can't acess this page, please come back!");
$id="";
if(isset($_GET["id"]))  $id = trim($_GET["id"]);
$sql = "SELECT * FROM `tbl_price` WHERE id=".$id;
$objmysql->Query($sql);
$row = $objmysql->Fetch_Assoc();

/* Get languages 1 */
$sql1 = "SELECT * FROM tbl_languages WHERE isactive = 1 AND id = ".$row['lang1'];
$objdata->Query($sql1);
$r1 = $objdata->Fetch_Assoc();

/* Get languages 2 */
$sql2 = "SELECT * FROM tbl_languages WHERE isactive = 1 AND id = ".$row['lang2'];
$objdata->Query($sql2);
$r2 = $objdata->Fetch_Assoc();
?>
<script language="javascript">
    function checkinput(){
        if($("#cbo_service").val()==""){
            $("#err_service").fadeTo(200,0.1,function(){
                $(this).html('Không được để trống').fadeTo(900,1);
            });
            return false;
        }
        return true;
    }
</script>

<div id="path">
    <ol class="breadcrumb">
        <li><a href="<?php echo ROOTHOST_ADMIN;?>">Admin</a></li>
        <li><a href="<?php echo ROOTHOST_ADMIN.COMS;?>">Danh sách giá dịch theo từng ngôn ngữ</a></li>
        <li class="active">Cập nhật giá dịch theo từng ngôn ngữ</li>
    </ol>
</div>

<div class="com_header color">
    <h1>Cập nhật giá dịch theo từng ngôn ngữ</h1>
    <div class="pull-right">
        <form id="frm_menu" name="frm_menu" method="post" action="">
            <input type="hidden" name="txtorders" id="txtorders" />
            <input type="hidden" name="txtids" id="txtids" />
            <input type="hidden" name="txtaction" id="txtaction" />

            <ul class="list-inline">
                <li><a class="save btn btn-success" href="#" onclick="dosubmitAction('frm_action','save');" title="Lưu"><i class="fa fa-floppy-o" aria-hidden="true"></i> Lưu</a></li>
                <li><a class="btn btn-default"  href="<?php echo ROOTHOST_ADMIN.COMS;?>" title="Đóng"><i class="fa fa-sign-out" aria-hidden="true"></i> Đóng</a></li>
            </ul>
        </form>
    </div>
</div>
<div class="clearfix"></div>
<div class="box-tabs">
    <form id="frm_action" class="form-horizontal" name="frm_action" method="post" enctype="multipart/form-data">
        <input type="hidden" name="txtid" value="<?php echo $row['id']; ?>">
        <div class="tab-content">
            <div class="tab-content">
                <div class="tab-pane fade active in" id="info">
                    <div class="form-group">
                        <div class="col-md-4 col-sm-4">
                            <label>Dịch từ</label>
                            <input type="text" class="form-control" value="<?php echo $r1['name'] ?>" readonly>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <label>Sang</label>
                            <input type="text" class="form-control" value="<?php echo $r2['name'] ?>" readonly>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <label>Giá (vnđ)/ 1 page</label>
                            <input type="number" name="txt_price" class="form-control" value="<?php echo $row['price'] ?>">
                        </div>
                    </div>
                    <div id="response"></div>
                </div>
            </div>
        </div>
        <input type="submit" name="cmdsave" id="cmdsave" value="Submit" style="display:none;" />
        <div class="text-center toolbar">
            <div style="height: 20px;"></div>
            <a class="save btn btn-success" href="#" onclick="dosubmitAction('frm_action','save');" title="Lưu thông tin"><i class="fa fa-floppy-o" aria-hidden="true"></i> Lưu thông tin</a>
        </div>
    </form>
</div>