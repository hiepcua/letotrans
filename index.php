<?php
session_start();
ini_set("display_errors", 1);
define("ISHOME", true);
if (!isset($_SESSION['LANGUAGE'])) {
	$_SESSION['LANGUAGE'] = '0';
}
$isMobile = (bool) preg_match('#\b(ip(hone|od|ad)|android|opera m(ob|in)i|windows (phone|ce)|blackberry|tablet' .
	'|s(ymbian|eries60|amsung)|p(laybook|alm|rofile/midp|laystation portable)|nokia|fennec|htc[\-_]' .
	'|mobile|up\.browser|[1-4][0-9]{2}x[1-4][0-9]{2})\b#i', $_SERVER['HTTP_USER_AGENT']);
$actual_link = "http://{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";

require_once "global/libs/gfinit.php";
require_once "global/libs/gfconfig.php";
require_once "global/libs/gffunc.php";
require_once "global/libs/detectMobile.php";
require_once 'libs/cls.mysqli.php';
require_once 'libs/cls.template.php';
require_once 'libs/cls.menuitem.php';
require_once 'libs/cls.module.php';
require_once 'libs/cls.configsite.php';
require_once 'libs/cls.upload.php';

$tmp 		= new CLS_TEMPLATE();
$objmysql 	= new CLS_MYSQL();
$objdata 	= new CLS_MYSQL();
$conf 		= new CLS_CONFIG();
$detect 	= new Mobile_Detect;
$conf->load_config();
global $tmp;
global $conf;
?>
<!DOCTYPE html>
<html language='vi'>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="robots" content="index" />
	<meta property="og:type" content="website" />
	<meta property="og:author" content='<?php echo $conf->CompanyName; ?>' />
	<meta property="og:locale" content='vi_VN'/>
	<meta property="og:title" content="<?php echo $conf->Title; ?>"/>
	<meta property="og:keywords" content='<?php echo $conf->Meta_key; ?>' />
	<meta property='og:description' content='<?php echo $conf->Meta_desc; ?>' />
	<meta property="og:url" content="<?php echo $actual_link ?>" />
	<meta property="og:image" content="<?php echo $conf->Img; ?>" />

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><?php echo $conf->Title; ?></title>
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/bootstrap.min.css" type="text/css" media="all" />
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/font-awesome.min.css" type="text/css" media="all" >
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/owl.carousel.min.css" >
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/owl.theme.default.min.css">
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/style.css" type="text/css" media="all">
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/style-responsive.css" type="text/css" media="all">
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/Roboto.css" type="text/css" media="all">
	<link rel="icon" type="image/png" sizes="32x32" href="<?php echo ROOTHOST; ?>favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="<?php echo ROOTHOST; ?>favicon-16x16.png">

	<script src="<?php echo ROOTHOST; ?>global/js/jquery-1.11.2.min.js"></script>
	<script src="<?php echo ROOTHOST; ?>global/js/bootstrap.min.js"></script>
	<script src='<?php echo ROOTHOST; ?>js/gfscript.js'></script>
	<script src='<?php echo ROOTHOST; ?>js/owl.carousel.js'></script>
