<?php
defined("ISHOME") or die("Can't acess this page, please come back!");
$id="";
if(isset($_GET["id"]))  $id = trim($_GET["id"]);
$sql = "SELECT * FROM `tbl_service_doc` WHERE id=".$id;
$objmysql->Query($sql);
$row = $objmysql->Fetch_Assoc();

$sql_service = "SELECT * FROM tbl_service WHERE isactive = 1 AND id = ".$row['service_id'];
$objmysql->Query($sql_service);
$r_service = $objmysql->Fetch_Assoc();

$sql_service_type = "SELECT * FROM tbl_service_type WHERE isactive = 1 AND id = ".$row['service_type_id'];
$objmysql->Query($sql_service_type);
$r_service_type = $objmysql->Fetch_Assoc();

$seo_link   = ROOTHOST.'dich-vu/'.$r_service['code'].'/'.$r_service_type['code'].'/';
$sql_seo    = "SELECT * FROM tbl_seo WHERE link = '".$seo_link."'";
$objmysql->Query($sql_seo);
$row_seo    = $objmysql->Fetch_Assoc();
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
        <li class="active">Cập nhật dịch vụ loại tài liệu</li>
    </ol>
</div>

<div class="com_header color">
    <h1>Cập nhật dịch vụ loại tài liệu</h1>
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
        <input type="hidden" name="txtid" value="<?php echo $row['id']; ?>">
        <input type="hidden" name="txt_seo_link" value="<?php echo $seo_link;?>">
        <div class="tab-content">
            <div class="tab-pane fade active in" id="info">
                <div class="form-group">
                    <div class="col-md-6 col-sm-6">
                        <label>Tên<small class="cred"> (*)</small><span id="err_name" class="mes-error"></span></label>
                        <input type="text" name="txt_name" class="form-control" id="txt_name" value="<?php echo $row['name'] ?>" placeholder="Tên " required>
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
                        <script type="text/javascript">
                            $(document).ready(function() {
                                cbo_Selected('cbo_service','<?php echo $row['service_id'];?>');
                            });
                        </script>
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
                        <script type="text/javascript">
                            $(document).ready(function() {
                                cbo_Selected('cbo_service_type','<?php echo $row['service_type_id'];?>');
                            });
                        </script>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <label class="form-control-label">Mô tả:</label>
                        <textarea name="txt_intro" class="form-control" id="txt_intro" rows="5"><?php echo $row['intro']; ?></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <label class="form-control-label">Nội dung chi tiết:</label>
                        <textarea name="txt_fulltext" class="form-control" id="txt_fulltext" rows="5"><?php echo $row['fulltext']; ?></textarea>
                    </div>
                </div>
            </div>
            
            <div class="tab-pane fade" id="seo">
                <div class="col-xs-12">
                    <div class='form-group'>
                        <label><strong>Meta Title</strong></label>
                        <input name="txt_metatitle" type="text" id="txt_metatitle" class='form-control' value="<?php echo $row_seo['meta_title'];?>" placeholder='' />
                    </div>

                    <div class='form-group'>
                        <label><strong>Meta Keyword</strong></label>
                        <textarea class="form-control" name="txt_metakey" id="txt_metakey" rows="3"><?php echo $row_seo['meta_key'];?></textarea>
                    </div>

                    <div class='form-group'>
                        <label><strong>Meta Description</strong></label>
                        <textarea class="form-control" name="txt_metadesc" id="txt_metadesc" rows="5"><?php echo $row_seo['meta_desc'];?></textarea>
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
        tinymce.init({
            selector: '#txt_fulltext',
            plugins: 'print preview fullpage paste importcss searchreplace autolink autosave save directionality code visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap quickbars emoticons',
            imagetools_cors_hosts: ['picsum.photos'],
            menubar: 'file edit view insert format tools table help',
            toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl',
            toolbar_sticky: true,
            autosave_ask_before_unload: true,
            autosave_interval: "30s",
            autosave_prefix: "{path}{query}-{id}-",
            autosave_restore_when_empty: false,
            autosave_retention: "2m",
            image_advtab: true,
            content_css: [
            '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
            ],
            importcss_append: true,
            height: 400,
            images_upload_url: 'postAcceptor.php',
            image_caption: true,
            quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
            noneditable_noneditable_class: "mceNonEditable",
            toolbar_drawer: 'sliding',
            contextmenu: "link image imagetools table",
        });
    });
</script>