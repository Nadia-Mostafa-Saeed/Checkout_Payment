import 'package:checkout/Features/checkout/presentation/widgets/my_cart_view_body.dart';
import 'package:checkout/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart', context: context),
      body: const MyCartViewBody(),
    );
  }
}
