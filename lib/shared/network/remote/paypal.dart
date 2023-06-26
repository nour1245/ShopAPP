import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

import '../../../cubit/shopcubit/shopcubit_cubit.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 249, 249, 249),
        title: const Text(
          "Checkout",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PaypalCheckout(
                sandboxMode: true,
                clientId:
                    "AbK15sidfxepHukzRXH81Oj4o2FELPJmSxpCLzN7EEKUAvpN8BVkg0lPwAK6JTjQWLYmyyx2E0EHplBo",
                secretKey:
                    "EDWz0ddaxE7Bbrrw-8mAHVtZte0FR9ovmwMYRtPj88BERfdMiRbLHqYamO6lYJ3y8iSZ5venpK3Hfg9g",
                returnURL: "success.snippetcoder.com",
                cancelURL: "cancel.snippetcoder.com",
                transactions: [
                  {
                    "amount": {
                      "total": ShopCubit.get(context)
                          .getcartmodel!
                          .data!
                          .total
                          .toString(),
                      "currency": "USD",
                    },
                    "description": "The payment transaction description.",
                    // "payment_options": {
                    //   "allowed_payment_method":
                    //       "INSTANT_FUNDING_SOURCE"
                    // },
                  }
                ],
                note: "Contact us for any questions on your order.",
                onSuccess: (Map params) async {
                  print("onSuccess: $params");
                },
                onError: (error) {
                  print("onError: $error");
                  Navigator.pop(context);
                },
                onCancel: () {
                  print('cancelled:');
                },
              ),
            ));
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(1),
              ),
            ),
          ),
          child: const Text('Paypal'),
        ),
      ),
    );
  }
}
