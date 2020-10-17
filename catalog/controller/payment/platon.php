<?php

class ControllerPaymentPlaton extends Controller {

    private $logObj = NULL;

    public function index() {
        $this->language->load('payment/platon');
        $data['button_confirm'] = $this->language->get('button_confirm');

        $this->load->model('checkout/order');

        $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

        $data['action'] = $this->config->get('platon_gateway_url');

        $data['key'] = $this->config->get('platon_key');
        $data['order'] = $this->session->data['order_id'];

        $amount = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);

        /* Prepare product data for coding */
        $data['data'] = base64_encode(
                json_encode(
                        array(
                            'amount' => sprintf("%01.2f", $amount),
                            'name' => 'Order from ' . $this->config->get('config_name'),
                            'currency' => $order_info['currency_code']
                        )
                )
        );

        $data['url'] = $this->url->link('checkout/success');

        /* Calculation of signature */
        $sign = md5(
                strtoupper(
                        strrev($data['key']) .
                        strrev($data['data']) .
                        strrev($data['url']) .
                        strrev($this->config->get('platon_password'))
                )
        );

        $data['sign'] = $sign;

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/platon.tpl')) {
            $template = $this->config->get('config_template') . '/template/payment/platon.tpl';
        } else {
            $template = 'default/template/payment/platon.tpl';
        }
        $this->log('Start order #' .$this->session->data['order_id']. ' processing...');
        return $this->load->view($template, $data);
    }

    public function callback() {
        $this->log("Callback called");
        $this->log("Params: " . var_export($_POST, true));
        if(empty($_POST)){
          die('Incorrect request');
        }
        $email = (isset($this->request->post['email'])) ? $this->request->post['email'] : '';
        // generate signature from callback params
        $sign = md5(
                strtoupper(
                        strrev($email) .
                        $this->config->get('platon_password') .
                        $this->request->post['order'] .
                        strrev(substr($this->request->post['card'], 0, 6) . substr($this->request->post['card'], -4))
                )
        );

        // verify signature
        if ($this->request->post['sign'] !== $sign) {
            $this->log("ERROR: Bad signature");
            die("ERROR: Bad signature");
        }

        $this->load->model('checkout/order');

        $order_info = $this->model_checkout_order->getOrder($this->request->post['order']);
        if (!$order_info) {
            $this->log('ERROR: Bad order ID');
            die('ERROR: Bad order ID');
        }

        switch ($this->request->post['status']) {
            case 'SALE':
                $order_status_id = $this->config->get('platon_processed_status_id');
                break;
            case 'REFUND':
                $order_status_id = $this->config->get('platon_refunded_status_id');
                break;
            case 'CHARGEBACK':
                break;
            default:
                $this->log("ERROR: Invalid callback data");
                die("ERROR: Invalid callback data");
        }
        $this->model_checkout_order->addOrderHistory($this->request->post['order'], $order_status_id);
        $this->log("Order successfully processed");
        exit("OK");
    }

    public function log($msg) {
        $this->getLog()->write($msg);
    }

    private function getLog() {
        if ($this->logObj == NULL) {
            $this->logObj = new log("platon.log");
        }
        return $this->logObj;
    }

}
