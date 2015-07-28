<div class="box">
	<div class="box-heading">
		<span><?php echo $heading_title; ?></span>
		<?php if(count($products)>4){ ?>
		<div class="jcarousel_arrows">
			<b id="mycarousel_latest-prev" class="custom-prev"></b>
			<b id="mycarousel_latest-next" class="custom-next"></b>
		</div>
		<?php } ?>
	</div>
	
	<div class="box-content">
		<div class="box-product">
			<?php foreach ($products as $product) { ?>			
				<div>
                    
                    <?php if ($product['thumb_swap'] && 1==2) { ?>
                        <div class="image">
                            <a href="<?php echo $product['href']; ?>">
                                <img id="img_<?php echo $product['product_id']; ?>" oversrc="<?php echo $product['thumb_swap']; ?>" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" style="border:none"/>
                            </a>
                        </div>
                    <?php } else {?>

                    <div class="image onload">
                        <a href="<?php echo $product['href']; ?>">                        	
                            <img class="loading" id="img_<?php echo $product['product_id']; ?>" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" style="border:none"/>
                        </a>
                    </div>

                    <?php } ?>
					
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
                                            if ($tmp_color_count > 3){
                                            ?>
                                                <a href="<?php echo $product['href']; ?>">More</a>
                                            <?php 
                                                break;
                                            }
                                        ?>
                                        <div title = "<?php echo $option_value['name']; ?>" option_value="<?php echo $option_value['product_option_value_id']; ?>"  style="background-color:<?php echo $option_value['op_desc1']; ?>" class="shoe_color getImages" color_id="<?php echo $option_value['option_value_id']; ?>" product_id="<?php echo $product['product_id']; ?>" ></div>
                                    
                                    <?php } ?>
                            <?php } 
                            
                        }
                        ?>
                    </div>
					
					<div class="name">
						<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
					</div>
					
					<?php if ($product['price']) { ?>
						<div class="price">
							<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
							<?php } else { ?>
								<span class="price-old"><?php echo $product['price']; ?></span> 
								<span class="price-new"><?php echo $product['special']; ?></span>
							<?php } ?>
						</div>
					<?php } ?>
                    
					<div class="cart">
						<input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />
					</div>
				</div>
			<?php } ?>
		</div>
	</div>
</div>



<script type="text/javascript"><!--
var is_processing = false;
$(document).ready(function() {

    $('.getImages').mouseover( function() {
        if (is_processing){
            return;
        }
        
        
        color_id = $(this).attr('color_id');
        product_id = $(this).attr('product_id');
        
        $("#img_" + product_id).attr('src','image/loader.gif');
        
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
                }  else {
                    $("#img_" + product_id).attr('src','image/no_image.jpg');
                }
                
            }
        });
    });
});
//--></script>
