import 'package:flutter/material.dart';
import 'package:fortore/utils/AppConstants.dart';
import 'package:fortore/utils/font_style_utils.dart';
import 'package:fortore/utils/sized_box.dart';
class ItemContainer extends StatelessWidget {
  String? title, image, amount;
   ItemContainer({Key? key, this.title, this.image, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: kLightBlack,
            borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(title.toString(), textAlign: TextAlign.end, style: FontStyleUtilities.f13(fontColor: kWhiteColor, fontWeight: FWT.medium),),
                      hSizedBox1,
                      Container(
                        width: 40, color: kYellowDark,
                        height: 2,
                      )
                    ],
                  ),
                ),
                wSizedBox2,
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                    child: Image.asset(image.toString(), width: 32, height: 32,))
              ],
            ),

            Expanded(child: Align(
              alignment: Alignment.bottomRight,
                child: Text(amount.toString(), style: FontStyleUtilities.f24(fontColor: kYellowDark, fontWeight: FWT.medium),))),

          ],
        ),
      ),
    );
  }
}
