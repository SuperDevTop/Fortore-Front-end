import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:fortore/generated/l10n.dart';
import '../api/interestapi.dart';
import '../api/interestdata.dart';
import 'package:fortore/utils/AppConstants.dart';
import 'package:fortore/utils/font_style_utils.dart';
import 'package:fortore/utils/sized_box.dart';
import 'investmentMembership.dart';
import 'contractViewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class MyData extends StatefulWidget {
  const MyData({Key? key}) : super(key: key);
  static const routeName = '/mydata';

  @override
  State<MyData> createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
  var leftTime;
  var remainingTime;
  final MyInterestLog personServices = MyInterestLog();

  @override
  void initState() {
    super.initState();
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: FutureBuilder(
            future: personServices.fetchDatas(100),
            builder:
                (BuildContext context, AsyncSnapshot<List<InterestData>> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: Text(S.of(context).InterestLog, style: FontStyleUtilities.f24(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                          hSizedBox2,
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, InvestmentMembership.routeName);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              height: 45,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: kYellowDark,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(child: Text(S.of(context).investmentPlan)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Card(
                          color: Colors.black.withOpacity(0.5),
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                var currentPerson = snapshot.data![index];
                                remainingTime = currentPerson.remainingTime;
                                int endTime = DateTime.now().millisecondsSinceEpoch + int.parse(currentPerson.remainingTime) * 1000;
                                CountdownTimerController controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
                                // String seconds = strDigits(myDuration.inSeconds.remainder(60));
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
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(child: Text(S.of(context).plan, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                                            Expanded(child: Text(currentPerson.name + "\nSAR " + currentPerson.amount, textAlign: TextAlign.end, style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),)),
                                          ],
                                        ),
                                        hSizedBox,
                                        const Divider(color: kLightTextColor, thickness: 0.5,),
                                        hSizedBox,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(child: Text(S.of(context).returnData, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                                            Expanded(child: Text(currentPerson.interest +  " SAR every Day for " + "6933" + " Day + Capital", textAlign: TextAlign.end, style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),)),
                                          ],
                                        ),
                                        hSizedBox,
                                        const Divider(color: kLightTextColor, thickness: 0.5,),
                                        hSizedBox,
                                        hSizedBox,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(child: Text(S.of(context).received, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                                            Expanded(child: Text(currentPerson.rewardedDays + " x " + currentPerson.interest + " = " + (double.parse(currentPerson.rewardedDays) * double.parse(currentPerson.interest)).toString() + " SAR", textAlign: TextAlign.end, style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),)),
                                          ],
                                        ),
                                        hSizedBox,
                                        hSizedBox,
                                        const Divider(color: kLightTextColor, thickness: 0.5,),
                                        hSizedBox,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(child: Text(S.of(context).details, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                                            Expanded(child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  width: 90,
                                                  height: 30,
                                                  child: OutlinedButton(
                                                    style: OutlinedButton.styleFrom(
                                                      primary: Colors.white,
                                                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                                                      side: BorderSide(color: kYellowDark, width: 1),
                                                    ),
                                                    onPressed: (){
                                                      _getPath(currentPerson);
                                                    }, child: Text(S.of(context).contract, style: FontStyleUtilities.f12(fontColor: Colors.blue, fontWeight: FWT.regular),),),
                                                ),
                                              ],
                                            )),
                                          ],
                                        ),
                                        hSizedBox,
                                        const Divider(color: kLightTextColor, thickness: 0.5,),
                                        hSizedBox,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(child: Text(S.of(context).nextPayment, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                                            Expanded(child: CountdownTimer(
                                              controller: controller,
                                              onEnd: onEnd,
                                              endTime: endTime,
                                              textStyle: FontStyleUtilities.f13(fontColor: Colors.white, fontWeight: FWT.bold),
                                            ),),
                                            //wSizedBox,
                                            new CircularPercentIndicator(
                                              radius: 35,
                                              lineWidth: 6.0,
                                              percent: 1.0 - int.parse(remainingTime) / (3600 * 24),
                                              center: new Text((100.0 - (int.parse(remainingTime) / (36 * 24))).floor().toString() + "%", style: TextStyle(color: Colors.white),),
                                              progressColor: Colors.green,
                                            ),
                                          ],
                                        ),
                                        hSizedBox,
                                      ],
                                    ),
                                  ),
                                );
                              }
                            ),
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

  Widget buildItem(String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return page;
        }));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        color: Colors.blue,
        width: double.infinity,
        alignment: Alignment.center,
        height: 100,
        child: Text(title, style: TextStyle(fontSize: 36),),
      ),
    );
  }

  Future<String> _getPath(dynamic currentPerson) async{
    String filePath = '';
    final externalDirectory = await getExternalStorageDirectory();
    var pathStr = externalDirectory?.path;

    setState(() {
      filePath = pathStr.toString() + '/';
    });

    String str = '';
    str = filePath + currentPerson.dates.toString() + '.pdf';

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const ContractViewer(),
      settings: RouteSettings(
        arguments: str,
      ),
    ));

    return str;
  }
}
