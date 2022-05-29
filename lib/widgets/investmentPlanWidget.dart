import 'package:flutter/material.dart';
import 'package:fortore/generated/l10n.dart';
import 'package:fortore/utils/AppConstants.dart';
import 'package:fortore/utils/font_style_utils.dart';
import 'package:fortore/utils/sized_box.dart';

class InvestmentPlanWidget extends StatelessWidget {
  const InvestmentPlanWidget({Key? key}) : super(key: key);

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
                Expanded(child: Text(S.of(context).plan, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                Expanded(child: Text("FORTOREMALL\nSAR 10000", textAlign: TextAlign.end, style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),)),
              ],
            ),
            hSizedBox,
            const Divider(color: kLightTextColor, thickness: 0.5,),
            hSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(S.of(context).returnData, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                Expanded(child: Text("83.33 SAR every Day for 6935 Day + Capital", textAlign: TextAlign.end, style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),)),
              ],
            ),
            hSizedBox,
            const Divider(color: kLightTextColor, thickness: 0.5,),
            hSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(S.of(context).received, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                Expanded(child: Text("53 x83.33 = 4416.49 SAR", textAlign: TextAlign.end, style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),)),
              ],
            ),
            hSizedBox,
            const Divider(color: kLightTextColor, thickness: 0.5,),
            hSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(S.of(context).details, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 90,
                      height: 30,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                          side: BorderSide(color: kYellowDark, width: 1),
                        ),
                        onPressed: (){}, child: Text(S.of(context).contract, style: FontStyleUtilities.f11(fontColor: kYellowDark, fontWeight: FWT.regular),),),
                    ),
                  ],
                )),
              ],
            ),
            hSizedBox,
            const Divider(color: kLightTextColor, thickness: 0.5,),
            hSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(S.of(context).nextPayment, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("0d: 9h 31m 16s", textAlign: TextAlign.end, style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),),
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
