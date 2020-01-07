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
        <li><a href="<?php echo ROOTHOST_ADMIN.COMS;?>">Danh sách dịch vụ loại tài liệu</a></li>
        <li class="active">Thêm mới gói dịch vụ</li>
    </ol>
</div>

<div class="com_header color">
    <h1>Thêm mới dịch vụ loại tài liệu</h1>
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
        <li>
            <a href="#seo" role="tab" data-toggle="tab">
                Meta header
            </a>
        </li>
    </ul><br>
    <form id="frm_action" class="form-horizontal" name="frm_action" method="post" enctype="multipart/form-data">
        <div class="tab-content">
            <div class="tab-pane fade active in" id="info">
                <div class="form-group">
                    <div class="col-md-6 col-sm-6">
                        <label>Tên<small class="cred"> (*)</small><span id="err_name" class="mes-error"></span></label>
                        <input type="text" name="txt_name" class="form-control" id="txt_name" placeholder="Tên " required>
                    </div>
                </div>
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
                    <div class="col-md-6 col-sm-6">
                        <label>Loại tài liệu<small class="cred"> (*)</small><span id="err_service_type" class="mes-error"></span></label>
                        <select name="cbo_service_type" class="form-control" id="cbo_service_type" style="width: 100%;">
                            <option value="" title="Top">-- Lựa chọn một loại tài liệu --</option>
                            <?php
                            $sql_service = "SELECT * FROM tbl_service_type WHERE isactive = 1";
                            $objmysql->Query($sql_service);
                            while ($r_service = $objmysql->Fetch_Assoc()) {
                                echo '<option value="'.$r_service['id'].'">'.$r_service['name'].'</option>';
                            }
                            ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <label>Mô tả:</label>
                        <textarea name="txt_intro" class="form-control" id="txt_intro" rows="5"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <label>Nội dung chi tiết:</label>
                        <textarea name="txt_fulltext" class="form-control" id="txt_fulltext" rows="5"></textarea>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade" id="seo">
                <div class="col-xs-12">
                    <div class='form-group'>
                        <label><strong>Meta Title</strong></label>
                        <input name="txt_metatitle" type="text" id="txt_metatitle" class='form-control' value="" placeholder='' />
                    </div>

                    <div class='form-group'>
                        <label><strong>Meta Keyword</strong></label>
                        <textarea class="form-control" name="txt_metakey" id="txt_metakey" rows="3"></textarea>
                    </div>

                    <div class='form-group'>
                        <label><strong>Meta Description</strong></label>
                        <textarea class="form-control" name="txt_metadesc" id="txt_metadesc" rows="5"></textarea>
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
        $('#txt_fulltext').summernote({
            placeholder: 'Nội dung bài viết',
            height: 500,
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'italic', 'underline', 'superscript', 'subscript', 'strikethrough', 'clear']],
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['table', ['table']],
                ['insert', ['link', 'picture', 'video', 'hr']],
                ['view', ['codeview']]
            ],
        });
    });
</script>