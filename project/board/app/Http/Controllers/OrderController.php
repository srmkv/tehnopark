<?php

namespace App\Http\Controllers;

use App\Models\Licence;
use App\Models\Order;
use App\Models\Transaction;
use Illuminate\Http\Request;

class OrderController extends Controller
{

    public function getOrder($id) {
        $order = Order::whereId($id)->whereUserId(auth()->id())->firstOrFail();
        $html = $this->apiOrder($order);
        return view('vendor.backpack.base.order', compact('html'));
    }

    public function submitOrder(Request $request) {

        $transaction = Transaction::create([
            'amount' => $request->input('amount'),
            'type' => 'buy',
            'user_id' => auth()->id(),
            'status' => 'pending'
        ]);

        $licence = Licence::create([
            'user_id' => $transaction->user_id,
            'licence_type_id' => $request->input('plan_type_id')
        ]);

        $ord = Order::create([
            'transaction_id' => $transaction->id,
            'user_id' => $transaction->user_id,
            'licence_id' => $licence->id
        ]);
        echo($ord->id); exit();
    }



    public function apiOrder($order) {
        $payment_parameters = http_build_query(array(
            "user_id"=>$order->user_id,
            "order_id"=>$order->id,
            "sum"=>$order->transaction->amount
        ));
        // dd($order,$order->transaction);
        $options = array("http"=>array(
            "method"=>"POST",
            "header"=>
            "Content-type: application/x-www-form-urlencoded",
            "content"=>$payment_parameters
            ));
        $context = stream_context_create($options);
        //return file_get_contents("https://demo.open-processing.ru/order/inline/",FALSE, $context);
        return file_get_contents("https://videocontour.server.paykeeper.ru/order/inline/",FALSE, $context);
    }
}
