import 'package:checkout/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ThankYouCardInfoWidget extends StatelessWidget {
  const ThankYouCardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      decoration: ShapeDecoration(
        color: const Color(0xffFFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/images/mastercreditcard.svg'),
          const SizedBox(
            width: 23,
          ),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Credit Card',
                  style: Styles.style18,
                ),
                TextSpan(
                  text: 'Mastercard **78',
                  style: Styles.style16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
