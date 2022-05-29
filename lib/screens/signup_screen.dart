import 'dart:convert';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fortore/generated/l10n.dart';
import 'package:fortore/utils/AppConstants.dart';
import 'package:fortore/utils/font_style_utils.dart';
import 'package:fortore/utils/sized_box.dart';
import '../utils/rounded_button.dart';
import '../utils/rounded_text_input.dart';
import '../api/loginapi.dart';
import 'login_screen.dart';
import 'package:flutter/src/material/dropdown.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var firstname = '';
  var lastname = '';
  var country = 'Saudi Arabia';
  var code = '966';
  var mobile = '';
  var city = '';
  var birthday = '';
  var email = '';
  var username = '';
  var password = '';
  var confirmPassword = '';
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

  _signup() async {
    var data = {
      'firstname' : firstname,
      'lastname' : lastname,
      'country' : country,
      'mobile' : mobile,
      'city' : city,
      'birthday' : birthday,
      'email' : email,
      'username' : username,
      'password' : password,
      'confirmPassword' : confirmPassword,
      'randnum' : randnum,
      'otpnumber' : otpnumber,
    };

    var res = await CallApi().postData(data, 'register');
    var body = json.decode(res.body);

    if(body['success']){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ));
    }else{
      _showMsg(body['message']);
      _generateRandom();
    }
  }

  @override
  Widget build(BuildContext context) {
    randnum = random.nextInt(800000);
    randnum += 100000;

    if(country == "Saudi Arabia"){
      code = '966';
    }
    else if(country == "United States"){
      code = '1';
    }
    else if(country == "Australia"){
      code = '61';
    }
    else if(country == "Belgium"){
      code = '32';
    }
    else if(country == "Canada"){
      code = '1';
    }
    else if(country == "China"){
      code = '86';
    }
    else if(country == "France"){
      code = '33';
    }
    else if(country == "Germany"){
      code = '49';
    }
    else if(country == "Kuwait"){
      code = '965';
    }
    else if(country == "Russia"){
      code = '7';
    }
    else if(country == "United Kingdom"){
      code = '44';
    }
    else if(country == "Qatar"){
      code = '974';
    }

    return WillPopScope(
        onWillPop: () async {
          return !await Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
        },
      child: Scaffold(
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
                  hSizedBox1,
                  Text(S.of(context).firstName, style: FontStyleUtilities.f13(fontColor: Colors.white, fontWeight: FWT.regular),),
                  RoundedInputField(
                    hintText: S.of(context).firstName,
                    obsecure: false,
                    widgetName: "",
                    onChanged: (value) {
                      firstname = value;
                    },
                  ),
                  hSizedBox1,
                  Text(S.of(context).lastName, style: FontStyleUtilities.f13(fontColor: Colors.white, fontWeight: FWT.regular),),
                  RoundedInputField(
                    hintText: S.of(context).lastName,
                    obsecure: false,
                    widgetName: "",
                    onChanged: (value) {
                      lastname = value;
                    },
                  ),
                  hSizedBox1,
                  DropdownButton<String>(
                    value: country,
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    iconEnabledColor: Colors.white,
                    elevation: 20,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    underline: Container(
                      height: 0,
                      color: Colors.white,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        country = newValue!;
                      });
                    },
                    items: <String>['Saudi Arabia', 'United States', 'Australia', 'Belgium', 'Canada','China', 'France', 'Germany', 'Kuwait', 'Russia', 'United Kingdom', 'Qatar']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  hSizedBox1,
                  Text(S.of(context).mobile, style: FontStyleUtilities.f13(fontColor: Colors.white, fontWeight: FWT.regular),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              height: 60,
                              width: 100,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 30 , vertical: 5),
                              decoration: BoxDecoration(
                                color: kBlueColor,
                                borderRadius: BorderRadius.circular(0),
                            ),
                            child: Center(
                              child: Text('+' + '$code', style: FontStyleUtilities.f16(fontColor: kYellowDark, fontWeight: FWT.bold),)),
                            ),
                       ),
                        //wSizedBox2,
                        Expanded(
                          child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: S.of(context).mobile,
                            fillColor: kYellowDark,
                            hintStyle: TextStyle(
                              color: Colors.white,
                            )
                          ),
                            onChanged: (value) {
                              mobile = code + value;
                            },
                            style: TextStyle(
                              color: kYellowDark,
                            ),
                        ),
                        ),
                      ],
                    ),
                  ),
                  hSizedBox1,
                  Text(S.of(context).city, style: FontStyleUtilities.f13(fontColor: Colors.white, fontWeight: FWT.regular),),
                  RoundedInputField(
                    hintText: S.of(context).city,
                    obsecure: false,
                    widgetName: "",
                    onChanged: (value) {
                      city = value;
                    },
                  ),
                  hSizedBox1,
                  Text(S.of(context).dateOfBirth, style: FontStyleUtilities.f13(fontColor: Colors.white, fontWeight: FWT.regular),),
                  RoundedInputField(
                    hintText: "dd/mm/yy",
                    obsecure: false,
                    widgetName: "",
                    onChanged: (value) {
                      birthday = value;
                    },
                  ),
                  hSizedBox1,
                  Text(S.of(context).email, style: FontStyleUtilities.f13(fontColor: Colors.white, fontWeight: FWT.regular),),
                  RoundedInputField(
                    hintText: S.of(context).email,
                    obsecure: false,
                    widgetName: "",
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  hSizedBox1,
                  Text(S.of(context).userName, style: FontStyleUtilities.f13(fontColor: Colors.white, fontWeight: FWT.regular),),
                  RoundedInputField(
                    hintText: S.of(context).userName,
                    obsecure: false,
                    widgetName: "",
                    onChanged: (value) {
                      username = value;
                    },
                  ),
                  hSizedBox1,
                  Text(S.of(context).password, style: FontStyleUtilities.f13(fontColor: Colors.white, fontWeight: FWT.regular),),
                  RoundedInputField(
                    hintText: "********",
                    obsecure: true,
                    widgetName: "",
                    onChanged: (value) {
                      password = value;
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
                    hintText: S.of(context).enterCode,
                    obsecure: false,
                    widgetName: "",
                    onChanged: (value) {
                      otpnumber = value;
                    },
                  ),
                  hSizedBox2,
                  RichText(
                    text:  TextSpan(
                      text: S.of(context).Iagreewith + "  ",
                      style:  FontStyleUtilities.f15(fontColor: Colors.white, fontWeight: FWT.regular),
                      children: <TextSpan>[
                        TextSpan(
                            text: S.of(context).privacy,
                            // recognizer: new TapGestureRecognizer()..onTap = () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                            //   builder: (context) => const LoginScreen(),
                            // )),
                            style: FontStyleUtilities.f15(fontColor: kYellowDark, fontWeight: FWT.bold)),
                      ],
                    ),
                  ),
                  RoundedButton(
                      text: S.of(context).SignUp,
                      press: () {
                        _signup();
                      }
                  ),
                  hSizedBox2,
                  RichText(
                    text:  TextSpan(
                      text: S.of(context).dohave,
                      style:  FontStyleUtilities.f18(fontColor: Colors.white, fontWeight: FWT.regular),
                      children: <TextSpan>[
                        TextSpan(
                            text: S.of(context).SignIn,
                            recognizer: new TapGestureRecognizer()..onTap = () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            )),
                            style: FontStyleUtilities.f18(fontColor: kYellowDark, fontWeight: FWT.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}