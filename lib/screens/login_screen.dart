import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fortore/generated/l10n.dart';
import 'package:fortore/screens/dashboard.dart';
import 'package:fortore/utils/AppConstants.dart';
import 'package:fortore/utils/font_style_utils.dart';
import 'package:fortore/utils/sized_box.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/rounded_button.dart';
import '../utils/rounded_text_input.dart';
import '../api/loginapi.dart';
import 'signup_screen.dart';
import 'dart:math';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var username = '';
  var password = '';
  var random = Random();
  var randnum = 0;
  var otpnumber = '';

  void _generateRandom(){
    randnum = random.nextInt(800000);

    setState(() {
      randnum += 100000;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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

  _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString("SHARED_USERNAME").toString();
    password = prefs.getString("SHARED_PASSWORD").toString();

    var data = {
      'username' : username,
      'password' : password,
      'randnum' : randnum.toString(),
      'otpnumber' : otpnumber,
    };

    var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body);

    if(body['success']){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("SHARED_LOGGED", "true");
      await prefs.setString("SHARED_USERNAME", username);
      await prefs.setString("SHARED_PASSWORD", password);

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Dashboard(),
      ));

      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setInt('userid', body['id']);
    }else{
      _showMsg(body['message']);
      _generateRandom();
    }
  }

  @override
  Widget build(BuildContext context) {
    randnum = random.nextInt(800000);
    randnum += 100000;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0,16, 24,16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                    child: Image.asset(Images.logo,)),
                Text(S.of(context).welcomeText, style: FontStyleUtilities.f20(fontColor: kYellowDark, fontWeight: FWT.regular),),
                hSizedBox,
                Text(S.of(context).pleaseEnter, style: FontStyleUtilities.f13(fontColor: Colors.white, fontWeight: FWT.regular),),
                hSizedBox4,
                Text(S.of(context).userName, style: FontStyleUtilities.f13(fontColor: Colors.white, fontWeight: FWT.regular),),
                RoundedInputField(
                  hintText: S.of(context).userName,
                  obsecure: false,
                  widgetName: "username",
                  onChanged: (value) async {
                    username = value;
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setString("SHARED_USERNAME", value);
                  },
                ),
                hSizedBox1,
                Text(S.of(context).password, style: FontStyleUtilities.f13(fontColor: Colors.white, fontWeight: FWT.regular),),
                RoundedInputField(
                  hintText: "********",
                  widgetName: "password",
                  obsecure: true,
                  onChanged: (value) async {
                    password = value;
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setString("SHARED_PASSWORD", value);
                  },
                ),
                hSizedBox1,
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 30 , vertical: 5),
                  decoration: BoxDecoration(
                      color: kBlueColor,
                      borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                      child: Text('$randnum', style: FontStyleUtilities.f16(fontColor: kYellowDark, fontWeight: FWT.bold),)),
                ),
                Text(S.of(context).OtpNumber, style: FontStyleUtilities.f13(fontColor: Colors.white, fontWeight: FWT.regular),),
                RoundedInputField(
                  hintText: S.of(context).OtpNumber,
                  obsecure: false,
                  widgetName: "otpnumber",
                  onChanged: (value) {
                    otpnumber = value;
                  },
                ),
                hSizedBox4,
                RoundedButton(
                  text: S.of(context).signIn,
                  press: () {
                    _login();
                  }
                ),
                hSizedBox2,
                RichText(
                  text:  TextSpan(
                    text: S.of(context).donothave + "  ",
                    style:  FontStyleUtilities.f18(fontColor: Colors.white, fontWeight: FWT.regular),
                    children: <TextSpan>[
                      TextSpan(
                          text: S.of(context).SignUp,
                          recognizer: new TapGestureRecognizer()..onTap = () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          )
                      ),                          style: FontStyleUtilities.f18(fontColor: kYellowDark, fontWeight: FWT.bold)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}