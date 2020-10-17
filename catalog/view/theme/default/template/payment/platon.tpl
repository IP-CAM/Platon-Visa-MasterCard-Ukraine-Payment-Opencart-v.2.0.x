<form action="<?php echo $action; ?>" id="platon_checkout" name="platon_checkout" method="post">
  <input type="hidden" name="key" value="<?php echo $key; ?>" />
  <input type="hidden" name="order" value="<?php echo $order; ?>" />
  <input type="hidden" name="url" value="<?php echo $url; ?>" />
  <input type="hidden" name="data" value="<?php echo $data; ?>" />
  <input type="hidden" name="sign" value="<?php echo $sign; ?>" />
  <div class="buttons">
    <div class="pull-right">
      <input type="submit" class="btn btn-primary" value="<?php echo $button_confirm; ?>">
    </div>
  </div>
</form>
