import 'package:checkout/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ThankYouItemInfo extends StatelessWidget {
  const ThankYouItemInfo({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.style18,
          textAlign: TextAlign.center,
        ),
        Text(
          value,
          style: Styles.styleBold18,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
