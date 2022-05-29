import 'package:flutter/material.dart';
import 'package:fortore/utils/AppConstants.dart';
import 'package:fortore/utils/font_style_utils.dart';
class AccountContainer extends StatelessWidget {
  String? title;
  final VoidCallback press;
  AccountContainer({Key? key, this.title, required this.press,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kYellowDark,
              borderRadius: BorderRadius.circular(30)
        ),
        child: Center(child: Text(title.toString(), style: FontStyleUtilities.f13(fontColor:Colors.black, fontWeight: FWT.semiBold),))
      ),
    );
  }
}
