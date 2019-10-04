<?php
defined("ISHOME") or die("Can't acess this page, please come back!");
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
        <li class="active">Thêm mới gói dịch vụ</li>
    </ol>
</div>

<div class="com_header color">
    <h1>Thêm mới gói dịch vụ</h1>
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
        <div class="tab-content">
            <div class="tab-pane fade active in" id="info">
                <div class="form-group">
                    <div class="col-md-6 col-sm-6">
                        <label>Dịch vụ<small class="cred"> (*)</small><span id="err_service" class="mes-error"></span></label>
                        <select name="cbo_service" class="form-control" id="cbo_service" onchange="add_price(this)" style="width: 100%;">
                            <option value="" title="Top">-- Lựa chọn một loại dịch vụ --</option>
                            <?php
                            $sql_service = "SELECT * FROM tbl_service WHERE isactive = 1";
                            $objmysql->Query($sql_service);
                            while ($r_service = $objmysql->Fetch_Assoc()) {
                                echo '<option value="'.$r_service['id'].'">'.$r_service['name'].'</option>';
                            }
                            ?>
                        </select>
                    </div>
                </div>
                <div id="response"></div>
                <div class="form-group">
                    <div class="col-md-12">
                        <label class="form-control-label">Mô tả gói cơ bản</label>
                        <textarea name="txt_intro1" id="txt_intro1" rows="5"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <label class="form-control-label">Mô tả gói PRO</label>
                        <textarea name="txt_intro2" id="txt_intro2" rows="5"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <label class="form-control-label">Mô tả gói VIP</label>
                        <textarea name="txt_intro3" id="txt_intro3" rows="5"></textarea>
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

    function add_price(attr) {
        var value   = attr.options.selectedIndex.valueOf();

        if(value !== '' && value !== 0)
        $.ajax({
            url: '<?php echo ROOTHOST_ADMIN;?>ajaxs/package/add_price.php',
            type: 'POST',
            data: {
                'service_id': value
            },
            success: function (res) {
                $('#response').empty();
                $('#response').append(res);
            }
        });
    }
</script>