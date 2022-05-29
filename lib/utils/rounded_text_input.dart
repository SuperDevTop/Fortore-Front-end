import 'package:flutter/material.dart';
import 'package:fortore/utils/AppConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool obsecure;
  final controller = TextEditingController();
  final String widgetName;

  RoundedInputField({
    Key? key,
    required this.hintText,
    required this.widgetName,
    this.icon = Icons.person,
    required this.onChanged,
    required this.obsecure,
  }) : super(key: key);

  Future<void> SetUserInfo()
  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(widgetName == "username")
    {
      if(prefs.getString("SHARED_USERNAME").toString() != "null")
        {
          controller.text = prefs.getString("SHARED_USERNAME").toString();
        }
    }
    else if (widgetName == "password")
    {
      if(prefs.getString("SHARED_PASSWORD").toString() != "null")
        {
          controller.text = prefs.getString("SHARED_PASSWORD").toString();
        }
    }

  }

  @override
  Widget build(BuildContext context) {
    SetUserInfo();
    return TextFieldContainer(
      child: TextField(
        obscureText: obsecure,
        controller: controller,
        onChanged: onChanged,
        textAlign: TextAlign.right,
        cursorColor: kYellowDark,
        style: const TextStyle(color: kYellowDark),
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: kYellowDark,
          hintStyle: const TextStyle(color: kBorderGrey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
