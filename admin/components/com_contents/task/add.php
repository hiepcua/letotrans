<?php
defined("ISHOME") or die("Can't acess this page, please come back!");
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
            $("#err_name").fadeTo(200,0.1,function(){
                $(this).html('Vui lòng nhập tên bài viết').fadeTo(900,1);
            });
            $("#txt_name").focus();
            return false;
        }
        return true;
    }
</script>

<div id="path">
    <ol class="breadcrumb">
        <li><a href="<?php echo ROOTHOST_ADMIN;?>">Admin</a></li>
        <li><a href="<?php echo ROOTHOST_ADMIN.COMS;?>">Danh sách tin</a></li>
        <li class="active">Thêm mới tin</li>
    </ol>
</div>

<div class="com_header color">
    <h1>Thêm mới tin</h1>
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
                <div class="col-md-9 col-sm-8">
                    <div class="form-group">
                        <label>Tiêu đề<small class="cred"> (*)</small><span id="err_name" class="mes-error"></span></label>
                        <input type="text" name="txt_name" class="form-control" id="txt_name" placeholder="" required>
                        <div class="clearfix"></div>
                    </div>
                    
                    <div class='form-group'>
                        <label>Ảnh đại diện</label>
                        <div class="row">
                            <div class="col-sm-9 col-md-10">
                                <input name="txtthumb" type="text" id="file-thumb" size="45" class='form-control' value="" placeholder='Tiêu đề bài viết' />
                            </div>
                            <div class="col-sm-3 col-md-2">
                                <a class="btn btn-primary" href="#" onclick="OpenPopup('<?php echo ROOTHOST_ADMIN;?>extensions/upload_image.php');"><b style="margin-top: 15px">Chọn</b></a>
                            </div>
                            <div id="txt_thumb_err" class="mes-error"></div>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                    <!-- <div class='form-group'>
                        <label>Chọn thêm ảnh<span id="err_images" class="mes-error"></span></label>
                        <div id="response_img">
                            <div class="default">
                                <img src="<?php echo ROOTHOST_ADMIN;?>images/images.png" class="thumb-default" onclick="OpenPopup('<?php echo ROOTHOST_ADMIN;?>extensions/upload_images.php');">
                            </div>
                        </div>
                    </div> -->

                    <!-- <div class="form-group">
                        <label>Sapo</label>
                        <textarea name="txt_sapo" class="form-control" rows="5"></textarea>
                    </div> -->

                    <div class="form-group">
                        <label>Mô tả</label>
                        <textarea name="txt_intro" id="txt_intro" class="form-control" rows="5"></textarea>
                    </div>

                    <div class="form-group">
                        <label>Nội dung</label>
                        <textarea name="txt_fulltext" id="txt_fulltext" class="form-control"></textarea>
                    </div>
                </div>

                <div class="col-md-3 col-sm-4">
                    <div class="form-group">
                        <label>Danh mục tin<small class="cred"> (*)</small><span id="err_cate" class="mes-error"></span></label>
                        <select class="form-control" id="cbo_cata" name="cbo_cata" style="width: 100%" required>
                            <option value="">Root</option>
                            <?php $obj_cate->getListCate(0,0); ?>
                        </select>
                        <div class="clearfix"></div>
                    </div>
                    <!-- <div class='form-group'>
                        <label>Loại hình tin<small class="cred"> (*)</small><span id="err_type_of_land" class="mes-error"></span></label>
                        <select class="form-control" id="cbo_type_of_land" name="cbo_type_of_land" style="width: 100%" required>
                            <option value="">Root</option>
                            <?php
                            // $sql_tol = "SELECT * FROM tbl_type_of_land WHERE isactive = 1";
                            // $objmysql->Query($sql_tol);

                            // while ($r_tol = $objmysql->Fetch_Assoc()) {
                            //     echo '<option value="'.$r_tol['id'].'">'.$r_tol['title'].'</option>';
                            // }
                            ?>
                        </select>
                        <div class="clearfix"></div>
                    </div>
                    <div class="form-group">
                        <label>Diện tích<small class="cred"> (*)</small><span id="err_area" class="mes-error"></span></label>
                        <input type="number" name="txt_area" value="" class="form-control" id="txt_area" placeholder="Diện tích đất">
                    </div>

                    <div class="form-group">
                        <label>Giá<small class="cred"> (*)</small><span id="err_price" class="mes-error"></span></label>
                        <input type="number" name="txt_price" value="" class="form-control" id="txt_price" placeholder="Giá">
                    </div> -->
                    <div class="form-group">
                        <label>Tác giả <span class="cred">*</span></label>
                        <input type="text" name="txt_author" value="<?php echo $_SESSION[MD5($_SERVER['HTTP_HOST']).'_USERLOGIN']['username']; ?>" class="form-control" id="txt_author" readonly placeholder="">
                    </div>

                    <div class="form-group">
                        <label>Hiển thị</label>
                        <div>
                            <label class="radio-inline"><input type="radio" value="1" name="opt_isactive" checked>Có</label>
                            <label class="radio-inline"><input type="radio" value="0" name="opt_isactive">Không</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Nổi bật</label>
                        <div>
                            <label class="radio-inline"><input type="radio" value="1" name="opt_ishot">Có</label>
                            <label class="radio-inline"><input type="radio" value="0" name="opt_ishot" checked>Không</label>
                        </div>
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
            <input type="submit" name="cmdsave" id="cmdsave" value="Submit" style="display:none;" />
            <div class="clearfix"></div>
            <div class="text-center toolbar">
                <div style="height: 20px;"></div>
                <a class="save btn btn-success" href="#" onclick="dosubmitAction('frm_action','save');" title="Lưu thông tin"><i class="fa fa-floppy-o" aria-hidden="true"></i> Lưu thông tin</a>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src='<?php echo ROOTHOST;?>js/tinymce.min.js' referrerpolicy="origin"></script>
<script type="text/javascript">
    $(document).ready(function(){
        tinymce.init({
            selector: 'textarea#full-featured-non-premium',
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
            // file_picker_callback: function (callback, value, meta) {
            //     /* Provide file and text for the link dialog */
            //     if (meta.filetype === 'file') {
            //         callback('https://www.google.com/logos/google.jpg', { text: 'My text' });
            //     }

            //     /* Provide image and alt text for the image dialog */
            //     if (meta.filetype === 'image') {
            //         callback('https://www.google.com/logos/google.jpg', { alt: 'My alt text' });
            //     }

            //     /* Provide alternative source and posted for the media dialog */
            //     if (meta.filetype === 'media') {
            //         callback('movie.mp4', { source2: 'alt.ogg', poster: 'https://www.google.com/logos/google.jpg' });
            //     }
            // },
            images_upload_url: 'postAcceptor.php',
            image_caption: true,
            quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
            noneditable_noneditable_class: "mceNonEditable",
            toolbar_drawer: 'sliding',
            contextmenu: "link image imagetools table",
        });

        tinymce.init({
            selector:'#txt_fulltext',
            height : 500
        });

        $("#cbo_cata").select2();
        $("#cbo_type_of_land").select2();
    });

    function images_delete_item(attr){
        var del=confirm("Bạn có chắc muốn xóa ảnh này?");
        if (del==true){
            var parent = attr.parentElement.parentElement;
            parent.remove();
        }
    }
</script>