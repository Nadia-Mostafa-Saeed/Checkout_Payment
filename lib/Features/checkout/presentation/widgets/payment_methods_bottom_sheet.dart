import 'package:checkout/Features/checkout/presentation/widgets/custom_button_bloc_consumer.dart';
import 'package:checkout/Features/checkout/presentation/widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  bool isPayPal = false;
  bool isStripe = false;

  choosePaymentMethod({required int index}) {
    if (index == 0) {
      isStripe = true;
    } else if (index == 1) {
      isPayPal = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          PaymentMethodsListView(
            choosePaymentMethod: choosePaymentMethod,
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButtonBlockConsumer(
            isPayPal: isPayPal,
            isStripe: isStripe,
          ),
        ],
      ),
    );
  }
}
