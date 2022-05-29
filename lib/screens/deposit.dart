import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fortore/generated/l10n.dart';
import 'package:fortore/screens/paymentPreview.dart';
import 'package:fortore/utils/AppConstants.dart';
import 'package:fortore/utils/font_style_utils.dart';
import 'package:fortore/utils/sized_box.dart';
import 'depositHistory.dart';

class Deposit extends StatefulWidget {
  static const routeName = '/deposit';
  const Deposit({Key? key}) : super(key: key);

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  var depositAmount;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              hSizedBox2,
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    S.of(context).deposit,
                    style: FontStyleUtilities.f30(
                        fontColor: kYellowDark, fontWeight: FWT.medium),
                  )),
              hSizedBox2,
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const DepositHistory(),
                  ));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 20
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: kYellowDark,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                      child: Text(
                        S.of(context).deposithistory,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                      )
                  ),
                ),
              ),
              hSizedBox2,
              Image.asset(Images.deposit, width: 400, height: 400),
              hSizedBox2,
              Card(
                color: kLightBlack,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                      color: kLightBlack,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  "MyFatoorah",
                                  textAlign: TextAlign.center,
                                  style: FontStyleUtilities.f18(
                                    fontColor: Colors.white,
                                    fontWeight: FWT.medium,
                                  ),
                                )
                            ),
                          ],
                        ),
                        hSizedBox1,
                        const Divider(color: kLightTextColor, thickness: 0.5,),
                        hSizedBox1,
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  S.of(context).limit + " : 100000 - 1000000 SAR",
                                  textAlign: TextAlign.center,
                                  style: FontStyleUtilities.f18(
                                    fontColor: Colors.white,
                                    fontWeight: FWT.medium,
                                  ),
                                )
                            ),
                          ],
                        ),
                        hSizedBox1,
                        const Divider(color: kLightTextColor, thickness: 0.5,),
                        hSizedBox1,
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  S.of(context).charge + " - 0 SAR + 0%",
                                  textAlign: TextAlign.center,
                                  style: FontStyleUtilities.f18(
                                    fontColor: Colors.white,
                                    fontWeight: FWT.medium,
                                  ),
                                )
                            ),
                          ],
                        ),
                        hSizedBox1,
                        const Divider(color: kLightTextColor, thickness: 0.5,),
                        hSizedBox1,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 400,
                                  height: 50,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      primary: Colors.white,
                                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                                      side: BorderSide(color: kYellowDark, width: 1),
                                      backgroundColor: kYellowDark,
                                    ),
                                    onPressed: (){
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
                                                children: <Widget> [
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
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                          children: [
                                                            Text(
                                                              S.of(context).paymentby,
                                                              style: FontStyleUtilities.f18(
                                                                  fontColor: Colors.white,
                                                                  fontWeight: FWT.medium),
                                                            ),
                                                            hSizedBox1,
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Divider(
                                                    color: kFontColor,
                                                  ),
                                                  hSizedBox1,
                                                  Text(
                                                    S.of(context).enterAmount,
                                                    style: FontStyleUtilities.f18(
                                                        fontColor: Colors.white,
                                                        fontWeight: FWT.medium),
                                                  ),
                                                  hSizedBox1,
                                                  Container(
                                                    child:TextField(
                                                      textAlign: TextAlign.right,
                                                      cursorColor: kYellowDark,
                                                      style: const TextStyle(color: kYellowDark),
                                                      decoration: InputDecoration(
                                                        hintText: "0.00",
                                                        fillColor: kYellowDark,
                                                        hintStyle: const TextStyle(
                                                            color: kBorderGrey
                                                        ),
                                                        border: InputBorder.none,
                                                      ),
                                                      onChanged: (value){
                                                        depositAmount = value;
                                                      },
                                                    ),
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 1,
                                                          color: kFontColor
                                                      )
                                                    ),
                                                  ),
                                                  hSizedBox2,
                                                  const Divider(
                                                    color: kFontColor,
                                                  ),
                                                  hSizedBox1,
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
                                                                  Navigator.pop(context);
                                                                },
                                                                child: Text(
                                                                  S.of(context).close,
                                                                  style: FontStyleUtilities.f16(
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
                                                                          color: kYellowDark,
                                                                          fontSize: 15,
                                                                          fontWeight: FontWeight.w500
                                                                      )
                                                                  ),
                                                                  onPressed: () async {
                                                                    if(int.parse(depositAmount) >= 100000 && int.parse(depositAmount) <= 1000000){
                                                                      _sendDepositAmount();
                                                                    }
                                                                    else{
                                                                      _showMsg("Invalid Amount");
                                                                    }
                                                                  },
                                                                  child: Text(
                                                                    S.of(context).next,
                                                                    style: FontStyleUtilities.f16(
                                                                        fontColor: kLightBlack,
                                                                        fontWeight: FWT.medium
                                                                    ),
                                                                  )
                                                                ),
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
                                        }
                                      );
                                    }, child: Text(
                                    S.of(context).deposit,
                                      style: FontStyleUtilities.f18(
                                          fontColor: Colors.black,
                                          fontWeight: FWT.regular
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                        hSizedBox1,
                        const Divider(color: kLightTextColor, thickness: 0.5,),
                        hSizedBox1,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }

  void _sendDepositAmount(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const PaymentPreview(),
      settings: RouteSettings(
        arguments: depositAmount.toString(),
      ),
    ));
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