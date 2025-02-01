import 'package:checkout/Features/checkout/presentation/widgets/thank_you_card_info_widget.dart';
import 'package:checkout/Features/checkout/presentation/widgets/thank_you_item_info.dart';
import 'package:checkout/Features/checkout/presentation/widgets/total_price.dart';
import 'package:checkout/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
          color: const Color(0xffEDEDED),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.only(top: 65, left: 22, right: 22),
        child: Column(
          children: [
            const Text(
              'Thank You!',
              style: Styles.style25,
              textAlign: TextAlign.center,
            ),
            Text(
              'Your transaction was successful',
              style: Styles.style20,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 42,
            ),
            const ThankYouItemInfo(title: 'Date', value: '01/24/2023'),
            const SizedBox(
              height: 20,
            ),
            const ThankYouItemInfo(title: 'Time', value: '10:45 AM'),
            const SizedBox(
              height: 20,
            ),
            const ThankYouItemInfo(title: 'To', value: 'Sam Louis'),
            const Divider(
              color: Color(0xffC7C7C7),
              thickness: 2,
              height: 60,
            ),
            const TotalPrice(title: 'Total', value: r'$50.97'),
            const SizedBox(
              height: 30,
            ),
            const ThankYouCardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1.5,
                        color: Color(0xff34A853),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: Styles.style24.copyWith(
                        color: const Color(0xff34A853),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}
