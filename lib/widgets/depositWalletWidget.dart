import 'package:flutter/material.dart';
import 'package:fortore/generated/l10n.dart';
import 'package:fortore/utils/AppConstants.dart';
import 'package:fortore/utils/font_style_utils.dart';
import 'package:fortore/utils/sized_box.dart';

class DepositWalletWidget extends StatelessWidget {
  const DepositWalletWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: kLightBlack,
            borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).date, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),),
                Text("Mar, 2022 06:40 PM 17", style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),),
              ],
            ),
            hSizedBox,
           const Divider(color: kLightTextColor, thickness: 0.5,),
            hSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).trx, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),),
                Text("BY96B76GV32S", style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),),
              ],
            ),
            hSizedBox,
            const Divider(color: kLightTextColor, thickness: 0.5,),
            hSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).details, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),),
                Text("Invested On FORTOREMALL", style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),),
              ],
            ),
            hSizedBox,
            const Divider(color: kLightTextColor, thickness: 0.5,),
            hSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).amount, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),),
                Text("- 100000 SAR", style: FontStyleUtilities.f13(fontColor: Colors.red, fontWeight: FWT.medium),),
              ],
            ),
            hSizedBox,
            const Divider(color: kLightTextColor, thickness: 0.5,),
            hSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).remainingAmount, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),),
                Text("400000 SAR", style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
