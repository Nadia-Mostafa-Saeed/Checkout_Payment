import 'dart:developer';

import 'package:checkout/Features/checkout/data/models/amount_model/amount_model.dart';
import 'package:checkout/Features/checkout/data/models/amount_model/details.dart';
import 'package:checkout/Features/checkout/data/models/item_list_model/item.dart';
import 'package:checkout/Features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:checkout/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout/Features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout/core/utils/api_keys.dart';
import 'package:checkout/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtonBlockConsumer extends StatelessWidget {
  const CustomButtonBlockConsumer({
    super.key,
    required this.isPayPal,
    required this.isStripe,
  });
  final bool isPayPal, isStripe;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        }

        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
            onTap: () {
              if (isPayPal) {
                var transactionsData = getTransactionsData();
                executePayPalPayment(context, transactionsData);
              } else if (isStripe) {
                executeStripePayment(context);
              }
            },
            isLoading: state is PaymentLoading ? true : false,
            title: 'Continue');
      },
    );
  }

  void executeStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '100',
      currency: 'USD',
      customerId: 'cus_Rj3V20o35sFi1x',
    );
    BlocProvider.of<PaymentCubit>(context)
        .makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }

  void executePayPalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true, // testing mode
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.payPalSecretKet,
        transactions: [
          {
            "amount": transactionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionsData.itemList.toJson(),
          },
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        },
        onError: (error) {
          SnackBar snackBar = SnackBar(content: Text(error.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          SnackBar snackBar = const SnackBar(content: Text('cancelled:'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionsData() {
    var amountModel = AmountModel(
      currency: "USD",
      details: Details(
        shipping: "0",
        shippingDiscount: 0,
        subtotal: "100",
      ),
      total: "100",
    );

    List<Item> items = [
      Item(
        currency: "USD",
        name: 'Apple',
        price: "4",
        quantity: 10,
      ),
      Item(
        currency: "USD",
        name: 'Apple',
        price: "5",
        quantity: 12,
      ),
    ];

    var itemList = ItemListModel(
      items: items,
    );

    return (amount: amountModel, itemList: itemList);
  }
}
