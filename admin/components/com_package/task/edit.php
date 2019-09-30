<?php
defined("ISHOME") or die("Can't acess this page, please come back!");
$id="";
if(isset($_GET["id"]))  $id = trim($_GET["id"]);
$sql = "SELECT * FROM `tbl_package` WHERE id=".$id." ORDER BY `name`";
$objmysql->Query($sql);
$row = $objmysql->Fetch_Assoc();
?>
<script language="javascript">
    function checkinput(){
        if($("#txt_name").val()==""){
            $("#txt_name_err").fadeTo(200,0.1,function(){
                $(this).html('Vui lòng nhập tên nhóm tin').fadeTo(900,1);
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
                <div class="form-group">
                    <div class="col-md-6 col-sm-6">
                        <label>Tên gói dịch vụ<small class="cred"> (*)</small><span id="txt_name_err" class="mes-error"></span></label>
                        <input type="text" name="txt_name" class="form-control" id="txt_name" placeholder="Tên gói dịch vụ"  value="<?php echo $row['name']; ?>" required>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <label>Giá mỗi từ<small class="cred"> đ(*)</small><span id="err_price" class="mes-error"></span></label>
                        <input type="text" name="txt_price" class="form-control" id="txt_price" placeholder="Giá một từ" value="<?php echo $row['price']; ?>" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <label class="form-control-label">Mô tả</label>
                        <textarea name="txt_intro" id="txt_intro" rows="5"><?php echo $row['intro']; ?></textarea>
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
        tinymce.init({selector:'#txt_intro'});
    });
</script>