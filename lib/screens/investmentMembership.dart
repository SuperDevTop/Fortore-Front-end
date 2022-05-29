import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/membershipdata.dart';
import '../api/membershipapi.dart';
import '../generated/l10n.dart';
import '../utils/AppConstants.dart';
import '../utils/font_style_utils.dart';
import '../utils/sized_box.dart';
import '../widgets/investmentMembershipWidget.dart';
import '../api/loginapi.dart';
import 'dart:convert';
import 'mydata.dart';
import 'Signature.dart';

class InvestmentMembership extends StatefulWidget {
  static const routeName = '/membership';
  const InvestmentMembership({Key? key}) : super(key: key);

  @override
  State<InvestmentMembership> createState() => _InvestmentMembershipState();
}

class _InvestmentMembershipState extends State<InvestmentMembership> {
  var investamount;
  var membershipcard;
  var investmax;
  var investmin;
  var dates;
  var total_deposit;

  var membershipName;
  var membershipTime;
  var membershipMin;
  var membershipMax;
  var membershipInterest;
  var membershipRepeattime;

  final MembershipGet membershipInfo = MembershipGet();

  _loadDeposit() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userId = localStorage.getInt('userid');
    var data = {
      'id': userId,
    };

    var res = await CallApi().postData(data, 'home');
    var body = json.decode(res.body);

