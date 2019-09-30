<?php
defined("ISHOME") or die("Can't acess this page, please come back!");
$id="";
if(isset($_GET["id"]))  $id = trim($_GET["id"]);
$sql = "SELECT * FROM `tbl_service_type` WHERE id=".$id;
$objmysql->Query($sql);
$row = $objmysql->Fetch_Assoc();
?>
<style type="text/css">
    .form-horizontal .form-group{
        margin-left: 0px;
        margin-right: 0px;
    }
</style>
<script language="javascript">
    function checkinput(){
        if($("#txt_name").val()==""){
            $("#txt_name_err").fadeTo(200,0.1,function(){
                $(this).html('Vui lòng nhập tên lĩnh vực').fadeTo(900,1);
            });
            return false;
        }

        if($("#txt_price").val()==""){
            $("#err_price").fadeTo(200,0.1,function(){
                $(this).html('Vui lòng nhập giá').fadeTo(900,1);
            });
            return false;
        }
        return true;
    }
</script>

<div id="path">
    <ol class="breadcrumb">
        <li><a href="<?php echo ROOTHOST_ADMIN;?>">Admin</a></li>
        <li><a href="<?php echo ROOTHOST_ADMIN.COMS;?>">Danh sách lĩnh vực</a></li>
        <li class="active">Cập nhật lĩnh vực</li>
    </ol>
</div>

<div class="com_header color">
    <h1>Cập nhật lĩnh vực</h1>
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
    <ul class="nav nav-tabs" role="tablist">
        <li class="active">
            <a href="#info" role="tab" data-toggle="tab">
                Thông tin
            </a>
        </li>
    </ul><br>
    <form id="frm_action" class="form-horizontal" name="frm_action" method="post" enctype="multipart/form-data">
        <input type="hidden" name="txtid" value="<?php echo $row['id']; ?>">
        <div class="tab-content">
            <div class="tab-pane fade active in" id="info">
                <div class="col-md-9 col-sm-8">
                    <div class="form-group">
                        <label>Tên lĩnh vực<small class="cred"> (*)</small><span id="err_name" class="mes-error"></span></label>
                        <input type="text" name="txt_name" class="form-control" id="txt_name" placeholder="Tên lĩnh vực" value="<?php echo $row['name']; ?>" required>
                    </div>
                    <div class="form-group">
                        <label>Giá mỗi từ<small class="cred"> (*)</small><span id="err_price" class="mes-error"></span></label>
                        <input type="text" name="txt_price" class="form-control" id="txt_price" placeholder="Giá một từ" value="<?php echo $row['price']; ?>" required>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4">
                    <div class="form-group">
                        <label>Danh mục tin<small class="cred"> (*)</small><span id="err_cate" class="mes-error"></span></label>
                        <select class="form-control" id="cbo_service" name="cbo_service" style="width: 100%" required>
                            <option value="">Root</option>
                            <?php
                            $sql = "SELECT * FROM tbl_service WHERE isactive = 1 ORDER BY `name` ASC";
                            $objmysql->Query($sql);
                            while ($r_service = $objmysql->Fetch_Assoc()) {
                                echo '<option value="'.$r_service['id'].'">'.$r_service['name'].'</option>';
                            }
                            ?>
                        </select>
                        <script type="text/javascript">
                            cbo_Selected('cbo_service','<?php echo $row['service_id'];?>');
                        </script>
                        <div class="clearfix"></div>
                    </div>
                    <div class="form-group">
                        <label>Hiển thị</label>
                        <div>
                            <label class="radio-inline"><input type="radio" value="1" name="opt_isactive" checked>Có</label>
                            <label class="radio-inline"><input type="radio" value="0" name="opt_isactive">Không</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input type="submit" name="cmdsave" id="cmdsave" value="Submit" style="display:none;" />
        <div class="clearfix"></div>
        <div class="text-center toolbar">
            <div style="height: 20px;"></div>
            <a class="save btn btn-success" href="#" onclick="dosubmitAction('frm_action','save');" title="Lưu thông tin"><i class="fa fa-floppy-o" aria-hidden="true"></i> Lưu thông tin</a>
        </div>
    </form>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $("#cbo_service").select2();
    });
</script>