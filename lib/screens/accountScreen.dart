import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fortore/generated/l10n.dart';
import 'package:fortore/screens/mydata.dart';
import 'package:fortore/screens/profileSetting.dart';
import 'package:fortore/screens/transaction.dart';
import 'package:fortore/utils/AppConstants.dart';
import 'package:fortore/utils/font_style_utils.dart';
import 'package:fortore/utils/sized_box.dart';
import 'package:fortore/widgets/itemContainer.dart';
import '../widgets/accountcontainer.dart';
import 'changepassword.dart';
import '../api/loginapi.dart';
import 'investmentMembership.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);
  static const routeName = '/accountscreen';

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isArrowClick = false;
  var interest_wallet;
  var total_invest;
  var total_deposit;
  var total_withdrawal;
  var loyalty_point;
  var userId;
  var show = "true";

  _loadDashboard() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userId = localStorage.getInt('userid');
    var data = {
      'id': userId,
    };

    var res = await CallApi().postData(data, 'home');
    var body = json.decode(res.body);

    setState(() {
      interest_wallet = body['interest_wallet'];
      total_invest = body['total_invest'];
      total_deposit = body['total_deposit'];
      total_withdrawal = body['total_withdrawal'];
      loyalty_point = body['loyalty_point'];
    });
  }

  @override
  Widget build(BuildContext context) {
    if(show == "true"){
      _loadDashboard();
      show = "false";
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.center,
                child: Text(
                  S.of(context).dashboard,
                  style: FontStyleUtilities.f30(
                      fontColor: kYellowDark, fontWeight: FWT.medium),
                )),
            hSizedBox1,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: ItemContainer(
                        title: S.of(context).totalinvest,
                        image: Images.investment_amount,
                        amount: "$total_invest",
                      )
                  ),
                  wSizedBox2,
                  Expanded(
                      child: ItemContainer(
                        title: S.of(context).InterestWalletBalance,
                        image: Images.available_balance,
                        amount: "$interest_wallet",
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: ItemContainer(
                    title: S.of(context).Totalwithdrawal,
                    image: Images.daily_rent,
                    amount: "$total_withdrawal",
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: ItemContainer(
                    title: S.of(context).Loyaltypoint,
                    image: Images.purchase,
                    amount: "$loyalty_point",
                  )),
                  wSizedBox2,
                  Expanded(
                      child: ItemContainer(
                    title: "Shares",
                    image: Images.shares,
                    amount: ("20000"),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: ItemContainer(
                        title: S.of(context).TotalDeposit,
                        image: Images.investment_amount,
                        amount: "$total_deposit",
                      ))
                ],
              ),
            ),
            hSizedBox,
            hSizedBox4,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: kLightBlack, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    hSizedBox1,
                    Row(
                      children: [
                        Expanded(
                          child: AccountContainer(
                            title: S.of(context).myData,
                            press: (){
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(builder: (context) => ProfileSetting())
                              );
                            },
                        )),
                        wSizedBox1,
                        Expanded(
                            child: AccountContainer(
                          title: S.of(context).InterestLog,
                              press: (){
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(builder: (context) => MyData())
                                );
                              },
                        ))
                      ],
                    ),
                    hSizedBox1,
                    Row(
                      children: [
                        Expanded(
                            child: AccountContainer(
                          title: S.of(context).investmentPlan,
                              press: (){
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(builder: (context) => InvestmentMembership())
                                );
                              },
                        )),
                        wSizedBox1,
                        Expanded(
                            child: AccountContainer(
                          title: S.of(context).transactions,
                              press: (){
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(builder: (context) => Transaction())
                                );
                              },
                        ))
                      ],
                    ),
                    hSizedBox1,
                    Row(
                      children: [
                        Expanded(
                            child: AccountContainer(
                          title: S.of(context).changePassword,
                              press: (){
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(builder: (context) => ChangePassword())
                                );
                              },
                        )),
                        wSizedBox1,
                        Expanded(
                            child: AccountContainer(
                          title: S.of(context).Exit,
                              press: (){
                                exit(1);
                              },
                        ))
                      ],
                    ),
                    hSizedBox1,
                    Row(
                      children: [
                        // Expanded(
                        //     child: AccountContainer(
                        //       title: S.of(context).profileSetting,
                        //       press: (){
                        //         Navigator.pushNamed(context, ProfileSetting.routeName);
                        //       },
                        //     )),
                      //   wSizedBox1,
                      //   Expanded(
                      //       child: Visibility(
                      //         visible: false,
                      //         child: AccountContainer(
                      //           title: S.of(context).supportTicket,
                      //           press: (){
                      //
                      //           },
                      //         ),
                      //       ))
                      ],
                    ),
                    hSizedBox1,
                  ],
                ),
              ),
            ),
            hSizedBox5
          ],
        ),
      ),
    );
  }
}