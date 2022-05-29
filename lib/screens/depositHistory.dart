import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fortore/generated/l10n.dart';
import 'package:fortore/screens/deposit.dart';
import '../api/depositapi.dart';
import '../api/depositdata.dart';
import 'package:fortore/utils/AppConstants.dart';
import 'package:fortore/utils/font_style_utils.dart';
import 'package:fortore/utils/sized_box.dart';

class DepositHistory extends StatefulWidget {
  const DepositHistory({Key? key}) : super(key: key);
  static const routeName = '/depositHistory';

  @override
  State<DepositHistory> createState() => _DepositHistoryState();
}

class _DepositHistoryState extends State<DepositHistory> {
  @override
  void initState() {
    super.initState();
  }

  final DepositHistoryGet deposithistoryget = DepositHistoryGet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: FutureBuilder(
            future: deposithistoryget.fetchDatas(100),
            builder:
                (BuildContext context, AsyncSnapshot<List<DepositData>> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: Text(S.of(context).deposithistory, style: FontStyleUtilities.f24(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                          hSizedBox2,
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => const Deposit(),
                              ));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              height: 45,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: kYellowDark,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(S.of(context).depositnow, style: TextStyle(fontSize: 18),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                var currentPerson = snapshot.data![index];
                                //getPaymentStatus(currentPerson.transactionId);
                                // return DepositWalletWidget();
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: kLightBlack,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        hSizedBox1,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(child: Text(S.of(context).transactionId, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                                            Expanded(child: Text(currentPerson.transactionId, textAlign: TextAlign.end, style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),)),
                                          ],
                                        ),
                                        hSizedBox1,
                                        const Divider(color: kLightTextColor, thickness: 0.5,),
                                        hSizedBox1,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(child: Text(S.of(context).gateway, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                                            Expanded(child: Text(currentPerson.paymentGateWay, textAlign: TextAlign.end, style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),)),
                                          ],
                                        ),
                                        hSizedBox1,
                                        const Divider(color: kLightTextColor, thickness: 0.5,),
                                        hSizedBox1,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(child: Text(S.of(context).amount, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                                            Expanded(child: Text(currentPerson.paymentAmount, textAlign: TextAlign.end, style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),)),
                                          ],
                                        ),
                                        hSizedBox1,
                                        const Divider(color: kLightTextColor, thickness: 0.5,),
                                        hSizedBox1,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(child: Text(S.of(context).status, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                                            Expanded(child: Text(currentPerson.paymentStatus, textAlign: TextAlign.end, style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),)),
                                          ],
                                        ),
                                        hSizedBox1,
                                        const Divider(color: kLightTextColor, thickness: 0.5,),
                                        hSizedBox1,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(child: Text(S.of(context).time, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                                            Expanded(child: Text(currentPerson.processingDate, textAlign: TextAlign.end, style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),)),
                                          ],
                                        ),
                                        hSizedBox,
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
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
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text("Loading at the moment, please hold the line.")
                    ],
                  ));
            },
          ),
        ),
      ),
    );
  }
}
