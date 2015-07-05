<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.jcarousel.min.js"></script>
  <h1 class="general_heading"><span><?php echo $heading_title; ?></span>
    <?php if(count($products)>4){ ?>
  	<div class="jcarousel_arrows">
  		<b id="mycarousel_latest-prev" class="custom-prev"></b>
        <b id="mycarousel_latest-next" class="custom-next"></b>
    </div>
    <?php } ?>    
  </h1>
  <div class="products_container">
  <div id="latest_slider" class="jcarousel-custom">
  <ul class="jcarousel-skin-opencart">
    <?php foreach ($products as $product) { ?><li><div class='product_holder'>
		<div class='product_holder_inside'>	
		 <?php echo '<div class="special_new"></div>'; ?>
	    <?php if ($product['special']) { ?>
	    <?php echo '<div class="special_promo1"></div>'; ?>
	    <?php } ?> 
	         <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
            
            <!-- please add bacground color code from database -->
            
        <div class="color">
             <?php 
              $options = $product['options'];
              foreach ($options as $option){
                if (!isset( $option['option_value'])){
                    continue;
                }
                if (!is_array($option['option_value'])){
                    continue;
                }
              
                $tmp_color_count = 0;
                foreach ($option['option_value'] as $option_value) { ?>
                  <?php if (!empty($option_value['op_desc1'])) {
                    $tmp_color_count++;
                    if ($tmp_color_count > 5){
                    ?>
                        <a href="<?php echo $product['href']; ?>">More</a>
                 <?php 
                        break;
                    }
                  ?>
                    <div option_value="<?php echo $option_value['product_option_value_id']; ?>"  style="background-color:#<?php echo $option_value['op_desc1']; ?>" class="shoe_color getImages" color_id="<?php echo $option_value['option_value_id']; ?>" product_id="<?php echo $product['product_id']; ?>" ></div>
                  <?php } ?>
              <?php } 
                
              }
              ?>
            </div>            
            <!--
            <div class="color">
                <div class="shoe_color" style="background:#0b5d83;"></div>
                <div class="shoe_color" style="background:#000000;"></div>
                <div class="shoe_color" style="background:#683d2d;"></div>
            </div>
            -->
	       <?php if ($product['thumb_swap'] && 1==2) { ?>
      <div class="image"><a href="<?php echo $product['href']; ?>"><img id="img_<?php echo $product['product_id']; ?>" oversrc="<?php echo $product['thumb_swap']; ?>" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" style="border:none"/></a></div>

          <?php } else {?>

      <div class="image"><a href="<?php echo $product['href']; ?>"><img id="img_<?php echo $product['product_id']; ?>" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" style="border:none"/></a></div>

      <?php } ?>
	        <div class="pr_info">
		 
		        <?php if ($product['price']) { ?>
		        <div class="price">
		          <?php if (!$product['special']) { ?>
		          <?php echo $product['price']; ?>
		          <?php } else { ?>
		          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
		          <?php } ?>
		        </div>
		        <?php } ?>
		        <div class="cart"><a class='button' onclick="addToCart('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></a></div>
			</div>
	   </div>
	</div></li><?php } ?>
  </ul>
</div>
</div>

<script type="text/javascript"><!--

function mycarousel_latest_initCallback(carousel) {
	
    $('#mycarousel_latest-next').bind('click', function() {
        if(!$(this).hasClass('custom-next_disabled')){
        	carousel.next();
        }
        return false;
    });

    $('#mycarousel_latest-prev').bind('click', function() {
    	if(!$(this).hasClass('custom-prev_disabled')){
        	carousel.prev();
    	}
        return false;
    });
};

function lastItemReached_latest(carousel, li_object, index, state_action){
	if(index == <?php echo count($products);?>){
		$('#mycarousel_latest-next').addClass('custom-next_disabled');
	}else {
		$('#mycarousel_latest-next').removeClass('custom-next_disabled');
	}
}

function firstItemReached_latest(carousel, li_object, index, state_action){
	if(index == 1){
		$('#mycarousel_latest-prev').addClass('custom-prev_disabled');
	}else {
		$('#mycarousel_latest-prev').removeClass('custom-prev_disabled');
	}
}

$('#latest_slider ul').jcarousel({
	scroll: 4,
	easing: 'easeInOutExpo',
	animation: 800,
	initCallback: mycarousel_latest_initCallback,
	buttonNextHTML: null,
    buttonPrevHTML: null,
    itemLastInCallback: {
    	  onBeforeAnimation: lastItemReached_latest
    },
	itemFirstInCallback: {
		onBeforeAnimation: firstItemReached_latest
	}
});

    
var is_processing = false;
$(document).ready(function() {

    $('.getImages').mouseover( function() {
        if (is_processing){
            return;
        }
        
        color_id = $(this).attr('color_id');
        product_id = $(this).attr('product_id');
        
        $.ajax({
            url: 'index.php?route=product/product/getImages&product_id=' + product_id +'&color_id=' + color_id,
            type: 'post',
            dataType: 'json',
            data: '' ,
            beforeSend: function() {
                is_processing = true;
                $('.success, .warning').remove();
                $(this).parent().attr('disabled', true);
                $(this).off('hover');
            },
            complete: function() {
                is_processing = false;
                $(this).parent().attr('disabled', false);
                $('.attention').remove();
                $(this).on('hover');
            },
            success: function(json_data) {
                if (typeof json_data.images != "undefined") {
                    value = json_data.images[0];
                   $("#img_" + product_id).attr('src',value.thumb);
                }  
                
            }
        });
    });
});
//--></script>