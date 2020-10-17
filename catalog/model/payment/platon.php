<?php

class ModelPaymentPlaton extends Model {

    public function getMethod() {
        $this->language->load('payment/platon');

        $method_data = array(
            'code' => 'platon',
            'title' => $this->language->get('text_title'),
            'terms' => '',
            'sort_order' => $this->config->get('platon_sort_order')
        );

        return $method_data;
    }

}