    setState(() {
      total_deposit = body['total_deposit'];
    });
  }

  _membership() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userId = localStorage.getInt('userid');

    var data = {
      'investamount' : investamount.toString(),
      'membershipcard' : membershipcard,
      'dates' : dates,
      'id' : userId,
    };

    var res = await CallApi().postData(data, 'invest');
    var body = json.decode(res.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadDeposit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: membershipInfo.fetchDatas(100),
          builder: (BuildContext context, AsyncSnapshot<List<MembershipInfo>> snapshot) {
            if (snapshot.hasData){
              return Column(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        S.of(context).investmentPlan,
                        style: FontStyleUtilities.f24(
                            fontColor: kYellowDark, fontWeight: FWT.medium),
                      )),
                  hSizedBox1,
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const MyData(),
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 35,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: kYellowDark,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(child: Text(S.of(context).myInvestments)),
                    ),
                  ),
                  hSizedBox1,
                  ListView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      var membershipList = snapshot.data![index];
                      membershipName = membershipList.membershipName;
                      membershipTime = membershipList.membershipTime;
                      membershipMin = membershipList.membershipMin;
                      membershipMax = membershipList.membershipMax;
                      membershipInterest = membershipList.membershipInterest;
                      membershipRepeattime = membershipList.membershipRepeattime;

                      return InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        hSizedBox1,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Image.asset(
                                                  Images.close,
                                                  width: 14,
                                                )),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    GetMembershipText(index),
                                                    style: FontStyleUtilities.f18(
                                                        fontColor: kYellowDark,
                                                        fontWeight: FWT.medium),
                                                  ),
                                                  hSizedBox1,
                                                  Text(
                                                    S.of(context).Confirmtoinveston,
                                                    style: FontStyleUtilities.f14(
                                                        fontColor: kYellowDark,
                                                        fontWeight: FWT.medium),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        hSizedBox2,
                                        const Divider(
                                          color: kFontColor,
                                        ),
                                        hSizedBox2,
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: RichText(
                                            text: TextSpan(
                                              text: S.of(context).invest + ': ',
                                              style: FontStyleUtilities.f13(
                                                  fontColor: kYellowDark,
                                                  fontWeight: FWT.regular),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: GetInvestRangeText(index),
                                                    style: FontStyleUtilities.f13(
                                                        fontColor: kFontColor,
                                                        fontWeight: FWT.medium)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        hSizedBox1,
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: RichText(
                                            text: TextSpan(
                                              text: '% ' + S.of(context).Interest + ': ',
                                              style: FontStyleUtilities.f13(
                                                  fontColor: kYellowDark,
                                                  fontWeight: FWT.regular),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: "0.08333333",
                                                    style: FontStyleUtilities.f13(
                                                        fontColor: kFontColor,
                                                        fontWeight: FWT.medium)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        hSizedBox1,
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            S.of(context).perhour + " , 6935 " + S.of(context).times,
                                            style: FontStyleUtilities.f14(
                                                fontColor: kFontColor,
                                                fontWeight: FWT.medium),
                                          ),
                                        ),
                                        hSizedBox2,
                                        const Divider(
                                          color: kFontColor,
                                        ),
                                        hSizedBox1,
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            S.of(context).SelectWallet,
                                            style: FontStyleUtilities.f14(
                                                fontColor: kYellowDark,
                                                fontWeight: FWT.medium),
                                          ),
                                        ),
                                        hSizedBox1,
                                        Container(
                                          height: 50,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1, color: kFontColor)),
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0, right: 16.0),
                                              child: DropdownButton<String>(
                                                isExpanded: true,
                                                style: FontStyleUtilities.f14(
                                                    fontColor: kFontColor,
                                                    fontWeight: FWT.regular),
                                                hint: Text(
                                                  S.of(context).DepositWallet + " -400000",
                                                  style: FontStyleUtilities.f14(
                                                      fontColor: kFontColor,
                                                      fontWeight: FWT.regular),
                                                ),
                                                icon: const Icon(
                                                  // Add this
                                                  Icons
                                                      .keyboard_arrow_down, // Add this
                                                  color: kYellowDark,
                                                  size: 24, // Add this
                                                ),
                                                underline: Container(
                                                  height: 0,
                                                ),
                                                items: <String>[S.of(context).DepositWallet + ' - 400000', S.of(context).Interest + ' - 3333.2', S.of(context).Checkout]
                                                    .map((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(
                                                      value,
                                                      textAlign: TextAlign.end,
                                                      style: FontStyleUtilities.f14(
                                                          fontColor: kYellowDark,
                                                          fontWeight: FWT.medium),
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (_) {
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        hSizedBox2,
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            S.of(context).InvestAmount,
                                            style: FontStyleUtilities.f14(
                                                fontColor: kYellowDark,
                                                fontWeight: FWT.medium),
                                          ),
                                        ),
                                        hSizedBox1,
                                        Container(
                                          child:TextField(
                                            textAlign: TextAlign.right,
                                            cursorColor: kYellowDark,
                                            style: const TextStyle(color: kYellowDark),
                                            decoration: InputDecoration(
                                              fillColor: kYellowDark,
                                              hintStyle: const TextStyle(color: kBorderGrey),
                                              border: InputBorder.none,
                                            ),
                                            onChanged: (value){
                                              investamount = value;
                                            },
                                          ),
                                          height: 50,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1, color: kFontColor)),
                                        ),
                                        hSizedBox2,
                                        const Divider(
                                          color: kFontColor,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 40,
                                                  margin: const EdgeInsets.symmetric(
                                                      vertical: 10),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: OutlinedButton(
                                                      style: OutlinedButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                        ),
                                                        side: BorderSide(
                                                            width: 1,
                                                            color: kYellowDark),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pushNamed(context, InvestmentMembership.routeName);},
                                                      child: Text(
                                                        S.of(context).NO,
                                                        style: FontStyleUtilities.f14(
                                                            fontColor: kYellowDark,
                                                            fontWeight: FWT.medium),
                                                      )),
                                                ),
                                              ),
                                              wSizedBox2,
                                              Expanded(
                                                child: Container(
                                                  height: 40,
                                                  margin: const EdgeInsets.symmetric(
                                                      vertical: 10),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(30),
                                                    child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            primary: kYellowDark,
                                                            textStyle:
                                                            const TextStyle(
                                                                color:
                                                                kYellowDark,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                        onPressed: () async {
                                                          if(GetMembershipValues(index) == "true"){
                                                            _showMsg("Invalid amount");
                                                          }
                                                          else{
                                                            DateTime now = new DateTime.now();
                                                            dates = now.year.toString() + now.month.toString() + now.day.toString() + now.hour.toString() + now.minute.toString() + now.second.toString();
                                                            membershipcard = GetMembershipText(index);
                                                            GetInvestValues(index);
                                                            _membership();
                                                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                              builder: (context) => const Signature(),
                                                              settings: RouteSettings(
                                                                arguments: '$investmax:$investmin:$investamount:$dates',
                                                              ),
                                                            ));
                                                          }
                                                        },
                                                        child: Text(
                                                          S.of(context).YES,
                                                          style:
                                                          FontStyleUtilities.f14(
                                                              fontColor:
                                                              kLightBlack,
                                                              fontWeight:
                                                              FWT.medium),
                                                        )),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: InvestmentMembershipWidget(
                          memberShipName: membershipName,
                          membershipTime: membershipTime,
                          membershipMin: membershipMin,
                          membershipMax: membershipMax,
                          membershipInterest: membershipInterest,
                          membershipRepeattime: membershipRepeattime,
                        ),
                      );
                    },
                  ),
                ],
              );
            }

            if (snapshot.hasError) {
              return Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 82.0,
                  )
              );
            }

            return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 420.0,
                    ),
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("Loading at the moment, please hold the line.")
                  ],
                ));

          }
        ),
      ),
    );
  }

  String GetMembershipText(int index)
  {
    if (index == 0)  {
      return "GOLDEN MEMBERSHIP";
    }
    else if (index == 1)  {
      return "SILVER MEMBERSHIP";
    }
    else if (index == 2)  {
      return "BLACK MEMBERSHIP";
    }
    else if (index == 3)  {
      return "EATGATE MEMBERSHIP";
    }
    else if (index == 4)  {
      return "STREET9 MEMBERSHIP";
    }
    else {
      return "FORTOREMALL MEMBERSHIP";
    }
  }

  String GetInvestRangeText(int index)
  {
    if (index == 0)  {
      return "500000-499999";
    }
    else if (index == 1)  {
      return "100000-99999";
    }
    else if (index == 2)  {
      return "1000000-999999";
    }
    else if (index == 4)  {
      return "1000000-10000";
    }
    else
    {
      return "1000000-100000";
    }
  }

  String GetMembershipValues(int index) {
    int amount;
    amount = int.parse(investamount);

    if(double.parse(total_deposit) < amount){
      return "true";
    }

     if (index == 0) {
      if (amount > 500000 || amount < 499999) {
        return "true";
      }
      else {
        return "false";
      }
    }
    else if (index == 1) {
      if (amount > 100000 || amount < 99999) {
        return "true";
      }
      else {
        return "false";
      }
    }
    else if (index == 2) {
      if (amount > 1000000 || amount < 999999) {
        return "true";
      }
      else {
        return "false";
      }
    }
    else if (index == 3) {
      if (amount > 1000000 || amount < 100000) {
        return "true";
      }
      else {
        return "false";
      }
    }
    else if (index == 4) {
      if (amount > 1000000 || amount < 10000) {
        return "true";
      }
      else {
        return "false";
      }
    }
    else{
      if (amount > 1000000 || amount < 100000) {
        return "true";
      }
      else {
        return "false";
      }
    }
  }

  void GetInvestValues(int index) {
    if (index == 0) {
      investmax = "500,000.00";
      investmin = "499,999.00";
    }
    else if (index == 1) {
      investmax = "100,000.00";
      investmin = "99,999.00";
    }
    else if (index == 2) {
      investmax = "1,000,000.00";
      investmin = "999,999.00";
    }
    else if (index == 3) {
      investmax = "1,000,000.00";
      investmin = "100,000.00";
    }
    else if (index == 4) {
      investmax = "1,000,000.00";
      investmin = "10,000.00";
    }
    else{
      investmax = "1,000,000.00";
      investmin = "100,000.00";
    }
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
}
