<?php
defined("ISHOME") or die("Can't acess this page, please come back!");
$id = isset($_GET['id']) ? (int)$_GET["id"] : 0;

$sql = "SELECT * FROM tbl_order WHERE id = ".$id;
$objmysql->Query($sql);
$row = $objmysql->Fetch_Assoc();
$time = ($row['time'] == 1) ? 'Gấp' : 'Bình thường';
$ccd = ($row['ccd'] == 1) ? 'Có' : 'Không';
$ccg = ($row['ccg'] == 1) ? 'Có' : 'Không';
$ship = ($row['ship'] == 1) ? 'Có' : 'Không';
$total2 = ($row['total2'] == '') ? '' : number_format($row['total2']).'đ';

// Get service name
$sql1 = "SELECT * FROM tbl_service WHERE id = ".$row['service'];
$objmysql->Query($sql1);
$r1 = $objmysql->Fetch_Assoc();

// Get service type name
$sql2 = "SELECT * FROM tbl_service_type WHERE id = ".$row['service_type'];
$objmysql->Query($sql2);
$r2 = $objmysql->Fetch_Assoc();

// Get language
$sql3 = "SELECT * FROM tbl_languages WHERE id = ".$row['from'];
$objmysql->Query($sql3);
$r3 = $objmysql->Fetch_Assoc();

// Get language
$sql4 = "SELECT * FROM tbl_languages WHERE id = ".$row['to'];
$objmysql->Query($sql4);
$r4 = $objmysql->Fetch_Assoc();

// Count number Word files
function CountPagesDocx($filename)
{
    $zip = new ZipArchive();

    if($zip->open($filename) === true)
    {  
        if(($index = $zip->locateName('docProps/app.xml')) !== false)
        {
            $data = $zip->getFromIndex($index);
            $zip->close();

            $xml = new SimpleXMLElement($data);
            return $xml->Pages;
        }
        $zip->close();
    }
    return false;
}

// Count number PowerPoint
function PageCount_PPTX($file) {
    $pageCount = 0;

    $zip = new ZipArchive();

    if($zip->open($file) === true) {
        if(($index = $zip->locateName('docProps/app.xml')) !== false)  {
            $data = $zip->getFromIndex($index);
            $zip->close();
            $xml = new SimpleXMLElement($data);
            print_r($xml);
            $pageCount = $xml->Slides;
        }
        $zip->close();
    }

    return $pageCount;
}
?>
<style type="text/css">
    .form-horizontal .form-group{
        margin-left: 0px;
        margin-right: 0px;
    }
    .info {
        padding: 0;
    }
    .info li {
        list-style-type: none;
        padding: 5px 0;
    }
    .info li label {
        width: 160px;
    }
    .file {
        margin-bottom: 10px;
    }
    .file a {
        padding: 3px 15px;
        background-color: #d8d8d8;
    }
    .ip-numpage{
        width: 100px;
        margin-left: 20px;
    }
    #total-price{
        color: red;
        font-weight: bold;
        font-size: 18px;
    }
