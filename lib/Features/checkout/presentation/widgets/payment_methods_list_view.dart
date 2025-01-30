import 'package:checkout/Features/checkout/presentation/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodsListView extends StatelessWidget {
  const PaymentMethodsListView({super.key});
  final List<String> paymentMethodsItem = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
    'assets/images/pay.svg',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
          itemCount: paymentMethodsItem.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: PaymentMethodItem(
                image: paymentMethodsItem[index],
                isActive: false,
              ),
            );
          }),
    );
  }
}
