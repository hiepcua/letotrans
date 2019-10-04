<?php
defined("ISHOME") or die("Can't acess this page, please come back!");
$id="";
if(isset($_GET["id"]))  $id = trim($_GET["id"]);
$sql = "SELECT * FROM `tbl_package` WHERE id=".$id;
$objmysql->Query($sql);
$row = $objmysql->Fetch_Assoc();

$sql_service = "SELECT * FROM tbl_service WHERE isactive = 1 AND id = ".$row['service_id'];
$objmysql->Query($sql_service);
$r_service = $objmysql->Fetch_Assoc();

$sql_service_type = "SELECT * FROM tbl_service_type WHERE isactive = 1 AND id = ".$row['service_type_id'];
$objmysql->Query($sql_service_type);
$r_service_type = $objmysql->Fetch_Assoc();
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
        <li><a href="<?php echo ROOTHOST_ADMIN.COMS;?>">Danh sách gói dịch vụ</a></li>
        <li class="active">Cập nhật gói dịch vụ</li>
    </ol>
</div>

<div class="com_header color">
    <h1>Cập nhật gói dịch vụ</h1>
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
            <div class="tab-pane fade active in" id="info">
                <div class="form-group">
                    <div class="col-md-6 col-sm-6">
                        <label>Dịch vụ<small class="cred"> (*)</small><span id="err_service" class="mes-error"></span></label>
                        <input type="hidden" name="cbo_service" class="form-control" value="<?php echo $r_service['id']; ?>">
                        <input type="text" name="cbo_service_name" class="form-control" value="<?php echo $r_service['name']; ?>" readonly>
                    </div>
                </div>
                <div id="response">
                    <label>Giá gói dịch vụ theo từng loại</label>
                    <table class="table table-bordered">
                        <thead>
                            <th>Tên dịch vụ</th>
                            <th>Lĩnh vực/Loại sản phẩm</th>
                            <th>Gói cơ bản</th>
                            <th>Gói pro</th>
                            <th>Gói vip</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td><?php echo $r_service['name']; ?></td>
                                <?php if($row['service_type_id'] !== 0){ ?>
                                    <td>
                                        <?php echo $r_service_type['name']; ?>
                                        <input type="hidden" name="txt_service_type[]" value="<?php echo $r_service_type['id']; ?>"/>
                                    </td>
                                <?php } ?>
                                <td><input type="number" name="txt_price_basic[]" value="<?php echo $row['price_basic']; ?>"></td>
                                <td><input type="number" name="txt_price_pro[]" value="<?php echo $row['price_pro']; ?>"></td>
                                <td><input type="number" name="txt_price_vip[]" value="<?php echo $row['price_vip']; ?>"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <label class="form-control-label">Mô tả gói cơ bản</label>
                        <textarea name="txt_intro1" id="txt_intro1" rows="5"><?php echo $row['intro_basic']; ?></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <label class="form-control-label">Mô tả gói PRO</label>
                        <textarea name="txt_intro2" id="txt_intro2" rows="5"><?php echo $row['intro_pro']; ?></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <label class="form-control-label">Mô tả gói VIP</label>
                        <textarea name="txt_intro3" id="txt_intro3" rows="5"><?php echo $row['intro_vip']; ?></textarea>
                    </div>
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
<script type="text/javascript">
    $(document).ready(function(){
        tinymce.init({selector:'#txt_intro1'});
        tinymce.init({selector:'#txt_intro2'});
        tinymce.init({selector:'#txt_intro3'});
    });
</script>