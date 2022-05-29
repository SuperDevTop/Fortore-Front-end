import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fortore/generated/l10n.dart';
import '../api/http_service.dart';
import '../api/data.dart';
import 'package:fortore/utils/AppConstants.dart';
import 'package:fortore/utils/font_style_utils.dart';
import 'package:fortore/utils/sized_box.dart';
import 'investmentMembership.dart';

class Investment extends StatefulWidget {
  const Investment({Key? key}) : super(key: key);
  static const routeName = '/investment';

  @override
  State<Investment> createState() => _InvestmentState();
}

class _InvestmentState extends State<Investment> {
  @override
  void initState() {
    super.initState();
  }

  final PersonNetworkService personService = PersonNetworkService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: FutureBuilder(
            future: personService.fetchDatas(100),
            builder:
                (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: Text(S.of(context).interestLog, style: FontStyleUtilities.f24(fontColor: kYellowDark, fontWeight: FWT.medium),)),
                          hSizedBox2,
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, InvestmentMembership.routeName);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              height: 35,
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
                                            Text(S.of(context).date, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),),
                                            Text("Mar, 2022 06:40 PM 17", style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),),
                                          ],
                                        ),
                                        hSizedBox,
                                        const Divider(color: kLightTextColor, thickness: 0.5,),
                                        hSizedBox,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(S.of(context).trx, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),),
                                            Text(currentPerson.trx, style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),),
                                          ],
                                        ),
                                        hSizedBox,
                                        const Divider(color: kLightTextColor, thickness: 0.5,),
                                        hSizedBox,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(S.of(context).details, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),),
                                            Text(currentPerson.details, style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),),
                                          ],
                                        ),
                                        hSizedBox,
                                        const Divider(color: kLightTextColor, thickness: 0.5,),
                                        hSizedBox,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(S.of(context).amount, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),),
                                            Text(currentPerson.amount, style: FontStyleUtilities.f13(fontColor: Colors.red, fontWeight: FWT.medium),),
                                          ],
                                        ),
                                        hSizedBox,
                                        const Divider(color: kLightTextColor, thickness: 0.5,),
                                        hSizedBox,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(S.of(context).remainingAmount, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),),
                                            Text("400000 SAR", style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),),
                                          ],
                                        ),
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
                  )
              );
            },
          ),
        ),
      ),
    );
  }
}

