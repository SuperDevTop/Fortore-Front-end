import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../generated/l10n.dart';
import '../utils/AppConstants.dart';
import '../utils/font_style_utils.dart';
import '../utils/sized_box.dart';
import '../utils/rounded_button.dart';
import '../utils/rounded_text_input.dart';
import 'accountScreen.dart';
import '../api/loginapi.dart';
import 'dart:convert';

class ChangePassword extends StatefulWidget {

  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var oldPassword;
  var newPassword;
  var confirmPassword;

  _showMsg(msg) { //
    final snackBar = SnackBar(
      backgroundColor: Color(0xFF363f93),
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _change() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userId = localStorage.getInt('userid');

    var data = {
      'oldPassword' : oldPassword,
      'newPassword' : newPassword,
      'confirmPassword' : confirmPassword,
      'id' : userId,
    };

    var res = await CallApi().postData(data, 'changePassword');
    var body = json.decode(res.body);

    if(body['success']){
      Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => AccountScreen())
      );
    }else{
      _showMsg(body['message']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0,16, 24,16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              hSizedBox6,
              hSizedBox4,
              Text(S.of(context).changePassword, style: FontStyleUtilities.f30(fontColor: kYellowDark, fontWeight: FWT.medium),),
              hSizedBox6,
              Text(S.of(context).currentPassword, style: FontStyleUtilities.f13(fontColor: Colors.white, fontWeight: FWT.regular),),
              RoundedInputField(
                hintText: "********",
                obsecure: false,
                widgetName: "",
                onChanged: (value) {
                  oldPassword = value;
                },
              ),
              hSizedBox1,
              Text(S.of(context).newPassword, style: FontStyleUtilities.f13(fontColor: Colors.white, fontWeight: FWT.regular),),
              RoundedInputField(
                hintText: "********",
                obsecure: true,
                widgetName: "",
                onChanged: (value) {
                  newPassword = value;
                },
              ),
              hSizedBox1,
              Text(S.of(context).Confirmpassword, style: FontStyleUtilities.f13(fontColor: Colors.white, fontWeight: FWT.regular),),
              RoundedInputField(
                hintText: "********",
                obsecure: true,
                widgetName: "",
                onChanged: (value) {
                  confirmPassword = value;
                },
              ),
              hSizedBox4,
              RoundedButton(press: (){
                _change();
                Navigator.pushNamed(context, AccountScreen.routeName);
              }, text: S.of(context).changePassword,),
            ],
          ),
        )
      ),

    );
  }
}
