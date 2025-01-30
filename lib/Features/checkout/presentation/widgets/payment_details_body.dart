import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentDetailsBody extends StatelessWidget {
  const PaymentDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 62,
          width: 103,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1.5,
                color: Color(0xFF34A853),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0xFF34A853),
                blurRadius: 4,
              ),
            ],
          ),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/card.svg',
                  height: 26,
                ),
              )),
        ),
      ],
    );
  }
}
