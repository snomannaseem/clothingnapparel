<?php if (isset($_SERVER['HTTP_USER_AGENT']) && !strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE 6')) echo '<?xml version="1.0" encoding="UTF-8"?>'. "\n"; ?>
<!DOCTYPE html>
<html>
<head>
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/shoes/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/shoes/stylesheet/carousel.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<script type="text/javascript" src="catalog/view/theme/shoes/js/shoes_custom.js"></script>
<script type="text/javascript" src="catalog/view/theme/shoes/js/cloud_zoom.js"></script>
<?php
    $tmp_page_no = 1;
    if (isset($this->request->get['route'])){
        if ($this->request->get['route'] == 'product/category'){
            if (isset($this->request->get['page'])){
                $tmp_page_no = $this->request->get['page'];
            }
            
            $tmp_prev_page_no = $tmp_page_no - 1;
            $tmp_next_page_no = $tmp_page_no + 1;
            
            $tmp_prev_url = $this->request->get['_route_'] . "?page=". $tmp_prev_page_no;
            $tmp_next_url = $this->request->get['_route_'] . "?page=". $tmp_next_page_no;
            
            ?>
                <link rel="canonical" href="<?php echo $this->request->get['_route_'] ?>" />
                <link rel="next" href="<?php echo $tmp_next_url; ?>" />
            <?php
            
            if ($tmp_prev_page_no > 0){
            ?>  <link rel="prev" href="<?php echo $tmp_prev_url; ?>" />
            <?php
            }
        }
    }
?>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600' rel='stylesheet' type='text/css'>

<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/shoes/stylesheet/ie8.css" />
<![endif]-->
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/shoes/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php echo $google_analytics; ?>
</head>
<body>

<div id="container">

<div id="header">
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
  <?php } ?>

	  <div id="welcome">
	    <?php if (!$logged) { ?>
	    <?php echo $text_welcome; ?>
	    <?php } else { ?>
	    <?php echo $text_logged; ?>
	    <?php } ?>
	  </div>
	 
	  <div class="links" id="header_links"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a><a href="<?php echo $wishlist; ?>" id="wishlist-total" class="wishlist_link"><?php echo $text_wishlist; ?></a> <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>
	  <?php echo $cart; ?>


  <div id='header_btm'>
  	<div id="search">
	  	<div class="search_inside">
		    <?php if ($filter_name) { ?>
		    <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" />
		    <?php } else { ?>
		    <input type="text" name="filter_name" value="<?php echo $text_search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '#444444';" />
		    <?php } ?>
		    <div class="button-search"></div>
	    </div>
	  </div>
  	<?php echo $language; ?>
  	<?php echo $currency; ?>
  </div>
 
</div>

<?php if ($categories) { ?>
<div id="menu-wrapper">
<div id="menu">
  <ul>
   <!--
   <li><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
   -->
    <?php foreach ($categories as $category) { ?>
    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
		 
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
</div><!-- #menu -->
</div><!-- #menu-wrapper -->
<?php } ?>





<!-- PHONE::Start -->

<?php if ($categories) { ?>
<div id="menu-phone" class="shown-phone" style="display: none;">
  <div id="menu-phone-button">Menu</div>
  <select id="menu-phone-select" onchange="location = this.value">
  	<option value=""></option>
    <?php foreach ($categories as $category) { ?>
    <option value="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></option>
    <?php } ?>
  </select>
</div>

<script type="text/javascript">
	// Bind the Phone menu dropdown
	$('#menu-phone-button').bind('click', function() {
		$("#menu-phone-select").css({'opacity':'1'});
	});
</script>
<?php } ?>

<!-- PHONE::End -->

<div id="notification"></div>
