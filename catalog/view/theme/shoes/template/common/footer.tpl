<div id="footer">
  <div class="column">
    <h3><?php echo $text_information; ?></h3>
    <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <div class="column">
    <h3><?php echo $text_service; ?></h3>
    <ul>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
  </div>
  <div class="column">
    <h3><?php echo $text_extra; ?></h3>
    <ul>
      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
      <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
    </ul>
  </div>
  <div class="column">
    <h3><?php echo $text_account; ?></h3>
    <ul>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>
  <div class="big_column">
  	<a href='http://www.pinterest.com/' class='icon_pinterest' title='Facebook'>Pinterest</a>
  	<a href='http://www.twitter.com/' class='icon_tweet' title='Tweeter'>Tweeter</a>
  	<a href='http://www.skype.com/' class='icon_skype' title='Skype'>Skype</a>
  	<a href='http://www.google.com/' class='icon_google' title='Google+'>Google+</a>
  	<a href='http://www.facebook.com/' class='icon_facebook' title='Facebook'>Facebook</a>
  	<div class='clear'></div>
  	<div class='h20'></div>
  	<div class='h20'></div>
  	<div class='h20'></div>
  	<div class='h10'></div>
  	<span class='icon_amex hidden-phone'</span>
  </div>  
  <div class="clear"></div>
  <div class="footer_btm">
      <div id="powered">© <?php echo date("Y");?>  <a href="http://www.opencarttemplate.info" target="_blank">* Shoeocean.com *</a>   &nbsp; |  &nbsp;  Powered by <a href="http://www.opencart.com/" target="_blank">Noman Naseem</a></div>
  </div>
</div>

</div>
<!-- begin scroll to top button //-->
<script type='text/javascript'>
$(function() {
    $.fn.scrollToTop = function() {
	$(this).hide().removeAttr("href");
	if ($(window).scrollTop() != "0") {
	    $(this).fadeIn("slow")
	}
	var scrollDiv = $(this);
	$(window).scroll(function() {
	    if ($(window).scrollTop() == "0") {
		$(scrollDiv).fadeOut("slow")
	    } else {
		$(scrollDiv).fadeIn("slow")
	    }
	});
	$(this).click(function() {
	    $("html, body").animate({
		scrollTop: 0
	    }, "slow")
	})
    }
});
$(function() {
    $("#scroll-to-top").scrollToTop();
});
</script>
<a href='#' id='scroll-to-top' style='display:none;'></a>
<!-- end scroll to top button //-->

<!-- begin social icons JQUERY //-->
<script type="text/javascript">
    $(document).ready(function () {
    $("#social-icons-jqueryanime li").each(function () {
    $("a strong", this).css("opacity", "0");
    });
    $("#social-icons-jqueryanime li").hover(function () {
    $(this).stop().fadeTo(500, 1).siblings().stop().fadeTo(500, 0.2);
    $("a strong", this).stop().animate({
    opacity: 1,
    top: "-15px"
    }, 300);
    }, function () {
    $(this).stop().fadeTo(500, 1).siblings().stop().fadeTo(500, 1);
    $("a strong", this).stop().animate({
    opacity: 0,
    top: "-1px"
    }, 300);
    });
    });
</script>
<!-- end social icons JQUERY //-->
</body>
</html>