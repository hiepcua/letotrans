<?php 
global $tmp;
$tmp->loadModule('banner');
$obj=new CLS_MYSQL;
$isConfig=true;
?>

<div class="clearfix"></div>
<section class="">
<article class="container">
	<?php if($isConfig){?>
	<div class="histories row row-flex">
		<?php 
		$sql="SELECT * FROM tbl_contents LIMIT 0,3";
		$obj->Query($sql);
		while($r=$obj->Fetch_Assoc()){
		?>
		<div class='col-md-4'>
			<div class='item-news'>
				<div class='thumb'><img src='<?php echo $r['thumb'];?>' width='100%'/></div>
				<h1 class='headding'><?php echo $r['title'];?></h1>
			</div>
		</div>
			<?php }?>
	</div>
	<?php }?>
	<div class="hotnews row row-flex">
		<div class='col-md-9'>
			<?php 
			$sql="SELECT * FROM tbl_contents LIMIT 0,1";
			$obj->Query($sql);
			$r=$obj->Fetch_Assoc();
			?>
			<div class='top-news'>
			<div class='thumb'><img src='<?php echo $r['thumb'];?>' width='100%'/></div>
			<h1 class='headding'><?php echo $r['title'];?></h1>
			<div class='intro'><?php echo $r['intro'];?></div>
			</div>
		</div>
		<div class='col-md-3'>
			hii
		</div>
	</div>
	<div class="news row row-flex">
		<div class='col-md-9'><div class='row row-flex'>
			<div class='col-sm-6'>
			hic
			</div>
			<div class='col-sm-6'>
				hii
			</div>
		</div></div>
		<div class='col-md-3'>
			hii
		</div>
	</div>
</article>
</section>