import 'package:checkout/Features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:checkout/Features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout/Features/checkout/presentation/widgets/cart_info_item.dart';
import 'package:checkout/Features/checkout/presentation/widgets/payment_methods_bottom_sheet.dart';
import 'package:checkout/Features/checkout/presentation/widgets/total_price.dart';
import 'package:checkout/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: Image.asset('assets/images/basket_image.png'),
          ),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: r'$42.97',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Discount',
            value: r'$0',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Shipping',
            value: r'$8',
          ),
          const Divider(
            color: Color(0xffC7C7C7),
            thickness: 2,
            height: 34,
            endIndent: 20,
            indent: 20,
          ),
          const TotalPrice(title: 'Total', value: r'$50.97'),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
              title: 'Complete Payment',
              onTap: () {
                showBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    context: context,
                    builder: (context) {
                      return BlocProvider(
                        create: (context) => PaymentCubit(CheckoutRepoImpl()),
                        child: const PaymentMethodsBottomSheet(),
                      );
                    });
              }),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