</style>
<script language="javascript">
    function checkinput(){
        if($("#txt_name").val()==""){
            $("#err_name").fadeTo(200,0.1,function(){
                $(this).html('Vui lòng nhập tên loại tài liệu').fadeTo(900,1);
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
        <li><a href="<?php echo ROOTHOST_ADMIN.COMS;?>">Danh sách yêu cầu </a></li>
        <li class="active">Cập nhật yêu cầu</li>
    </ol>
</div>

<div class="com_header color">
    <h1>Cập nhật yêu cầu</h1>
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
        <input type="hidden" id="txtid" name="txtid" value="<?php echo $row['id'];?>">
        <div class="tab-content">
            <div class="tab-pane fade active in" id="info">
                <div class='form-group'>
                    <div class="col-md-6 col-sm-6">
                        <ul class="info">
                            <li><label>Dịch vụ:</label><?php echo $r1['name']; ?></li>
                            <li><label>Loại tài liệu:</label><?php echo $r2['name']; ?></li>
                            <li><label>Dịch từ:<small>(1)</small></label><?php echo $r3['name']; ?></li>
                            <li><label>Sang:<small>(2)</small></label><?php echo $r4['name']; ?></li>
                            <li><label>Giá dịch từ <small>(1)</small> sang <small>(2)</small>:</label><?php echo number_format($row['lang_price']); ?></li>
                            <li><label>Số trang:</label><?php echo number_format($row['numpage']); ?></li>
                            <li><label>Thời gian dịch:</label><?php echo $time; ?></li>
                            <li><label>Công chứng dịch:</label><?php echo $ccd; ?></li>
                            <li><label>Công chứng gấp:</label><?php echo $ccd; ?></li>
                            <li><label>Ship:</label><?php echo $ship; ?></li>
                            <li><label>Giá tạm tính:</label><?php echo number_format($row['total']); ?></li>
                            <li class="total-price"><label>Giá tính lại:</label><span id="total-price"><?php echo $total2; ?></span></li>
                            <input type="number" min="1" id="txt_total2" name="txt_total2" style="display: none;">
                        </ul>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <ul class="info">
                            <li><label>Họ đệm:</label><?php echo $row['lastname']; ?></li>
                            <li><label>Tên:</label><?php echo $row['firstname']; ?></li>
                            <li><label>Email:</label><?php echo $row['email']; ?></li>
                            <li><label>SĐT:</label><?php echo $row['phone']; ?></li>
                            <li><label>Địa chỉ:</label><?php echo $row['phone']; ?></li>
                        </ul>
                        <p><label>Lưu ý thêm:</label> <?php echo $row['note']; ?></p>
                    </div>
                </div>
                <div class="files">
                    <label>Danh sách file:</label><small>Bấm vào file để tải về xem chi tiết</small>
                    <?php
                    // $fullPath = $_SERVER['DOCUMENT_ROOT'].'letotrans/uploads/letovn.docx';
                    // $fullPath = 'http://localhost/letotrans/uploads/letovn.docx';
                    // $fullPath = 'http://localhost/letotrans/uploads/hiep-cua-94.doc';
                    // echo $fullPath;
                    // $number = CountPagesDocx($fullPath);
                    // var_dump($number);

                    $files = json_decode($row['files']);
                    foreach ($files as $key => $value) {
                        $download_link = ROOTHOST_ADMIN.'download?id='.$row['id'].'&filename='.$value->name;
                        echo '<div class="file"><a href="'.$download_link.'" target="_blank">'.$value->name.'</a>
                        <input type="hidden" name="txt_filename[]" class="ip-filename" value="'.$value->name.'">
                        <input type="number" name="txt_number[]" min="1" class="ip-numpage" value="'.$value->numpage.'" require></div>';
                    }
                    ?>
                    <div class="clearfix"></div>
                    <input type="button" id="reprice" class="btn btn-success" value="Cập nhật lại giá">
                </div>
                <div class="block-tool">
                    <div>
                        <?php if($row['status'] != '-1'){ ?>
                            <label class="radio-inline"><input type="radio" value="1" name="opt_status" <?php if($row['status']== 1) echo 'checked';?>>Mới</label>
                            <label class="radio-inline"><input type="radio" value="2" name="opt_status" <?php if($row['status']== 2) echo 'checked';?>>Đang xử lý</label>
                            <label class="radio-inline"><input type="radio" value="0" name="opt_status" <?php if($row['status']== 0) echo 'checked';?>>Hoàn thành</label>
                            <label class="radio-inline"><input type="radio" value="-1" name="opt_status" <?php if($row['status']== -1) echo 'checked';?>>Hủy</label>
                        <?php }else{ ?>
                            <label class="radio-inline"><input type="radio" value="-1" name="opt_status">Đã hủy</label>
                        <?php } ?>
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
<script type="text/javascript">
    $('#reprice').click(function(){
        var number = 0;
        var id = $('#txtid').val();
        $('.ip-numpage').each(function(i, obj) {
            number = parseInt(number) + parseInt(obj.value);
        });

        $.ajax({
            url : '<?php echo ROOTHOST_ADMIN.'ajaxs/total_pay.php' ?>',
            type : 'POST',
            data : {
                'id' : id,
                'numpage' : number,
            },
            success: function (res) {
                $('#total-price').text(formatNumber(res));
                $('#txt_total2').val(parseInt(res));
            }
        });
    });

    function formatNumber(num) {
        return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')
    }
</script>