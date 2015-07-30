<?php echo $header; ?>
<?php echo $column_left; ?>
<?php echo $column_right; ?>

<div id="content" class="inside_page"><?php echo $content_top; ?>
	<?php if ($thumb_banner) { ?>
		<div style="display: block;">
			<img src="<?php echo $thumb_banner; ?>" alt="" title="">
		</div>
	<?php } ?>
		
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	
    <div class="category-info">
		<?php if ($thumb && 1==2) { ?>
			<div class="image"><img id="img_<?php echo $product['product_id']; ?>" src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
		<?php } ?>
		
		<h1><?php echo $heading_title; ?></h1>

		<?php if ($description) { ?>
			<?php echo $description; ?>
		<?php } ?>
    </div>

    <?php if ($categories) { ?>
		<!--
		<h2 class="ref_search"><?php echo $text_refine; ?></h2>
		-->
		<div class="category-list">
			<?php if (count($categories) <= 5 && 1==2) { ?>
				<ul>
					<?php foreach ($categories as $category) { ?>
					<li><a href="<?php echo $category['href']; ?>"><?php echo str_truncate($category['name'],55); ?></a></li>
					<?php } ?>
				</ul>
			<?php } else { ?>
				<?php for ($i = 0; $i < count($categories);) { ?>
					<div class="product-grid">
						<?php $j = $i + ceil(count($categories) / 1); ?>
						<?php for (; $i < $j; $i++) { ?>
							<?php if (isset($categories[$i])) { ?>
		  
								<div class="product_holder category_holder">  
									<div class="product_holder_inside">
									 
										<?php if ($categories[$i]['thumb']) { ?>
											<div class="image">
												<a href="<?php echo $categories[$i]['href']; ?>">
													<img id="img_cat_<?php echo $categories[$i]['category_id']; ?>" src="<?php echo $categories[$i]['thumb']; ?>" title="<?php echo $categories[$i]['name']; ?>" alt="<?php echo $categories[$i]['name']; ?>" />
												</a>
											</div>
										<?php } ?>
										
										<div class="name">
											<a href="<?php echo $categories[$i]['href']; ?>">
												<?php echo str_truncate($categories[$i]['name'], 55); ?>
											</a>
										</div>
									  
									 </div>
								</div>
							<?php } ?>
							<!--
								<li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
								<li><img src="<?php echo $categories[$i]['image']?>" alt="<?php echo $categories[$i]['name']; ?>"></li>
							-->
						<?php } ?>
					</div>
				<?php } ?>
			<?php } ?>
		</div>
    <?php } ?>
	
    <?php if ($products) { ?>
		<div class="product-filter">
			<!--
			<div class="display"><b><?php echo $text_display; ?></b> &nbsp;&nbsp;<a onclick="display('list');" class="list_view_link"><?php echo $text_list; ?></a>   <a onclick="display('grid');" class="grid_view_link_active"><?php echo $text_grid; ?></a></div>
			<div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
			-->
			<div class="limit"><b><?php echo $text_limit; ?></b>
				<select onchange="location = this.value;">

					<?php 
						// Swapping the $limits Array values for 4 items in a row! 
						function swap_limits_values($limits){
							$new_limits = $limits;
							foreach($limits as $i=>$limit_item){
								if($limit_item['value']==25){
									$new_limits[$i]['text'] = 32;
									$new_limits[$i]['value'] = 32;
									$new_limits[$i]['href'] = substr($limit_item['href'], 0, -2).'32';
								}elseif($limit_item['value']==50){
									$new_limits[$i]['text'] = 64;
									$new_limits[$i]['value'] = 64;
									$new_limits[$i]['href'] = substr($limit_item['href'], 0, -2).'64';
								}elseif($limit_item['value']==75){
									unset($new_limits[$i]);
								}
							}
							return $new_limits;
						}

						$limits = swap_limits_values($limits);
					?>
					
					<?php foreach ($limits as $limits) { ?>
						<?php if ($limits['value'] == $limit) { ?>
							<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
						<?php } ?>
					<?php } ?>
				</select>
			</div>
			
			<div class="sort"><b><?php echo $text_sort; ?></b>
				<select onchange="location = this.value;">
				<?php foreach ($sorts as $sorts) { ?>
				<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
					<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
				<?php } else { ?>
					<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
				<?php } ?>
				<?php } ?>
				</select>
			</div>
		</div>
        
		<div id="products" class="product-grid">
			<?php foreach ($products as $product) { ?>
				<div class="product_holder">
					<div class="product_holder_inside">
						<?php if ($product['special']) { ?>
							<?php echo '<div class="special_promo"></div>'; ?>
						<?php } ?>
     
						<?php if ($product['thumb']) { ?>
							<div class="image">
								<a href="<?php echo $product['href']; ?>">
									<img id="img_<?php echo $product['product_id']; ?>" src="<?php echo $product['thumb']; ?>" title="<?php echo str_truncate($product['name'],55); ?>" alt="<?php echo $str_truncate(product['name'],55); ?>" />
								</a>
							</div>
						<?php } ?> 
        
						<!-- please add background color code from database -->
						<div class="color">
							<?php 
								$options = $product['options'];
								//print_r($option);
								foreach ($options as $option){?>
									<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value=""/>
									<?php $tmp_color_count = 0;
									foreach ($option['option_value'] as $option_value) { ?>
									<?php if (!empty($option_value['op_desc1'])) {
									$tmp_color_count++;
									if ($tmp_color_count > 4){
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
							<a href="<?php echo $product['href']; ?>">
								<?php echo str_truncate($product['name'],55); ?>
							</a>
						</div>     
      
						<div class="description">
							<?php echo $product['description']; ?>
						</div>
        
						<?php if ($product['price']) { ?>
							<div class="price">
								<?php if (!$product['special']) { ?>
									<?php echo $product['price']; ?>
								<?php } else { ?>
									<span class="price-old"><?php echo $product['price']; ?></span> 
									<span class="price-new"><?php echo $product['special']; ?></span>
								<?php } ?>
								
								<?php if ($product['tax']) { ?>
									<br />
									<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
								<?php } ?>
							</div>
						<?php } ?>
      
						<?php if ($product['rating']) { ?>
							<div class="rating">
								<img src="catalog/view/theme/shoes/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
							</div>
						<?php } ?>

						<div class="cart">
							<a class='button' onclick="addToCart('<?php echo $product['product_id']; ?>');">
								Add to Cart
							</a>
						</div>
					</div>
				</div>
			<?php } ?>
		</div>
		
		<div class="pagination"><?php echo $pagination; ?></div>
	<?php } ?>
	
	<?php if (!$categories && !$products) { ?>
		<div class="content"><?php echo $text_empty; ?></div>
		<div class="buttons">
			<a href="<?php echo $continue; ?>" class="button"></a>
		</div>
	<?php } ?>
	
	<?php echo $content_bottom; ?>
</div>

<script type="text/javascript"><!--
function display(view) {
    view = 'grid';
	if (view == 'list') {
        
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div.product_holder > div.product_holder_inside').each(function(index, element) {

			html = '';
			if ($(element).children().hasClass("special_promo")){
				html += '<div class="special_promo"></div>'
			};
			
            html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
            html += '  <div class="color">' + $(element).find('.color').html() + '</div>';
            
			html += '<div class="right">';
			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '</div>';			
			
			html += '<div class="left">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
			
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			html += '  <div class="description">' + $(element).find('.description').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
				
			html += '</div>';

						
			$(element).html(html);
		});		
		
		$('.display').html('<b><?php echo $text_display; ?></b> &nbsp;&nbsp;<a onclick="display(\'list\');" class="list_view_link"><?php echo $text_list; ?></a>   <a onclick="display(\'grid\');" class="grid_view_link_active"><?php echo $text_grid; ?></a>');
		
		$.cookie('display', 'list'); 
	} else {
    
		$('.product-list').attr('class', 'product-grid');
		
		$('#products .product-grid > div.product_holder > div.product_holder_inside').each(function(index, element) {
			html = '';
			//please add any div to html than adde here same tag 
			var image = $(element).find('.image').html();
			
			if ($(element).children().hasClass("special_promo")){
				html += '<div class="special_promo"></div>'
			};
			
            html += '<div class="name">' + $(element).find('.name').html() + '</div>';
            html += '<div class="color">' + $(element).find('.color').html() + '</div>';
            
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			
			
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
						
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			
			$(element).html(html);
		});	
					
		$('.display').html('<b><?php echo $text_display; ?></b> &nbsp;&nbsp;<a onclick="display(\'list\');" class="list_view_link_active"><?php echo $text_list; ?></a>   <a onclick="display(\'grid\');" class="grid_view_link"><?php echo $text_grid; ?></a>');
		
		$.cookie('display', 'grid');
	}
}

view = $.cookie('display');

if (view) {
	display(view);
} else {
	display('list');
}
    function thumbclick(img_url){
        $("#image").attr('src',img_url);
        return false;
    }
    
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
                $("#img_" + product_id).attr('class','thumb_loading');
            },
            complete: function() {
                is_processing = false;
                $(this).parent().attr('disabled', false);
                $('.attention').remove();
                $(this).on('hover');
                $("#img_" + product_id).removeClass('thumb_loading');
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
<?php echo $footer; ?>