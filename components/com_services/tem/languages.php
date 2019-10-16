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

									if($row['default'] == 1){
										echo '<input id="df_language" data-name="'.$row['name'].'('.$row['iso'].')" name="df_language" type="hidden" value="'.$row['id'].'">';
									}

									echo '<li class="f32 item" data-id="'.$row['id'].'" data-name="'.$row['name'].'('.$row['iso'].')">
									<a href="javascript:void(0)" onclick="language_selected(this)" data-id="'.$row['id'].'" title="'.$row['name'].'('.$row['iso'].')">
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
					<?php $this->loadModule('box8'); ?>
				</div>
			</div>
			
		</div>
	</div>
</section>

<script type="text/javascript">
	var __lang_df_id 	= $('#df_language').val();
	var __lang_df_name	= $('#df_language').attr('data-name');
	var __flag_press 	= 1;
	var __flag_lang_df 	= false;
	var __trans_f 		= '';
	var __trans_t 		= '';

	function language_selected(attr){
		var name 	= attr.getAttribute('title');
		var id 		= attr.getAttribute('data-id');
		// console.log(id);

		if(__flag_press == 1){
			if(id == __lang_df_id){
				__flag_lang_df 		= true;
				__trans_f 	= __lang_df_name;
				attr.parentNode.classList.add('selected');
				
				var shtml_from = '<strong>Dịch từ:</strong>';
				shtml_from+= '<ul id="trans-from">';
				shtml_from+= '<li>';
				shtml_from+= '<span id="trans-from-name">'+ __lang_df_name +'</span>';
				shtml_from+= '<a href="javascript:void(0)" onclick="remove_selected_language_from(this)"><i class="fa fa-times" aria-hidden="true"></i></a>';
				shtml_from+= '</li>';
				shtml_from+= '</ul>';
				$('#translate_from').append(shtml_from);

				// Set value input trans from
				$('#txt_from').val(__lang_df_id);
				__flag_press = 2;
			}else{
				__trans_f 	= name;
				attr.parentNode.classList.add('selected');

				var shtml_from = '<strong>Dịch từ:</strong>';
				shtml_from+= '<ul id="trans-from">';
				shtml_from+= '<li>';
				shtml_from+= '<span id="trans-from-name">'+ name +'</span>';
				shtml_from+= '<a href="javascript:void(0)" onclick="remove_selected_language_from(this)"><i class="fa fa-times" aria-hidden="true"></i></a>';
				shtml_from+= '</li>';
				shtml_from+= '</ul>';
				$('#translate_from').append(shtml_from);

				// Set value input trans from
				$('#txt_from').val(id);
				// Select trans to is default language
				select_dflanguage();
			}
		}else if(__flag_press == 2){
			if(__flag_lang_df == true && id != __lang_df_id){
				__trans_t 	= name;
				attr.parentNode.classList.add('selected');
				
				var shtml_to = '<strong>Sang:</strong>';
				shtml_to+= '<ul id="trans-to">';
				shtml_to+= '<li>';
				shtml_to+= '<span id="trans-to-name">'+ name +'</span>';
				shtml_to+= '</li>';
				shtml_to+= '</ul>';
				$('#translate_to').append(shtml_to);

				$('#txt_to').val(id);
				$('#txt_from').val(__lang_df_id);

				layout_toolbar();
			}
			__flag_press = 3;
		}
	}

	function select_dflanguage(){
		var list_items = $('.languages_list .item');
		var lg = list_items.length;
		for(var i = 0; i < lg; i++){
			var tmp_id = list_items[i].getAttribute('data-id');
			if(tmp_id == __lang_df_id){
				// add class selected
				list_items[i].classList.add('selected');
				// set flag dflanguage is true
				__flag_lang_df 		= true;
				// set trans from
				__trans_t 	= __lang_df_name;

				var shtml_to = '<strong>Sang:</strong>';
				shtml_to+= '<ul id="trans-to">';
				shtml_to+= '<li>';
				shtml_to+= '<span id="trans-to-name">'+ __lang_df_name +'</span>';
				shtml_to+= '</li>';
				shtml_to+= '</ul>';
				$('#translate_to').append(shtml_to);
				$('#txt_to').val(__lang_df_id);
				layout_toolbar();
			}
		}
		__flag_press = 3;
	}

	function layout_toolbar(){
		var shtml_toolbar = '<div class="text-center">';
		shtml_toolbar+= '<span id="toolbar-from">'+ __trans_f +'</span>';
		shtml_toolbar+= '<i class="fa fa-long-arrow-right" aria-hidden="true"></i>';
		shtml_toolbar+= '<span id="toolbar-to">'+ __trans_t +'</span>';
		shtml_toolbar+= '<div><a href="javascript:void(0)" onclick="return submit_frm_languages();" class="btn btn-submit-frm-languages">Bắt đầu dịch</a></div>';
		shtml_toolbar+= '</div>';
		$('#languages_list_toolbar').append(shtml_toolbar);
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
		__flag_press = 1;
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