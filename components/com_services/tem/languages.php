<section class="page page-languages">
	<div class="container">
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="<?= ROOTHOST; ?>" title="Trang chủ">
						Trang chủ
					</a>
				</li>
				<li class="breadcrumb-item active" aria-current="page">
					Ngôn ngữ
				</li>
			</ol>
		</nav>
		<div class="page-content">
			<div class="row">
				<div class="col-md-9 col-sm-8">
					<h1 class="page-title"><span>Ngôn ngữ</span></h1>
					<div class="languges_block ng-scope">
						<form id="frm-languages" style="display: none;" method="GET" action="<?php echo ROOTHOST;?>order">
							<input type="hidden" name="from" id="txt_from">
							<input type="hidden" name="to" id="txt_to">
						</form>

						<div class="translate_item">
							<div id="translate_from" class="translate_from"></div>
							<div id="translate_to" class="translate_to"></div>
						</div>
						
						<div class="languages_list ng-scope">
							<ul>
								<?php
								$sql = "SELECT * FROM tbl_languages WHERE isactive = 1";
								$objmysql->Query($sql);
								while ($row = $objmysql->Fetch_Assoc()) {
									$image = $row['image'];
									echo '<li class="f32 item" data-id="'.$row['id'].'" data-name="'.$row['name'].' ('.$row['iso'].')">
									<a href="javascript:void(0)" onclick="language_selected(this)" data-id="'.$row['id'].'" title="'.$row['name'].' ('.$row['iso'].')">
									<img src="'.$image.'" class="flag">
									<p class="name">'.$row['name'].' ('.$row['iso'].')<i class="fa fa-check" aria-hidden="true"></i></p>
									</a>
									</li>';
								}
								?>
							</ul>
						</div>

						<div id="languages_list_toolbar" class="languages_list_toolbar"></div>

					</div>
				</div>
				<div class="col-md-3 col-sm-4 wrap-aside">
					<aside class="aside feedback">
						<h3 class="aside-title"><i class="fa fa-circle" aria-hidden="true"></i><span>Ý kiến khách hàng</span></h3>
						<div id="aside-feedback" class="owl-carousel owl-theme">
							<?php
							$sql="SELECT * FROM tbl_feedback WHERE isactive = 1 ORDER BY `order` DESC LIMIT 0, 3";
							$objmysql->Query($sql);
							while($row 	= $objmysql->Fetch_Assoc()) {
								$name 		= stripcslashes($row['name']);
								$comment 	= stripcslashes($row['comment']);
								$career 	= stripcslashes($row['career']);
								$thumb 		= getThumb($row['avatar'], 'img-responsive', '');
								?>
								<div class="item">
									<div class="box-thumb">
										<div class="wrap-thumb"><?php echo $thumb;?></div>
										<div class="name"><?php echo $name; ?></div>
										<div class="career"><?php echo $career; ?></div>
									</div>
									<div class="content"><?php echo $comment; ?></div>
								</div>
							<?php } ?>
						</div>
					</aside>
				</div>
			</div>
			
		</div>
	</div>
</section>

<script type="text/javascript">
	$('#aside-feedback').owlCarousel({
		navigation : true,
		slideSpeed : 3000,
		paginationSpeed : 400,
		loop: true,
		autoplay:true,
		items : 1, 
		itemsDesktop : false,
		itemsDesktopSmall : false,
		itemsTablet: false,
		itemsMobile : false
	});

	var __trans_f 		= '';
	var __trans_t 		= '';
	var __trans_f_id 	= '';
	var __trans_t_id 	= '';

	function language_selected(attr){
		attr.parentNode.classList.add('selected');
		var name 	= attr.getAttribute('title');
		var id 		= attr.getAttribute('data-id');

		if(__trans_f == ''){
			__trans_f 		= name;
			__trans_f_id 	= id;

			var shtml_from = '<strong>Dịch từ:</strong>';
			shtml_from+= '<ul id="trans-from">';
			shtml_from+= '<li>';
			shtml_from+= '<span id="trans-from-name">'+ __trans_f +'</span>';
			shtml_from+= '<a href="javascript:void(0)" onclick="remove_selected_language_from(this)"><i class="fa fa-times" aria-hidden="true"></i></a>';
			shtml_from+= '</li>';
			shtml_from+= '</ul>';
			$('#translate_from').append(shtml_from);
		}else if(__trans_f !== '' && __trans_f !== name){
			__trans_t 		= name;
			__trans_t_id 	= id;

			var shtml_to = '<strong>Sang:</strong>';
			shtml_to+= '<ul id="trans-to">';
			shtml_to+= '<li>';
			shtml_to+= '<span id="trans-to-name">'+ __trans_t +'</span>';
			shtml_to+= '<a href="javascript:void(0)" onclick="remove_selected_language_to(this)"><i class="fa fa-times" aria-hidden="true"></i></a>';
			shtml_to+= '</li>';
			shtml_to+= '</ul>';
			$('#translate_to').append(shtml_to);

			var shtml_toolbar = '<div class="text-center">';
			shtml_toolbar+= '<span id="toolbar-from">'+ __trans_f +'</span>';
			shtml_toolbar+= '<i class="fa fa-long-arrow-right" aria-hidden="true"></i>';
			shtml_toolbar+= '<span id="toolbar-to">'+ __trans_t +'</span>';
			shtml_toolbar+= '<div><a href="javascript:void(0)" onclick="return submit_frm_languages();" class="btn btn-submit-frm-languages">Bắt đầu dịch</a></div>';
			shtml_toolbar+= '</div>';
			$('#languages_list_toolbar').append(shtml_toolbar);

			$('#txt_to').val(__trans_t_id);
			$('#txt_from').val(__trans_f_id);
		}
	}

	function remove_selected_language_from(){
		__trans_f = '';
		__trans_f_id = '';
		remove_selected_language_to();

		$('#translate_from').empty();

		var elems = document.querySelectorAll(".languages_list .item");
		[].forEach.call(elems, function(el) {
			el.className = el.className.replace(/\bselected\b/, "");
		});
	}

	function remove_selected_language_to(){
		var list_items = $('.languages_list .item');
		var lg = list_items.length;
		for(var i = 0; i < lg; i++){
			var tmp_name = list_items[i].getAttribute('data-name');

			if(tmp_name == __trans_t){
				$('#txt_to').val('');
				$('#txt_from').val('');
				$('#translate_to').empty();
				$('#languages_list_toolbar').empty();

				list_items[i].classList.remove('selected');
			}
		}
	}

	function submit_frm_languages(){
		var f = $('#txt_from').val();
		var t = $('#txt_to').val();

		if(f !== '' && t !== ''){
			$('#frm-languages').submit();
		}else{
			alert('Chọn ngôn ngữ chưa đủ');
			return false;
		}
	}
</script>