</head>
<body>
	<!-- Load Facebook SDK for JavaScript -->
	<div id="fb-root"></div>
	<!-- <script>(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
		js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script> -->
	<div id="container">
		<header>
			<div id="navbar" class="wrap-menu">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="<?php echo ROOTHOST;?>"><img src="<?php echo ROOTHOST;?>images/logo/logo.png"></a>
					</div>
					<div class="navbar-collapse collapse">
						<nav id="main-menu"><?php $tmp->loadModule('navitor');?></nav>
					</div>
				</div>
			</div>
		</header>
		<?php if($tmp->isFrontpage()){ ?>
			<div class="main-home">
				<div class="wrap-banner">
					<div class="home-banner"></div>
					<?php if($isMobile){ ?>
						<div class="mobile-box-bottom">
							<div class="container">
								<div id="mobile-slide-bnbt" class="owl-carousel owl-theme">
									<div class="item">
										<div class="wrap-thumb"><img src="<?php echo ROOTHOST; ?>images/icons/icon-slide-01.png" class="thumb img-responsive"></div>
										<p><?php $tmp->loadModule('box1'); ?></p>
									</div>
									<div class="item">
										<div class="wrap-thumb"><img src="<?php echo ROOTHOST; ?>images/icons/icon-slide-02.png" class="thumb img-responsive"></div>
										<p><?php $tmp->loadModule('box12'); ?></p>
									</div>
									<div class="item">
										<div class="wrap-thumb"><img src="<?php echo ROOTHOST; ?>images/icons/icon-slide-03.png" class="thumb img-responsive"></div>
										<p><?php $tmp->loadModule('box13'); ?></p>
									</div>
									<div class="item">
										<div class="wrap-thumb"><img src="<?php echo ROOTHOST; ?>images/icons/icon-slide-04.png" class="thumb img-responsive"></div>
										<p><?php $tmp->loadModule('box14'); ?></p>
									</div>
									<div class="item">
										<div class="wrap-thumb"><img src="<?php echo ROOTHOST; ?>images/icons/icon-slide-05.png" class="thumb img-responsive"></div>
										<p><?php $tmp->loadModule('box15'); ?></p>
									</div>
								</div>
							</div>
						</div>
						<script type="text/javascript">
							$('#mobile-slide-bnbt').owlCarousel({
								loop:true,
								navText: ["<img src='<?php echo ROOTHOST; ?>images/icons/arrow_left.png'>","<img src='<?php echo ROOTHOST; ?>images/icons/arrow_right.png'>"],
								dots:true,
								nav:true,
								responsive:{
									0:{
										items:1
									},
									600:{
										items:2
									},
									1000:{
										items:4
									}
								}
							})
						</script>
					<?php }else { ?>
						<div class="box-bottom">
							<div class="container">
								<div class="item">
									<div class="wrap-thumb"><img src="<?php echo ROOTHOST; ?>images/icons/icon-slide-01.png" class="thumb img-responsive"></div>
									<p><?php $tmp->loadModule('box1'); ?></p>
								</div>
								<div class="item">
									<div class="wrap-thumb"><img src="<?php echo ROOTHOST; ?>images/icons/icon-slide-02.png" class="thumb img-responsive"></div>
									<p><?php $tmp->loadModule('box12'); ?></p>
								</div>
								<div class="item">
									<div class="wrap-thumb"><img src="<?php echo ROOTHOST; ?>images/icons/icon-slide-03.png" class="thumb img-responsive"></div>
									<p><?php $tmp->loadModule('box13'); ?></p>
								</div>
								<div class="item">
									<div class="wrap-thumb"><img src="<?php echo ROOTHOST; ?>images/icons/icon-slide-04.png" class="thumb img-responsive"></div>
									<p><?php $tmp->loadModule('box14'); ?></p>
								</div>
								<div class="item">
									<div class="wrap-thumb"><img src="<?php echo ROOTHOST; ?>images/icons/icon-slide-05.png" class="thumb img-responsive"></div>
									<p><?php $tmp->loadModule('box15'); ?></p>
								</div>
							</div>
						</div>
					<?php }; ?>
				</div>

				<?php $tmp->loadModule('box6') ?>
				<?php 
				if($isMobile){
					$tmp->loadModule('box16');
				}else{
					$tmp->loadModule('box2');
				}
				?>

				<?php include_once("modules/mod_feedback/layout.php"); ?>

				<section class="section sec-partner">
					<div class="container">
						<?php $tmp->loadModule('box3'); ?>
					</div>
				</section>

				<section id="sec-faq" class="section sec-faq">
					<div class="container">
						<?php $tmp->loadModule('box17') ?>
					</div>
				</section>

				<?php $tmp->loadModule('box9') ?>
			</div>
		<?php }else{ ?> 
			<div class="component">
				<?php $tmp->loadComponent(); ?> 
			</div>
		<?php }?>

		<footer class="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-3 item web-info">
						<div class="item-header"><span>LETO TRANS</span></div>
						<ul>
							<li>
								<span class="glyphicon glyphicon-map-marker"></span> 
								<div><?php echo $conf->Address; ?></div>
							</li>
							<li>
								<span class="glyphicon glyphicon-phone-alt"></span> 
								<div><?php echo $conf->Phone; ?></div>
							</li>
							<li>
								<span class="glyphicon glyphicon-envelope"></span> 
								<div><?php echo $conf->Email; ?></div>
							</li>
							<li>
								<span class="glyphicon glyphicon-time"></span> 
								<p><?php echo $conf->Work_time; ?></p>
							</li>
						</ul>
					</div>
					<div class="col-md-3 item footer-menu">
						<div class="item-header"><span>LETO TRANS</span></div>
						<?php $tmp->loadModule('box7'); ?>
					</div>
					<div class="col-md-3 item footer-menu">
						<div class="item-header"><span>HỖ TRỢ KHÁCH HÀNG</span></div>
						<?php $tmp->loadModule('box11'); ?>
					</div>
					<div class="col-md-3 item pay">
						<?php $tmp->loadModule('box4'); ?>
					</div>
				</div>
			</div>
			<div class="copyright bg_copyright"><?php $tmp->loadModule('bottom'); ?></div>
		</footer>
	</div>
	<div id="back-top" style="display: block;">
		<a href="#">
			<span class="glyphicon glyphicon-circle-arrow-up"></span>
		</a>
	</div>
	<div id="notify"></div>

	<script type="text/javascript">
		function show_message(message, property){
			var html = '';
			if(message == 'error'){
				html = "<div class='alert alert-danger alert-dismissable' role='alert'>";
				html+= "<button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>";
				html+= "<strong>Warning!</strong>"+ property +"</div>";
			}else if (message == 'success') {
				html = "<div class='alert alert-success alert-dismissable' role='alert'>";
				html+= "<button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
				html+= "<strong>Success!</strong>"+ property +"</div>";
			}
			$('#notify').html(html);

			window.setTimeout(function() {
				$(".alert").fadeTo(500, 0).slideUp(500, function(){
					$(this).remove(); 
				});
			}, 2500);
		}

		$(document).ready(function(){
			$('[data-toggle="tooltip"]').tooltip();
			$('#main-banner').owlCarousel({
				loop:true,
				navText:["<span class='	glyphicon glyphicon-chevron-left'></span>", "<span class='glyphicon glyphicon-chevron-right'></span>"],
				dots:true,
				nav:true,
				responsive:{
					0:{
						items:1
					},
					600:{
						items:1
					},
					1000:{
						items:1
					}
				}
			})

			$('#slide-hot-news').owlCarousel({
				loop:true,
				margin:10,
				responsiveClass:true,
				responsive:{
					0:{
						items:1,
						nav:true
					},
					600:{
						items:1,
						nav:false
					},
					1000:{
						items:1,
						nav:true,
						loop:false
					}
				}
			})

			$("#feedback").owlCarousel({
				loop:true,
				margin:10,
				responsiveClass:true,
				responsive:{
					0:{
						items:1,
						nav:true
					},
					600:{
						items:1,
						nav:false
					},
					1000:{
						items:2,
						nav:true,
						loop:false
					}
				}
			});
		});

		$('#sec-faq .item').click(function(){
			$('#sec-faq .item .answer').slideUp();
			$(this).find('.answer').slideDown(500);
		});

		$("#back-top").hide();
		$(function () {
			$(window).scroll(function () {
				if ($(this).scrollTop() > 400) {
					$('#back-top').fadeIn();
				} else {
					$('#back-top').fadeOut();
				}
			});
			$('#back-top a').click(function () {
				$('body,html').animate({
					scrollTop: 0
				}, 800);
				return false;
			});
		});
	</script>
	<?php if(!$isMobile){ ?>
		<script type="text/javascript">
			var prevScrollpos = window.pageYOffset;
			window.onscroll = function() {
				var currentScrollPos = window.pageYOffset;
				if(currentScrollPos > 300){
					if (prevScrollpos > currentScrollPos) {
						document.getElementById("navbar").style.position = "fixed";
						document.getElementById("navbar").style.top = "";
					} else {
						document.getElementById("navbar").style.position = "relative";
						document.getElementById("navbar").style.top = "0";
					}
					prevScrollpos = currentScrollPos;
				}else{
					document.getElementById("navbar").style.position = "relative";
				}
			}
		</script>
	<?php } ?>
</body>
</html>