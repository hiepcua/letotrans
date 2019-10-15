<?php
defined("ISHOME") or die("Can't acess this page, please come back!");
?>
<script language="javascript">
    function checkinput(){
        if($("#cbo_languages").val()==""){
            $("#err_languages").fadeTo(200,0.1,function(){
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
        <li class="active">Thêm mới giá dịch theo từng ngôn ngữ</li>
    </ol>
</div>

<div class="com_header color">
    <h1>Thêm mới giá dịch theo từng ngôn ngữ</h1>
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
                        <label>Dịch từ<small class="cred"> (*)</small><span id="err_languages" class="mes-error"></span></label>
                        <select name="cbo_languages" class="form-control" id="cbo_languages" onchange="add_price(this)" style="width: 100%;">
                            <option value="" title="Top">-- Lựa chọn một ngôn ngữ --</option>
                            <?php
                            $sql = "SELECT * FROM tbl_languages WHERE isactive = 1";
                            $objmysql->Query($sql);
                            while ($r_languages = $objmysql->Fetch_Assoc()) {
                                echo '<option value="'.$r_languages['id'].'">'.$r_languages['name'].'</option>';
                            }
                            ?>
                        </select>
                    </div>
                </div>
                <div id="response"></div>
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
    function add_price(attr) {
        var value   = attr.value;

        if(value !== '' && value !== 0)
        $.ajax({
            url: '<?php echo ROOTHOST_ADMIN;?>ajaxs/price/add_price.php',
            type: 'POST',
            data: {
                'language_id': value
            },
            success: function (res) {
                $('#response').empty();
                $('#response').append(res);
            }
        });
    }
</script>