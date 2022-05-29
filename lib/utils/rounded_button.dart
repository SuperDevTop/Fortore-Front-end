import 'package:flutter/material.dart';
import 'package:fortore/utils/AppConstants.dart';


class RoundedButton extends StatelessWidget {
  final String? text;
  final VoidCallback press;
  final Color? color, textColor;
  const RoundedButton({
    Key? key,
    this.text,
    required this.press,
    this.color = kYellowDark,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: newElevatedButton(),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text.toString(),
        style: TextStyle(
            color: textColor,
            fontFamily: "verdana",
            fontWeight: FontWeight.w400,
            fontSize: 14),
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: kYellowDark,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          textStyle: TextStyle(
              color: textColor, fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }
}
