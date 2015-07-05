<?php
class ControllerModulefeatured extends Controller {
	protected function index($setting) {
		$this->language->load('module/featured'); 

      	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['button_cart'] = $this->language->get('button_cart');
		
		$this->load->model('catalog/product'); 
		
		$this->load->model('tool/image');

		$this->data['products'] = array();

		$products = explode(',', $this->config->get('featured_product'));		

		if (empty($setting['limit'])) {
			$setting['limit'] = 5;
		}
		
		$products = array_slice($products, 0, (int)$setting['limit']);
		
		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					//$image = $this->model_tool_image->resize($product_info['image'], $setting['image_width'], $setting['image_height']);
					$image = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
                    
				} else {
					$image = false;
				}
				$images = $this->model_catalog_product->getProductImages($product_info['product_id']);

            if(isset($images[0]['image']) && !empty($images[0]['image'])){
                  $images =$images[0]['image'];
               }

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
                
                
                // Patch by Noman
                
                $tmp_options =  array();
                //$this->data['options'] = array();
                
                foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) { 
                    if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') { 
                        $option_value_data = array();
                        
                        foreach ($option['option_value'] as $option_value) {
                            if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
                                // if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
                                    // $price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
                                // } else {
                                    // $price = false;
                                // }
                                
                                $option_value_data[] = array(
                                    'product_option_value_id' => $option_value['product_option_value_id'],
                                    'option_value_id'         => $option_value['option_value_id'],
                                    'name'                    => $option_value['name'],
                                    'op_desc1'                => $option_value['op_desc1'],
                                    'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
                                    'price'                   => $price,
                                    'price_prefix'            => $option_value['price_prefix']
                                );
                            }
                        }
                        
                        $tmp_options[] = array(
                            'product_option_id' => $option['product_option_id'],
                            'option_id'         => $option['option_id'],
                            'name'              => $option['name'],
                            'type'              => $option['type'],
                            'option_value'      => $option_value_data,
                            'required'          => $option['required']
                        );					
                    } elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
                        $tmp_options[] = array(
                            'product_option_id' => $option['product_option_id'],
                            'option_id'         => $option['option_id'],
                            'name'              => $option['name'],
                            'type'              => $option['type'],
                            'option_value'      => $option['option_value'],
                            'required'          => $option['required']
                        );						
                    }
                }       
            
				$this->data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,
					'thumb_swap'  => $this->model_tool_image->resize($images, $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height')),
					'name'    	 => $product_info['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
                    'options'    => $tmp_options,
				);
			}
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/featured.tpl';
		} else {
			$this->template = 'default/template/module/featured.tpl';
		}

		$this->render();
	}
}
?>