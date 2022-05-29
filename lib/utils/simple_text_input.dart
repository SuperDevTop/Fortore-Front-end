import 'package:flutter/material.dart';
import 'package:fortore/utils/AppConstants.dart';

class SimpleInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool obsecure;
  const SimpleInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    required this.obsecure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        children: [
          TextField(
            obscureText: obsecure,
            onChanged: onChanged,
            textAlign: TextAlign.right,
            cursorColor: kYellowDark,
            style: const TextStyle(color: kYellowDark),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 1),
                isDense: true,
                hintText: hintText,
                fillColor: kYellowDark,
                hintStyle: const TextStyle(color: kBorderGrey),
                border: InputBorder.none
            ),
          ),
          const Divider(thickness: 1, color: kYellowDark,)
        ],
      ),
    );
  }
}