<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <div class="sitemap-info">
    <div class="left">
      <ul>
        <?php foreach ($categories as $category_1) { ?>
        <li class="h_one"><a href="<?php echo $category_1['href']; ?>" class="site_h_one"><?php echo $category_1['name']; ?></a>
          <?php if ($category_1['children']) { ?>
          <ul>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <li><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>
              <?php if ($category_2['children']) { ?>
              <ul class="sub_h_one">
                <?php foreach ($category_2['children'] as $category_3) { ?>
                <li><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
    </div>
    <div class="right">
      <ul>
        <li class="h_one"><a href="<?php echo $special; ?>" class="site_h_one"><?php echo $text_special; ?></a></li>
        <li class="h_one"><a href="<?php echo $account; ?>" class="site_h_one"><?php echo $text_account; ?></a>
          <ul  class="sub_h_one">
            <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
            <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
            <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
            <li><a href="<?php echo $history; ?>"><?php echo $text_history; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
          </ul>
        </li>
        <li class="h_one"><a href="<?php echo $cart; ?>" class="site_h_one"><?php echo $text_cart; ?></a></li>
        <li class="h_one"><a href="<?php echo $checkout; ?>" class="site_h_one"><?php echo $text_checkout; ?></a></li>
        <li class="h_one"><a href="<?php echo $search; ?>" class="site_h_one"><?php echo $text_search; ?></a></li>
        <li class="h_one"><a href="" class="site_h_one"><?php echo $text_information; ?></a>
          <ul  class="sub_h_one">
            <?php foreach ($informations as $information) { ?>
            <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
            <?php } ?>
            <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>