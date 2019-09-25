<?php
require_once ("libs/cls.configsite.php");
$objmysql   = new CLS_MYSQL();
$tmp        = new CLS_TEMPLATE();
$conf       = new CLS_CONFIG();
$conf->getList();
$row_conf = $conf->Fetch_Assoc();

if(isset($_POST["cmd_send_contact"])){
    $Name       = isset($_POST['contact_name']) ? addslashes($_POST['contact_name']) : '';
    $Phone      = isset($_POST['contact_phone']) ? addslashes($_POST['contact_phone']) : '';
    $Email      = isset($_POST['contact_email']) ? addslashes($_POST['contact_email']) : '';
    $Content    = isset($_POST['contact_content']) ? addslashes($_POST['contact_content']) : '';
    $Date       = time();

    $sql="INSERT INTO tbl_contact (`title`, `phone`, `email`, `contents`, `cdate`, `isactive`) VALUES ('".$Name."', '".$Phone."', '".$Email."', '".$Content."', '".$Date."', 1)";
    $objmysql->Query($sql);

};?>
<script language="javascript">
    function chechemail(){
        var name    = document.getElementById("contact_name");
        var phone   = document.getElementById("contact_phone");
        var email   = document.getElementById("contact_email");
        var content = document.getElementById("contact_content");
        // var capchar=document.getElementById("contact_txt_sercurity");
        reg1=/^[0-9A-Za-z]+[0-9A-Za-z_]*@[\w\d.]+.\w{2,4}$/;
        testmail=reg1.test(email.value);

        if(name.value == ""){
            document.getElementById('err_name').innerHTML = 'Không được để trống';
            name.focus();
            return false;
        }
        if(phone.value == ""){
            document.getElementById('err_phone').innerHTML = 'Không được để trống';
            phone.focus();
            return false;
        }
        if(!testmail){
            document.getElementById('err_email').innerHTML = 'Nội dung trống hoặc không đúng định dạng';
            email.focus();
            return false;
        }
        // if(capchar.value==""){
        //     document.getElementById('message').innerHTML = '<font color="#FF0000"><?php //echo PLEASE_CAPCHA ?></font>';
        //     capchar.focus();
        //     return false;
        // }
        document.getElementById("frmcontact").submit();
        return true;
    }
</script>

<section class="page page-contact">
    <div class="page-content">
        <div class="container">
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="<?= ROOTHOST; ?>" title="Trang chủ">
                            Trang chủ
                        </a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                        Thông tin liên hệ
                    </li>
                </ol>
            </nav>
            <h1 class="page-title"><span>Leto Trans</span></h1>
            <div class="row">
                <div class="col-md-6 col-sm-6 web-info">
                    <div class="item">
                        <span class="glyphicon glyphicon-map-marker"></span> 
                        <label>Địa chỉ</label>
                        <p><?php echo $conf->Address; ?></p>
                    </div>
                    <div class="item">
                        <span class="glyphicon glyphicon-phone-alt"></span> 
                        <label>Điện thoại</label>
                        <p><?php echo $conf->Phone; ?></p>
                    </div>
                    <div class="item">
                        <span class="glyphicon glyphicon-envelope"></span> 
                        <label>Email</label>
                        <p><?php echo $conf->Email; ?></p>
                    </div>
                    <div class="item">
                        <span class="glyphicon glyphicon-time"></span> 
                        <label>Giờ làm việc</label>
                        <p><?php echo $conf->Work_time; ?></p>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6">
                    <form class="frm-contact" id="frmcontact" method="post">
                        <p>Những ô đánh dấu * là những ô không được thiếu.</p>
                        <div class="row-flex">
                            <div class="col-left">
                                <div class="item">
                                    <span id="err_name" class="mes-error"></span>
                                    <input type="text" class="form-control" id="contact_name" name="contact_name" placeholder="Họ và tên *">
                                </div>
                                <div class="item">
                                    <span id="err_phone" class="mes-error"></span>
                                    <input type="text" class="form-control" id="contact_phone" name="contact_phone" placeholder="Điện thoại *">
                                </div>
                                <div class="item">
                                    <span id="err_email" class="mes-error"></span>
                                    <input type="email" class="form-control" id="contact_email" name="contact_email" placeholder="Email *">
                                </div>
                            </div>
                            <div class="col-right">
                                <textarea class="form-control" name="contact_content" placeholder="Nội dung"></textarea>
                            </div>
                        </div>
                        <div class="text-center">
                            <input type="submit" value="Gửi liên hệ" id="cmd_send_contact" name="cmd_send_contact" onclick="return chechemail();" class="btn">
                        </div>
                    </form>
                </div>
            </div>
            <br>
            <div class="google-map">
                <div class="embed-responsive embed-responsive-4by3">
                    <?php $this->loadModule('box10'); ?>
                </div>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
</section>
