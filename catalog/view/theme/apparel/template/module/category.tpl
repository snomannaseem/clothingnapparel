<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-category">
      <ul>
        <?php foreach ($categories as $category) { ?>
        <li>
          <?php if ($category['category_id'] == $category_id) { ?>
          <a href="<?php echo $category['href']; ?>" class="active"><?php echo strtoupper($category['name']); ?></a>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>"><?php echo strtoupper($category['name']); ?></a>
          <?php } ?>
          <?php if ($category['children']) { ?>
          <ul>
            <?php foreach ($category['children'] as $child) { ?>
            <li>
              <?php if ($child['category_id'] == $child_id) { ?>
              <a href="<?php echo $child['href']; ?>" class="active"> - <?php echo ucwords(strtolower($child['name'])); ?></a>
              <?php } else { ?>
              <a href="<?php echo $child['href']; ?>"> - <?php echo ucwords(strtolower($child['name'])); ?></a>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>
