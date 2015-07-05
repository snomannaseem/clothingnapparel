// Push the top links away from Cart
function positionHeaderLinks(){
	var cart_header_w = $('#cart-total').width();
	if(cart_header_w>=124){
		$('#header_links').css('right',(cart_header_w+78)+'px');
	}
}

// Prod add
function addProductCount(){
	
	var q = parseInt($('#quantity').val());
    if(q > 0){
    	$('#quantity').val(q+1);
    }         
    return false;
}



function subProductCount(){

	var q = parseInt($('#quantity').val());
    if(q > 1){
    	$('#quantity').val(q-1);
    }         
    return false;
}


// Bind the possible Add to Cart btns with event to position top links
$(document).ready(function(){
	
	// Menu Animation
    $('#menu ul li').hover(
        function() {
            $(this).addClass("active");
            $(this).find('div').stop(false, true).slideDown({
            	duration:300,
            	easing:"easeOutExpo"});
        },
        function() {
            $(this).removeClass("active");        
            $(this).find('div').stop(false, true).slideUp({
            	duration:100,
            	easing:"easeOutExpo"});
        }
    );

    positionHeaderLinks();	
	
	$('.cart a').bind('click',function(){
		positionHeaderLinks();
	});
	$('.cart .sm_button').bind('click',function(){
		positionHeaderLinks();
	});
	$('.cart .button').bind('click',function(){
		positionHeaderLinks();
	});
	
	
	
	
	/* Override the Ajax Cart */

	$('#cart > .heading a').die('click');
	$('#cart').die('mouseleave');
	

	
	$('#cart > .heading a').live('click', function() {
	
		$('#header #cart .content').slideDown(400);
		$('#cart').addClass('active');
				
		$('#cart').load('index.php?route=module/cart #cart > *');
		$('#cart').live('mouseleave', function() {
			$('#header #cart .content').slideUp(200, function(){
				$(this).removeClass('active');
			});
		});
	});


	// Fading products	
	$('#content .product_holder').hover(
		    function() {
		    	if(typeof(fading_effects) != "undefined" && fading_effects){
		    		$(this).siblings().find('img').stop().fadeTo(150, 0.6);
		    		$(this).siblings().find('.special_promo').stop().fadeTo(150, 0.6);
		    	}
		    },
		    function() {
		    	if(typeof(fading_effects) != "undefined" && fading_effects){
		    		$(this).siblings().find('img').stop().fadeTo(150, 1);
		    		$(this).siblings().find('.special_promo').stop().fadeTo(150, 1);
		    	}
		    }	
	);

	$('#content .jcarousel-item').hover(
			function() {
		    	if(typeof(fading_effects) != "undefined" && fading_effects){
		    		$(this).siblings().find('img').stop().fadeTo(300, 0.5);
		    	}
			},
			function() {
		    	if(typeof(fading_effects) != "undefined" && fading_effects){
		    		$(this).siblings().find('img').stop().fadeTo(300, 1);
		    	}
			}
	);
	
	// Sidebar Nav effects
	
	$('.side_bar_nav a').not(".active").hover(
			function() {
				$(this).children('.hover_span').stop().animate({width:'100%'},500,'easeOutExpo');
			},
			function() {
				$(this).children('.hover_span').stop().animate({width:'0'},200,'easeOutExpo');
			}
	);	
	
	
});
//Tooltip Hover Effect//

function simple_tooltip(target_items, name){
 $(target_items).each(function(i){
			var my_tooltip = $("#"+name+i);
		
		$(this).removeAttr("title").mouseover(function(){
				my_tooltip.css({display:"none"}).fadeIn(10);
		}).mousemove(function(kmouse){
				my_tooltip.css({left:kmouse.pageX+10, top:kmouse.pageY+0});
		}).mouseout(function(){
				my_tooltip.fadeOut(10);				  
		});
	});
}

	
$(document).ready(function(){
	 simple_tooltip(".quantity a img","tooltip");
	 simple_tooltip(".jcarousel-skin-opencart img","tooltip");
});
//Product List Rollover Effect//

function SimpleSwap(el,which){
  el.src=el.getAttribute(which || "origsrc");
}

function SimpleSwapSetup(){
  var x = document.getElementsByTagName("img");
  for (var i=0;i<x.length;i++){
    var oversrc = x[i].getAttribute("oversrc");
    if (!oversrc) continue;
      
    // preload image
    // comment the next two lines to disable image pre-loading
    x[i].oversrc_img = new Image();
    x[i].oversrc_img.src=oversrc;
    // set event handlers
    x[i].onmouseover = new Function("SimpleSwap(this,'oversrc');");
    x[i].onmouseout = new Function("SimpleSwap(this);");
    // save original src
    x[i].setAttribute("origsrc",x[i].src);
  }
}

