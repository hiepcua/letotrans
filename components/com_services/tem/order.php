<?php
$_from_id 			= isset($_GET['from']) ? (int)$_GET['from'] : '';
$_to_id 			= isset($_GET['to']) ? (int)$_GET['to'] : '';
$_service 			= isset($_GET['service']) ? (int)$_GET['service'] : 0;
$_service_type 		= isset($_GET['service_type']) ? (int)$_GET['service_type'] : 0;
$_service_name 		= isset($_GET['service_name']) ? trim($_GET['service_name']) : '';
$_service_type_name = isset($_GET['service_type_name']) ? trim($_GET['service_type_name']) : '';
$_time		 		= isset($_GET['time']) ? (int)$_GET['time'] : 0;
$_numpage			= 0;

$sql = "SELECT * FROM tbl_price WHERE lang1 = ".$_from_id." AND lang2 = ".$_to_id;
$objmysql->Query($sql);
$r_price = $objmysql->Fetch_Assoc();
$dfprice = $r_price['price'] ? (int)$r_price['price'] : 0;
?>
<script type="text/javascript">
	var _service 			= '';
	var _service_type 		= '';	
	var _total_pay 			= '<?php echo $dfprice; ?>';	
	var _service_name 		= '<?php echo $_service_name; ?>';
	var _service_type_name 	= '<?php echo $_service_type_name; ?>';
	var _numpage 			= '<?php echo $_numpage; ?>';
	var _time 				= '<?php echo $_time; ?>';
