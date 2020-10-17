<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
  	<div class="container-fluid">
  	  <div class="pull-right">
  		<button type="submit" form="form-pp-express" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
  		<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
  	  <h1><?php echo $heading_title; ?></h1>
  	  <ul class="breadcrumb">
  		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
  			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
  		<?php } ?>
  	  </ul>
  	</div>
  </div>
    <div class="container-fluid">
    	<?php if ($error_warning) { ?>
    		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    		  <button type="button" class="close" data-dismiss="alert">&times;</button>
    		</div>
    	<?php } ?>

      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
        </div>
        <div class="panel-body">
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-platon" class="form-horizontal">

            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
              <li><a href="#tab-order-status" data-toggle="tab"><?php echo $tab_order_status; ?></a></li>
            </ul>

            <div class="tab-content">
              <div class="tab-pane active" id="tab-general">

                <div class="form-group required">
    				      <label class="col-sm-2 control-label" for="platon_key"><?php echo $entry_key; ?></label>
          				<div class="col-sm-10">
          				  <input type="text" name="platon_key" value="<?php echo $platon_key; ?>" placeholder="<?php echo $entry_key; ?>" id="platon_key" class="form-control" />
          				  <?php if ($error_key) { ?>
          					  <div class="text-danger"><?php echo $error_key; ?></div>
          				  <?php } ?>
          				</div>
                </div>

                <div class="form-group required">
    				      <label class="col-sm-2 control-label" for="platon_password"><?php echo $entry_password; ?></label>
          				<div class="col-sm-10">
          				  <input type="text" name="platon_password" value="<?php echo $platon_password ?>" placeholder="<?php echo $entry_password; ?>" id="platon_password" class="form-control" />
          				  <?php if ($error_password) { ?>
          					  <div class="text-danger"><?php echo $error_password; ?></div>
          				  <?php } ?>
          				</div>
        				</div>

                <div class="form-group required">
    				      <label class="col-sm-2 control-label" for="platon_gateway_url"><?php echo $entry_gateway_url; ?></label>
          				<div class="col-sm-10">
          				  <input type="text" name="platon_gateway_url" value="<?php echo $platon_gateway_url; ?>" placeholder="<?php echo $entry_gateway_url; ?>" id="platon_gateway_url" class="form-control" />
          				  <?php if ($error_gw_url) { ?>
          					  <div class="text-danger"><?php echo $error_gw_url; ?></div>
          				  <?php } ?>
          				</div>
        				</div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="platon_sort_order"><?php echo $entry_sort_order; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="platon_sort_order" value="<?php echo $platon_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="platon_sort_order" class="form-control" />
                  </div>
                </div>

                <div class="form-group">
          				<label class="col-sm-2 control-label" for="platon_status"><?php echo $entry_status; ?></label>
          				<div class="col-sm-10">
          				  <select name="platon_status" id="platon_status" class="form-control">
          					<?php if ($platon_status) { ?>
          						<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
          						<option value="0"><?php echo $text_disabled; ?></option>
          					<?php } else { ?>
          						<option value="1"><?php echo $text_enabled; ?></option>
          						<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
          					<?php } ?>
          				  </select>
          				</div>
        			  </div>

      				</div>

              <div class="tab-pane" id="tab-order-status">

        			  <div class="form-group">
        				<label class="col-sm-2 control-label"><?php echo $entry_processed_status; ?></label>
        				<div class="col-sm-10">
        				  <select name="platon_processed_status_id" class="form-control">
        					<?php foreach ($order_statuses as $order_status) { ?>
        						<?php if ($order_status['order_status_id'] == $platon_processed_status_id) { ?>
        							<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
        						<?php } else { ?>
        							<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
        						<?php } ?>
        					<?php } ?>
        				  </select>
        				</div>
        			  </div>

        			  <div class="form-group">
        				<label class="col-sm-2 control-label"><?php echo $entry_refunded_status; ?></label>
        				<div class="col-sm-10">
        				  <select name="platon_refunded_status_id" class="form-control">
        					<?php foreach ($order_statuses as $order_status) { ?>
        						<?php if ($order_status['order_status_id'] == $platon_refunded_status_id) { ?>
        							<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
        						<?php } else { ?>
        							<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
        						<?php } ?>
        					<?php } ?>
        				  </select>
        				</div>
        			  </div>

        			</div>
    				</div>
            </form>
        </div>
      </div>
  </div>
</div>
<?php echo $footer; ?>
