import 'package:flutter/material.dart';
import 'package:fortore/utils/rounded_button.dart';
import 'package:fortore/utils/simple_text_input.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../generated/l10n.dart';
import '../utils/AppConstants.dart';
import '../utils/font_style_utils.dart';
import '../utils/sized_box.dart';
import '../api/profileapi.dart';
import 'dart:convert';

class ProfileSetting extends StatefulWidget {
  static const routeName = '/post_profile';

  const ProfileSetting({Key? key}) : super(key: key);

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  var firstname;
  var lastname;
  var email;
  var username;
  var mobile;
  var birth;
  var country;
  var address;
  var city;
  var zipcode;
  var firstname1;
  var lastname1;
  var email1;
  var username1;
  var mobile1;
  var birth1;
  var country1;
  var address1;
  var city1;
  var zipcode1;
  var show = "true";

  _update() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userId = localStorage.getInt('userid');

    var data = {
      'firstname': firstname1,
      'lastname': lastname1,
      'email': email1,
      'username': username1,
      'mobile': mobile1,
      'birth': birth1,
      'country': country1,
      'address': address1,
      'city': city1,
      'zipcode': zipcode1,
      'id': userId,
    };

    var res = await CallApi().postData(data, 'update_profile');
    var body = json.decode(res.body);
  }

  _loaddata() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userId = localStorage.getInt('userid');
    var data = {
      'id': userId,
    };

    var res = await CallApi().postData(data, 'post_profile');
    var body = json.decode(res.body);

    setState(() {
      firstname = body['firstname'];
      lastname = body['lastname'];
      email = body['email'];
      username = body['username'];
      mobile = body['mobile'];
      birth = body['birth'];
      country = body['country'];
      address = body['address'];
      city = body['city'];
      zipcode = body['zipcode'];
    });
  }

  @override
  Widget build(BuildContext context) {
    if(show == "true"){
      _loaddata();
      show = "false";
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    S.of(context).profileSetting,
                    style: FontStyleUtilities.f30(
                        fontColor: kYellowDark, fontWeight: FWT.medium),
                  )),
              hSizedBox5,
              // Container(
              //   width: 100.0,
              //   height: 100.0,
              //   decoration: BoxDecoration(
              //     color: const Color(0xff7c94b6),
              //     image: DecorationImage(
              //       image: NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
              //       fit: BoxFit.cover,
              //     ),
              //     borderRadius: BorderRadius.all(Radius.circular(50.0)),
              //     border: Border.all(
              //       color: kYellowDark,
              //       width: 4.0,
              //     ),
              //   ),
              // ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(S.of(context).firstName, style: FontStyleUtilities.f14(fontColor: kYellowDark, fontWeight: FWT.medium),),
              ),
              SimpleInputField(
                hintText: "$firstname",
                obsecure: false,
                onChanged: (value) {
                  //value = 'aaa';
                  firstname1 = value;
                },
              ),
              hSizedBox,
              Align(
                alignment: Alignment.centerRight,
                child: Text(S.of(context).lastName, style: FontStyleUtilities.f14(fontColor: kYellowDark, fontWeight: FWT.medium),),
              ),
              SimpleInputField(
                hintText: "$lastname",
                obsecure: false,
                onChanged: (value) {
                  lastname1 = value;
                },
              ),
              hSizedBox1,
              Align(
                alignment: Alignment.centerRight,
                child: Text(S.of(context).email, style: FontStyleUtilities.f14(fontColor: kYellowDark, fontWeight: FWT.medium),),
              ),
              SimpleInputField(
                hintText: "$email",
                obsecure: false,
                onChanged: (value) {
                  email1 = value;
                },
              ),
              hSizedBox1,
              Align(
                alignment: Alignment.centerRight,
                child: Text(S.of(context).userName, style: FontStyleUtilities.f14(fontColor: kYellowDark, fontWeight: FWT.medium),),
              ),
              SimpleInputField(
                hintText: "$username",
                obsecure: false,
                onChanged: (value) {
                  username1 = value;
                },
              ),

              hSizedBox1,
              Row(
                children: [
                  Expanded(child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(S.of(context).mobile, style: FontStyleUtilities.f14(fontColor: kYellowDark, fontWeight: FWT.medium),),
                      ),
                      SimpleInputField(
                        hintText: "$mobile",
                        obsecure: false,
                        onChanged: (value) {
                          mobile1 = value;
                        },
                      ),
                    ],
                  )),
                  wSizedBox2,
                  Expanded(child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(S.of(context).dateOfBirth, style: FontStyleUtilities.f14(fontColor: kYellowDark, fontWeight: FWT.medium),),
                      ),
                      SimpleInputField(
                        hintText: "$birth",
                        obsecure: false,
                        onChanged: (value) {
                          birth1 = value;
                        },
                      ),
                    ],
                  ))
                ],
              ),
              hSizedBox1,
              Align(
                alignment: Alignment.centerRight,
                child: Text(S.of(context).country, style: FontStyleUtilities.f14(fontColor: kYellowDark, fontWeight: FWT.medium),),
              ),
              SimpleInputField(
                hintText: "$country",
                obsecure: false,
                onChanged: (value) {
                  country1 = value;
                },
              ),
              hSizedBox1,
              Row(
                children: [
                  Expanded(child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(S.of(context).theAddress, style: FontStyleUtilities.f14(fontColor: kYellowDark, fontWeight: FWT.medium),),
                      ),
                      SimpleInputField(
                        hintText: "$address",
                        obsecure: false,
                        onChanged: (value) {
                          address1 = value;
                        },
                      ),
                    ],
                  )),
                  wSizedBox2,
                  Expanded(child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(S.of(context).city, style: FontStyleUtilities.f14(fontColor: kYellowDark, fontWeight: FWT.medium),),
                      ),
                      SimpleInputField(
                        hintText: "$city",
                        obsecure: false,
                        onChanged: (value) {
                          city1 = value;
                        },
                      ),
                    ],
                  ))
                ],
              ),
              hSizedBox1,
              Align(
                alignment: Alignment.centerRight,
                child: Text(S.of(context).zipCode, style: FontStyleUtilities.f14(fontColor: kYellowDark, fontWeight: FWT.medium),),
              ),
              SimpleInputField(
                hintText: "$zipcode",
                obsecure: false,
                onChanged: (value) {
                  zipcode1 = value;
                },
              ),
              hSizedBox3,
              RoundedButton(press: (){
                _update();
              }, text: S.of(context).Update,),
              hSizedBox2,
            ],
          ),
        ),
      ),
    );
  }
}