</script>
<section class="page page-order">
	<div class="container">
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="<?= ROOTHOST; ?>" title="Trang chủ">
						Trang chủ
					</a>
				</li>
				<li class="breadcrumb-item active" aria-current="page">
					Chi tiết yêu cầu dịch thuật
				</li>
			</ol>
		</nav>

		<div class="page-content">
			<div class="row">
				<div class="col-md-9 col-sm-8">
					<h1 class="page-title">CHỌN THÔNG TIN</h1>
					<form id="frm-action" method="post" action="<?php echo ROOTHOST; ?>yeu-cau-dich-vu" enctype="multipart/form-data">
						<input type="hidden" id="txt_dfprice" name="txt_dfprice" value="<?php echo $dfprice; ?>">
						<input type="hidden" id="txt_service" name="txt_service" value="<?php echo $_service; ?>">
						<input type="hidden" id="txt_service_type" name="txt_service_type" value="<?php echo $_service_type; ?>">
						<input type="hidden" id="txt_payment_type" name="txt_payment_type" value="4">
						<?php
						$sql3 = "SELECT * FROM tbl_languages WHERE isactive = 1 AND `default` = 1";
						$objmysql->Query($sql3);
						$row3 = $objmysql->Fetch_Assoc();
						echo '<input type="hidden" id="lang_df" data-name="'.$row3['name'].'" value="'.$row3['id'].'">';
						?>
						<div class="b-service b-item">
							<div class="block b-service1">
								<div class="label-title">Chọn dịch vụ:</div>
								<div class="content">
									<?php
									$sql1 = "SELECT * FROM tbl_service WHERE isactive = 1 ORDER BY `order` ASC";
									$objmysql->Query($sql1);
									$i1 = 1;
									while ($row1 = $objmysql->Fetch_Assoc()) {
										if($_service == $row1['id']){
											echo '<div class="item active" data-id="'.$row1['id'].'" data-name="'.$row1['name'].'" onclick="select_service(this)"><div class="inside"><span>'.$row1['name'].'</span></div></div>';
										}else{
											echo '<div class="item" data-id="'.$row1['id'].'" data-name="'.$row1['name'].'" onclick="select_service(this)"><div class="inside"><span>'.$row1['name'].'</span></div></div>';
										}
										$i1++;
									}
									?>
								</div>
							</div>
							<hr>
							<div class="block b-service-type">
								<div class="label-title">Chọn lĩnh vực:</div>
								<div id="reload_service_type" class="content">
									<?php
									if($_service != 0){
										$sql = "SELECT * FROM tbl_service_doc WHERE isactive=1 AND service_id = ".$_service;
										$objmysql->Query($sql);
										$i = 1;
										while ($row = $objmysql->Fetch_Assoc()) {
											$sql1 = "SELECT * FROM tbl_service_type WHERE isactive=1 AND id = ".$row['service_type_id'];
											$objdata->Query($sql1);

											while ($row1 = $objdata->Fetch_Assoc()) {
												if($i == 1) {
													$active = 'active';
													echo '<script>$(document).ready(function(){
														$("#txt_service_type").val('.$row1['id'].');
														$("#sl-service-type").text("'.$row1['name'].'");
													})</script>';
												}else {
													$active = '';
												}
												echo '<div class="item '.$active.'" data-id="'.$row1['id'].'" data-name="'.$row1['name'].'" onclick="select_service_type(this)" data-toggle="tooltip" title="'.$row1['name'].'"><div class="inside"><img src="'.$row1['icon'].'" class="img-responsive"></div></div>';
												$i++;
											}
										}
									}else{
										$sql2 = "SELECT * FROM tbl_service_type WHERE isactive = 1 ORDER BY `order` ASC";
										$objmysql->Query($sql2);
										while ($row2 = $objmysql->Fetch_Assoc()) {
											echo '<div class="item" data-id="'.$row2['id'].'" data-name="'.$row2['name'].'" onclick="select_service_type(this)" data-toggle="tooltip" title="'.$row2['name'].'"><div class="inside"><img src="'.$row2['icon'].'" class="img-responsive"></div></div>';
										}
									}
									?>
								</div>
							</div>
						</div>
						<hr>

						<div class="b-languages b-item">
							<div class="block from">
								<div class="label-title">Dịch từ:</div>
								<div class="content">
									<div id="err_cbo_from" class="mes-error">Trường này là bắt buộc</div>
									<select id="cbo_from" name="cbo_from" class="form-control" onchange="change_trans_from(this)">
										<option value="">-- Chọn một --</option>
										<?php
										$sql3 = "SELECT * FROM tbl_languages WHERE isactive = 1 ORDER BY `order` ASC";
										$objmysql->Query($sql3);
										while ($row3 = $objmysql->Fetch_Assoc()) {
											echo '<option value="'.$row3['id'].'">'.$row3['name'].'</option>';
										}
										?>
									</select>
									<script type="text/javascript">
										cbo_Selected('cbo_from','<?php echo $_from_id; ?>');
									</script>
								</div>
							</div>
							<div class="block to">
								<div class="label-title">Sang:</div>
								<div class="content">
									<div id="err_cbo_to" class="mes-error">Trường này là bắt buộc</div>
									<select id="cbo_to" name="cbo_to" class="form-control">
										<option value="">-- Chọn một --</option>
										<?php
										$sql3 = "SELECT * FROM tbl_languages WHERE isactive = 1 ORDER BY `order` ASC";
										$objmysql->Query($sql3);
										while ($row3 = $objmysql->Fetch_Assoc()) {
											echo '<option value="'.$row3['id'].'">'.$row3['name'].'</option>';
										}
										?>
									</select>
									<script type="text/javascript">
										cbo_Selected('cbo_to','<?php echo $_to_id; ?>');
									</script>
								</div>
							</div>
						</div>
						<hr>

						<div class="b-upload b-item">
							<div class="block">
								<div class="label-title">Tải file cần dịch:</div>
								<div class="content">
									<div class="item upload" onclick="clickFiles()">
										<input type="file" multiple id="uploadFiles" name="txt-files" onchange="changeUploadFiles()">
									</div>
									<div class="item des">
										<p>Các file hỗ trợ dịch</p>
										<div>.txt, .pdf, .csv, .doc, .docx, .xls, .xlsx, .xml, .txt.</div>
									</div>
								</div>
							</div>
							<div id="list-inputFiles" style="display: none;">
							</div>
							<div id="list-files">
								<div id="err_txt-files" class="mes-error">Chưa upload file nào</div>
								<strong style="padding-bottom: 10px;">Files upload:</strong>
							</div>
						</div>
						<hr>

						<div class="b-item b-more">
							<div class="block">
								<div class="label-title">Thời gian:</div>
								<div class="content">
									<div class="wr-radio">
										<label class="radio-inline"><input type="radio" value="1" name="txt_time" <?php if($_time == 0) echo 'checked'; ?>>Bình thường</label>
										<label class="radio-inline"><input type="radio" value="0" name="txt_time" <?php if($_time == 1) echo 'checked'; ?>>Gấp</label>
									</div>
								</div>
							</div>
							<hr>
							<div class="block">
								<div class="label-title">Công chứng dịch:</div>
								<div class="content">
									<div class="wr-radio">
										<label class="radio-inline"><input type="radio" value="1" name="txt_ccd" <?php if($_time == 0) echo 'checked'; ?>>Có</label>
										<label class="radio-inline"><input type="radio" value="0" name="txt_ccd" <?php if($_time == 1) echo 'checked'; ?>>Không</label>
									</div>
								</div>
							</div>
							<hr>
							<div class="block">
								<div class="label-title">Công chứng gấp:</div>
								<div class="content">
									<div class="wr-radio">
										<label class="radio-inline"><input type="radio" value="1" name="txt_ccg" <?php if($_time == 0) echo 'checked'; ?>>Có</label>
										<label class="radio-inline"><input type="radio" value="0" name="txt_ccg" <?php if($_time == 1) echo 'checked'; ?>>Không</label>
									</div>
									<div class="des">120k</div>
								</div>
							</div>
							<hr>
							<div class="block">
								<div class="label-title">Ship:</div>
								<div class="content">
									<div class="wr-radio">
										<label class="radio-inline"><input type="radio" value="1" name="txt_ship" <?php if($_time == 0) echo 'checked'; ?>>Có</label>
										<label class="radio-inline"><input type="radio" value="0" name="txt_ship" <?php if($_time == 1) echo 'checked'; ?>>Không</label>
									</div>
									<div class="des">50k</div>
								</div>
							</div>
						</div>
						<hr>

						<div class="b-userinfo b-item">
							<h2>THÔNG TIN KHÁCH HÀNG</h2>
							<div class="block">
								<div class="label-title">Họ và tên:</div>
								<div class="content">
									<div id="err_txt-lastname" class="mes-error">Không được để trống</div>
									<div class="col">
										<input type="text" class="form-control" name="txt-lastname" placeholder="Họ và tên đệm" required>
									</div>
									<div id="err_txt-firstname" class="mes-error">Không được để trống</div>
									<div class="col">
										<input type="text" class="form-control" name="txt-firstname" placeholder="Tên" required>
									</div>
								</div>
							</div>
							<div class="block">
								<div class="label-title">Email:</div>
								<div class="content">
									<div id="err_txt-email" class="mes-error">Không được để trống</div>
									<div class="col">
										<input type="email" class="form-control" name="txt-email" placeholder="Email" required>
									</div>
								</div>
							</div>
							<div class="block">
								<div class="label-title">Điện thoại:</div>
								<div class="content">
									<div id="err_txt-phone" class="mes-error">Không được để trống</div>
									<div class="col">
										<input type="text" class="form-control" name="txt-phone" placeholder="Điện thoại" required>
									</div>
								</div>
							</div>
							<div class="block">
								<div class="label-title">Địa chỉ:</div>
								<div class="content">
									<div class="col full">
										<input type="text" class="form-control" name="txt-address" placeholder="Địa chỉ" required>
									</div>
								</div>
							</div>
						</div>
						<hr>

						<div class="b-payment b-item">
							<div class="block">
								<div class="label-title">Hình thức thanh toán</div>
								<div class="content">
									<div class="item col" onclick="select_payment_type(this)" data-id="1" data-name="paypal">
										<div class="inside">
											<img src="<?php echo ROOTHOST; ?>images/basic/pay1.png" class="img-responsive">
										</div>
									</div>
									<div class="item col" onclick="select_payment_type(this)" data-id="2" data-name="vnpay">
										<div class="inside">
											<img src="<?php echo ROOTHOST; ?>images/basic/pay2.png" class="img-responsive">
										</div>
									</div>
									<div class="item col" onclick="select_payment_type(this)" data-id="3" data-name="momo">
										<div class="inside">
											<img src="<?php echo ROOTHOST; ?>images/basic/pay3.png" class="img-responsive">
										</div>
									</div>
									<div class="item col active" onclick="select_payment_type(this)" data-id="4" data-name="ngân lượng">
										<div class="inside">
											<img src="<?php echo ROOTHOST; ?>images/basic/pay4.png" class="img-responsive">
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr>

						<div class="b-other b-item">
							<div class="block">
								<div class="label-title">Yêu cầu thêm:</div>
								<div class="content">
									<textarea class="form-control" name="txt-note" rows="3" placeholder="Yêu cầu thêm"></textarea>
								</div>
							</div>
						</div>
						<input type="submit" name="save-order" class="form-control save-order" value="Bắt đầu dịch">
					</form>
				</div>
				<div class="col-md-3 col-sm-4 wrap-aside">
					<aside class="aside aside-payment">
						<h3>Thông tin thanh toán</h3>
						<div class="content">
							<ul>
								<li><b>Dịch vụ:</b> <span id="sl-service"><?php echo $_service_name; ?></span></li>
								<li><b>Lĩnh vực:</b> <span id="sl-service-type"><?php echo $_service_type_name; ?></span></li>
								<li><b>Số trang cần dịch:</b> <span id="sl-numpages"><?php echo $_numpage; ?></span></li>
								<li><b>Thời gian:</b> <span id="sl-time" data-val="<?php echo $_time ?>"><?php if($_time == 0) echo 'Bình thường'; else echo 'Gấp'; ?></span></li>
							</ul>

							<div id="sum-pay" class="text-center">
								<div class="inside">
									<div class="item1" onclick="sum_price()">Tính tiền</div>
									<div class="item2">Tổng: <span id="total-pay"><?php echo $dfprice; ?></span>đ</div>
								</div>
							</div>
						</div>
					</aside>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	$('#frm-action').submit(function(){
		return validate_input();
	});

	function validate_input(){
		var flag 		= true;
		var lang1 		= $('#cbo_from').val();
		var lang2 		= $('#cbo_to').val();
		var firstname 	= $('input[name="txt-firstname"]').val();
		var lastname 	= $('input[name="txt-lastname"]').val();
		var email 		= $('input[name="txt-email"]').val();
		var phone 		= $('input[name="txt-phone"]').val();
		var files 		= document.getElementById("uploadFiles").files.length;
		
		if(lang1 == ''){
			$('#err_cbo_from').css('display', 'block');
			flag = false;
		}
		if(lang2 == ''){
			$('#err_cbo_to').css('display', 'block');
			flag = false;
		}
		if(firstname == ''){
			$('#err_txt-firstname').css('display', 'block');
			flag = false;
		}
		if(lastname == ''){
			$('#err_txt-lastname').css('display', 'block');
			flag = false;
		}
		if(email == ''){
			$('#err_txt-email').css('display', 'block');
			flag = false;
		}
		if(phone == ''){
			$('#err_txt-phone').css('display', 'block');
			flag = false;
		}
		if(files == 0){
			$('#err_txt-files').css('display', 'block');
			flag = false;
		}

		if(flag == false){
			return false;
		}else{
			return true;
		}
	}

	function first_service_click(){
		$('.b-service .b-service1 .item:first-child').click();
	}
	function first_service_type_click(){
		$('.b-service .b-service-type .item:first-child').click();
	}

	function select_payment_type(attr){
		var id = attr.getAttribute('data-id');
		var name = attr.getAttribute('data-name');
		$('.b-payment .item').removeClass('active');
		attr.classList.add('active');
		$('#txt_payment_type').val(id);
	}
	function select_service(attr){
		var id = attr.getAttribute('data-id');
		var name = attr.getAttribute('data-name');
		$('.b-service .b-service1 .item').removeClass('active');
		attr.classList.add('active');
		$('#txt_service').val(id);
		$('#sl-service').text(name);

		// Get service type by service id
		reload_service_type(id);
	}

	function reload_service_type(service_id){
		$.ajax({
			url : '<?php echo ROOTHOST.'ajaxs/get_service_type.php' ?>',
			type : 'POST',
			data : {
				'id' : service_id,
			},
			success: function (res) {
				$('#reload_service_type').empty();
				$('#reload_service_type').html(res);
				first_service_type_click();
			}
		})
	}

	function select_service_type(attr){
		var id = attr.getAttribute('data-id');
		var name = attr.getAttribute('data-name');
		$('.b-service .b-service-type .item').removeClass('active');
		attr.classList.add('active');
		$('#txt_service_type').val(id);
		$('#sl-service-type').text(name);
	}

	function change_trans_from(attr){
		var id = attr.value;
		var lang_df = $('#lang_df').val();

		$.ajax({
			url : '<?php echo ROOTHOST.'ajaxs/get_language_to.php' ?>',
			type : 'POST',
			data : {
				'id' : id,
				'lang_df' : lang_df,
			},
			success: function (res) {
				$('#cbo_to').empty();
				$('#cbo_to').html(res);
			}
		})
	}

	function clickFiles(){
		var input = document.createElement('input');
		input.type = 'file[]';
		input.className = 'file-item';
		input.style = 'display: none';
		input.addEventListener('change', function uploadFiles(){
			var x = this;
			var txt = "";
			if ('files' in x) {
				if (x.files.length >= 0) {
					for (var i = 0; i < x.files.length; i++) {
						txt += "<br><strong>" + (i+1) + ". file</strong><br>";
						var file = x.files[i];
						if ('name' in file) {
							txt += "name: " + file.name + "<br>";
						}
						if ('size' in file) {
							txt += "size: " + file.size + " bytes <br>";
						}
					}
				}
			} 
			else {
				if (x.value == "") {
					txt += "Select one or more files.";
				} else {
					txt += "The files property is not supported by your browser!";
					txt  += "<br>The path of the selected file: " + x.value; 
				}
			}
			document.getElementById("list-files").innerHTML = txt;
		});
		$('#list-inputFiles').append(input);
		input.click();
	}

	function changeUploadFiles(){
		var x = document.getElementById("uploadFiles");
		var txt = "";
		txt += '<strong style="padding-bottom: 10px;">Files upload:</strong>';
		if ('files' in x) {
			if (x.files.length >= 0) {
				for (var i = 0; i < x.files.length; i++) {
					txt += '<div class="element">';
					txt += '<div class="inline">';
					txt += '<strong class="num">' + (i+1) + ". </strong>";
					var file = x.files[i];
					if ('name' in file) {
						txt += '<span class="name">' + file.name + "</span>";
					}
					if ('size' in file) {
						txt += '<span class="size">Size: ' + convert_mb(file.size) + " Mb</span>";
					}
					txt += '<input type="number" min="1" name="numpage[]" class="numpage" onchange="sum_numpage(this)">';
					// txt += '<a href="javascript:void(0);" class="del" data-name="'+ file.name +'" onclick="removeUploadedFile(this)">x</a>';
					txt += '</div>';
					txt += '</div>';
				}
			}
		} 
		else {
			if (x.value == "") {
				txt += "Select one or more files.";
			} else {
				txt += "The files property is not supported by your browser!";
				txt  += "<br>The path of the selected file: " + x.value; 
			}
		}
		document.getElementById("list-files").empty;
		document.getElementById("list-files").innerHTML = txt;
	}

	// function removeUploadedFile(attr){
	// 	var x = document.getElementById("uploadFiles");
	// 	var _name = attr.getAttribute('data-name');
	// 	var newList = [];

	// 	for(var i = 0; i < x.files.length; i++){
	// 		var file = x.files[i];
	// 		if (file.name != _name) {
	// 			newList.push(file);
	// 		}
	// 	}
	// 	var par = attr.parentElement.parentElement.remove();
	// }

	function convert_mb(byte){
		var Mb = Math.ceil(parseFloat(byte * 0.000001));
		return Mb;
	}
	function set_service(){
		$('#sl-service').text(_service);
	}
	function set_service_type(){
		$('#sl-service-type').text(_service_type);
	}
	function set_numpage(){
		$('#sl-numpages').text(_numpage);
	}
	function set_time(){
		if(_time == 0){
			$('#sl-time').text('Bình thường');
		}else{
			$('#sl-time').text('Gấp');
		}
	}
	function sum_numpage(attr){
		var numpage = $('.numpage');
		var sum = 0;
		numpage.each(function(){
			var tmp = $(this).val();
			if(tmp > 0 && tmp !== '' && tmp !== null){
				sum = parseInt(sum) + parseInt(tmp);
			}
		});
		_numpage = sum;
		set_numpage();
	}
	function set_price(){
		$('#total-pay').text(_total_pay);
	}
	function sum_price(){
		var total = 0;
		var lang_df = $('#lang_df').val();
		var lang1 = $('#cbo_from').val();
		var lang2 = $('#cbo_to').val();
		var numpage = $('#sl-numpages').text();
		var time = document.querySelector('input[name="txt_time"]:checked').value;
		var ccd = document.querySelector('input[name="txt_ccd"]:checked').value;
		var ccg = document.querySelector('input[name="txt_ccg"]:checked').value;
		var ship = document.querySelector('input[name="txt_ship"]:checked').value;

		$.ajax({
			url : '<?php echo ROOTHOST.'ajaxs/total_pay.php' ?>',
			type : 'POST',
			data : {
				'lang1' : lang1,
				'lang2' : lang2,
				'lang_df' : lang_df,
				'numpage' : numpage,
				'time' : time,
				'ccd' : ccd,
				'ccg' : ccg,
				'ship' : ship,
			},
			success: function (res) {
				$('#sum-pay .item1').css('display', 'none');
				$('#sum-pay .item2').css('display', 'block');
				$('#total-pay').text(res);
			}
		})
	}
</script>