var PreSimpleSwapOnload =(window.onload)? window.onload : function(){};
window.onload = function(){PreSimpleSwapOnload(); SimpleSwapSetup();}
$(function(){
	//Color & Size
	$(".op li").click(function(){
		var value = $(this).attr("id");
		var title = $(this).find("a").attr("title");
		$(".option").find("option[value='"+value+"']").attr("selected","selected");
	});						
	$("ul.color li").click(function(){
			$("ul.color li").css('opacity',0.5);
			$(this).css('opacity', 1);
	});	
	$("ul.size li").click(function(){		
		$("ul.size li").css('opacity',0.5);
		$(this).css('opacity', 1);
	});	
});  
/*language and currency switcher*/

$(document).ready(function() {
$('.switcher').hover(function() {
$(this).find('.option').stop(true, true).slideDown(300);
},function() {
$(this).find('.option').stop(true, true).slideUp(150);
});
});

$(function(){
	//Top Menu
	$('ul.links li').mouseover(function(){
		$(this).find('ul').show();
	}).mouseleave(function(){
		$('ul.links li > ul').hide();
	});
});

$(function(){
	$('.hshare').css({ opacity: 0.8 }).mouseover(function(){
		$(this).css({opacity:1});
	}).mouseleave(function(){
		$(this).css({opacity:0.8});
	});
});

$(function(){
	//Search
	var searchInput = $('.searchBox input');
	var value = searchInput.val();
	searchInput.click(function(){		
			$(this).val('');
	});
	searchInput.blur(function(){
		if($(this).val() == ""){
				$(this).val(value);
		}
	});
	
	$('#search-input').keydown(function(e) {
		if (e.keyCode == 13) {
			$('#button').trigger('click');
		}
	});

	$('#button').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
		
		var filter_name = $('.searchBox input[name=\'filter_name\']').attr('value');
		
		if (filter_name) {
			url += '&filter_name=' + encodeURIComponent(filter_name);
		}
	
		var filter_category_id = $('.searchBox input[name=\'filter_category_id\']').attr('value');
		
		if (filter_category_id > 0) {
			url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
		}	
		location = url;
	});
	

	
	$('.selected-cat').click(function(){
		$('.selectCat ul').show().mouseleave(function(){
			$(this).hide();
		});	
	});	
		
	$('.selectCat ul li > span').click(function(){
		$('.selected-cat').empty().append($(this).text());
		$('.selectCat ul').hide();		
	});
	
	$('.cat-list li').click(function(){		
		var cat_id = $(this).attr('class');
		var cat_name = $(this).text();
		
		if(cat_id){
			$('input#select-cat').attr('value',cat_id);
		}else{
			$('input#select-cat').attr('value','');	
		}
		$('.selected-cat').empty().append(cat_name);
		$('.selectCat ul').hide();		
	});
	
	
	/* Ajax Cart */
	$('#cart > .heading a').live('click', function() {
		$('#cart').addClass('active');
		
		$('#cart').load('index.php?route=module/cart #cart > *');
		
		$('#cart').live('mouseleave', function() {
			$(this).removeClass('active');
		});
	});
	
});

$(function(){
	//Image  Fade
	$('.box img,.product-grid img,.product-list img,.left img').hover(function(){
		this.check = this.check || 1;
		$(this).stop().fadeTo('slow',this.check++%2==0 ? 1 : 0.7);
	});
});

$(function(){
	//Slideshow
	var navWidth = $('.slideNav').width();
	var countLi = $('.slideNav li').size();
	
	var liWidth = navWidth/countLi;
	
	$('.slideNav li a').css('width',liWidth);
	$('.slideNav li a').mouseover(function(){
  		$(this).trigger('click');
	});
});

$(function(){
	//Left Category
	$('.box-category ul li').mouseover(function(){
		var ul = $(this).find('ul');		
		if(!$(ul).is(":visible")){
			$(ul).slideDown();
		}		
	}).mouseleave(function(){	
		if(!$(this).find('a').hasClass('active')){
			$(this).find('ul').slideUp();
		}
	});

$(function(){
	//Sidebar Modules
	$('#column-left .box-product').each(function(){
		var parent = this.parentNode;
	$(this) 
		.after('<div id="imageNav">') 
		.cycle({ 
			fx:     'scrollHorz', 
			speed:  'fast', 
			timeout: 0, 
			pager:  $('#imageNav',parent),
			after: onAfter
	});
	function onAfter(curr, next, opts, fwd) {
	 var $ht = $(this).height();
	 $(this).parent().css({height: $ht});
	}
	
	});
	
});

$(function(){
	$('.menu2 li.mainCat').click(function(){
		$(this).find('ul').toggle();
	}).mouseleave(function(){
		$(this).find('ul').hide();
	});
});

$(function(){
	//Product Page Tabs
	$('.tab-content').first().show();
	$('ul.product-tab li,a.description,a.reviews').click(function(){
		var tab = $(this).attr('class');
		$('.tab-content').hide();
		$('#' + tab).show();
		$('ul.product-tab li a').removeClass('active');
		$(this).find('a').addClass('active');
	});
	$('.product-info .right a.description').click(function(){
		$('ul.product-tab li.description').find('a').addClass('active');
	});
	$('.product-info .right a.reviews').click(function(){
		$('ul.product-tab li.reviews').find('a').addClass('active');
	});
	
});	

});

	
	


