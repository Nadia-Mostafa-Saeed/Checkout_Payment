import 'package:checkout/Features/checkout/presentation/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';

class PaymentDetailsBody extends StatelessWidget {
  const PaymentDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PaymentMethodItem(
          isActive: false,
        ),
      ],
    );
  }
}
