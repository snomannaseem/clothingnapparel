<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <b><?php echo $text_critea; ?></b>

  <div class="search_container">
    <table cellspacing="0" cellpadding="0" class="search_table">
     <tr>
       <td>
      <?php if ($filter_name) { ?>
      <input type="text" name="filter_name" value="<?php echo $filter_name; ?>"/>
      <?php } else { ?>
      <input type="text" name="filter_name" value="<?php echo $heading_title; ?>" onclick="this.value = '';" onkeydown="this.style.color = '#444444'" style="color: #999;" />
      <?php } ?>
      <select name="filter_category_id">
        <option value="0"><?php echo $text_category; ?></option>
        <?php foreach ($categories as $category_1) { ?>
        <?php if ($category_1['category_id'] == $filter_category_id) { ?>
        <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
        <?php } ?>
        <?php foreach ($category_1['children'] as $category_2) { ?>
        <?php if ($category_2['category_id'] == $filter_category_id) { ?>
        <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
        <?php } ?>
        <?php foreach ($category_2['children'] as $category_3) { ?>
        <?php if ($category_3['category_id'] == $filter_category_id) { ?>
        <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
        <?php } ?>
        <?php } ?>
        <?php } ?>
        <?php } ?>
      </select>
    </td></tr>
    <tr>
     <td>   
	    <?php if ($filter_sub_category) { ?>
	    <input type="checkbox" name="filter_sub_category" value="1" id="sub_category" checked="checked" />
	    <?php } else { ?>
	    <input type="checkbox" name="filter_sub_category" value="1" id="sub_category" />
	    <?php } ?>
	    <label for="sub_category"><?php echo $text_sub_category; ?></label>
        &nbsp; &nbsp;
	    <?php if ($filter_description) { ?>
	    <input type="checkbox" name="filter_description" value="1" id="description" checked="checked" />
	    <?php } else { ?>
	    <input type="checkbox" name="filter_description" value="1" id="description" />
	    <?php } ?>
	    <label for="description"><?php echo $entry_description; ?></label>
	    <div class="h10"></div>
  </td></tr>
  
    <tr><td><input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button button_accent" /></td></tr>
   </table>
  </div>
  
  <h2><?php echo $text_search; ?></h2>
  <?php if ($products) { ?>
  <div class="product-filter">
    <div class="display"><b><?php echo $text_display; ?></b> &nbsp;&nbsp;<a onclick="display('list');" class="list_view_link"><?php echo $text_list; ?></a>   <a onclick="display('grid');" class="grid_view_link_active"><?php echo $text_grid; ?></a></div>
    <div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
    <div class="limit"><?php echo $text_limit; ?>
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
    <div class="sort"><?php echo $text_sort; ?>
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
  <div class="product-list">
    <?php foreach ($products as $product) { ?><div class="product_holder">  
     <div class="product_holder_inside">
     <?php if ($product['special']) { ?>
	 <?php echo '<div class="special_promo"></div>'; ?>
	 <?php } ?> 
	 
      <?php if ($product['thumb']) { ?>
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
      <?php } ?>
      <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
      <div class="description"><?php echo $product['description']; ?></div>
      <?php if ($product['price']) { ?>
      <div class="price">
        <?php if (!$product['special']) { ?>
        <?php echo $product['price']; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
        <?php } ?>
        <?php if ($product['tax']) { ?>
        <br />
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($product['rating']) { ?>
      <div class="rating"><img src="catalog/view/theme/shoes/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
      <?php } ?>
      <div class="cart"><a class='button' onclick="addToCart('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></a></div>
      <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a></div>
      <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a></div>
     </div>
    </div><?php } ?>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php }?>
  <?php echo $content_bottom; ?></div>

<script type="text/javascript"><!--
$('#content input[name=\'filter_name\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var filter_name = $('#content input[name=\'filter_name\']').attr('value');
	
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}

	var filter_category_id = $('#content select[name=\'filter_category_id\']').attr('value');
	
	if (filter_category_id > 0) {
		url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
	}
	
	var filter_sub_category = $('#content input[name=\'filter_sub_category\']:checked').attr('value');
	
	if (filter_sub_category) {
		url += '&filter_sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'filter_description\']:checked').attr('value');
	
	if (filter_description) {
		url += '&filter_description=true';
	}

	location = url;
});

function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div.product_holder > div.product_holder_inside').each(function(index, element) {
			html = '';
			if ($(element).children().hasClass("special_promo")){
				html += '<div class="special_promo"></div>'
			};
						
			html += '<div class="right">';
			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
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
		
		$('.product-grid > div.product_holder > div.product_holder_inside').each(function(index, element) {
			html = '';
			
			var image = $(element).find('.image').html();

			if ($(element).children().hasClass("special_promo")){
				html += '<div class="special_promo"></div>'
			};
						
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
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
//--></script> 
<?php echo $footer; ?>