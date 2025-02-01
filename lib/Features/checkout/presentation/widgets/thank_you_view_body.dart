import 'package:checkout/Features/checkout/presentation/widgets/custom_check_icon.dart';
import 'package:checkout/Features/checkout/presentation/widgets/custom_dashed_line.dart';
import 'package:checkout/Features/checkout/presentation/widgets/thank_you_card.dart';
import 'package:flutter/material.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
              bottom: MediaQuery.sizeOf(context).height * .2 + 20,
              right: 28,
              left: 28,
              child: const CustomDashedLine()),
          Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(
              backgroundColor: Color(0xffFEF7FF),
            ),
          ),
          Positioned(
            right: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(
              backgroundColor: Color(0xffFEF7FF),
            ),
          ),
          const Positioned(
              top: -50, right: 0, left: 0, child: CustomCheckIcon())
        ],
      ),
    );
  }
}
