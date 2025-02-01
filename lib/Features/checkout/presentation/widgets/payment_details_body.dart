import 'package:checkout/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout/Features/checkout/presentation/widgets/custom_credit_card.dart';
import 'package:checkout/Features/checkout/presentation/widgets/payment_methods_list_view.dart';
import 'package:checkout/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PaymentDetailsBody extends StatefulWidget {
  const PaymentDetailsBody({super.key});

  @override
  State<PaymentDetailsBody> createState() => _PaymentDetailsBodyState();
}

class _PaymentDetailsBodyState extends State<PaymentDetailsBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: PaymentMethodsListView(),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            autovalidateMode: autovalidateMode,
            formKey: formKey,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
              child: CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const ThankYouView();
                    }));
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                title: 'Pay',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
