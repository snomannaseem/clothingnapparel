<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
    <meta charset="UTF-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>" />
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

    <link rel="stylesheet" type="text/css" href="catalog/view/theme/apparel/stylesheet/stylesheet.css" />
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
    <script type="text/javascript" src="catalog/view/theme/apparel/js/shoes_custom.js"></script>
    <script type="text/javascript" src="catalog/view/theme/apparel/js/cloud_zoom.js"></script>

    <?php foreach ($scripts as $script) { ?>
        <script type="text/javascript" src="<?php echo $script; ?>"></script>
    <?php } ?>
    <!--[if IE 7]>
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
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
<div class="topbar">
	<div class="bar_in">
		<div id="welcome">        
			<?php echo $text_welcome; ?>        
		</div>
		
		<div class="links">
		<!--
			<a href="<?php echo $home; ?>"><?php echo $text_home; ?></a>
			<a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a>
			<a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a>
			<a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
			-->
			<img src="catalog/view/theme/apparel/image/setting.png" />
			<a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>&nbsp;&nbsp;&nbsp;
            
			<?php if (!$logged) { ?>
				<img src="catalog/view/theme/apparel/image/login.png" />
				<a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>&nbsp;&nbsp;&nbsp;
			<?php } else { ?>
				<?php echo $text_logged; ?>
			<?php } ?>
            
            <img src="catalog/view/theme/apparel/image/signup.png" />
			<a href="http://www.clothingnapparel.com/index.php?route=account/register"><?php echo "Register"; ?></a>
		</div>
	</div>
</div>

<div id="container">
    <div id="header">
    	<?php if ($logo) { ?>
    	<div id="logo">
            <a href="<?php echo $home; ?>">
            	<img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
            </a>
        </div>
    	<?php } ?>
        
        <!-- <?php echo $language; ?> -->
        <!-- <?php echo $currency; ?> -->   	
        
        <div class="mid">
            <div id="call">
                <img src="catalog/view/theme/apparel/image/call_ico.png">                
                <h1>0-800-123-4567</h1>
				<h4>CALL US NOW TOLL FREE</h4>
            </div>
            
            <div id="search">            
                <?php if ($filter_name) { ?>
                    <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" />
                <?php } else {
					if (strtolower($text_search) == 'search') $text_search = "";
				?>
					
                    <input type="text" name="filter_name" value="<?php echo $text_search; ?>" placeholder="Search" onclick="this.value = '';" onkeydown="this.style.color = '#000000';" />
                <?php } ?>
                <div class="button-search"></div>
            </div>
        </div>
        
		<div class="cart_up">
			<img src="catalog/view/theme/apparel/image/cart_img.png" />
			<?php echo $cart; ?>
		</div>
        
        <!-- welcome div place here this is old position -->
        
        <!-- links div place here this is old position -->
	</div>
    
	<?php if ($categories) { ?>
    <div id="menu">
        <ul>
        	<?php foreach ($categories as $category) { ?>
        	<li><a href="<?php echo $category['href']; ?>"><?php echo strtoupper($category['name']); ?></a>
        	<?php if ($category['children']) { ?>
        	<div>
        		<?php for ($i = 0; $i < count($category['children']);) { ?>
                <ul>
                    <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                    <?php for (; $i < $j; $i++) { ?>
                    <?php if (isset($category['children'][$i])) { ?>
                    <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo ucwords(strtolower($category['children'][$i]['name'])); ?></a></li>
                    <?php } ?>
                    <?php } ?>
                </ul>
            	<?php } ?>
            </div>
            <?php } ?>
            </li>
        	<?php } ?>
        </ul>
    </div>
	<?php } ?>
    
	<div id="notification"></div>
