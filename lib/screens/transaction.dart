import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fortore/generated/l10n.dart';
import '../api/http_service.dart';
import '../api/data.dart';
import 'package:fortore/utils/AppConstants.dart';
import 'package:fortore/utils/font_style_utils.dart';
import 'package:fortore/utils/sized_box.dart';

class Transaction extends StatefulWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  static const routeName = '/transaction';
  Color textColor = Colors.red;

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
                return Column(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        color: Colors.black,
                        height: 60,
                        child: Text(S.of(context).depositWalletTransactions, style: FontStyleUtilities.f24(fontColor: kYellowDark, fontWeight: FWT.medium),)
                    ),

                    Expanded(
                      child: Container(
                        child: Card(
                          color: Colors.black.withOpacity(0.5),
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                var currentPerson = snapshot.data![index];

                                if(currentPerson.trxType == "+"){
                                  textColor = Colors.green;
                                }
                                else{
                                  textColor = Colors.red;
                                }

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
                                            Text(currentPerson.created_at, style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),),
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
                                            Text(currentPerson.amount + " " + currentPerson.trxType, style: FontStyleUtilities.f13(fontColor: textColor, fontWeight: FWT.medium),),
                                          ],
                                        ),
                                        hSizedBox,
                                        const Divider(color: kLightTextColor, thickness: 0.5,),
                                        hSizedBox,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(S.of(context).remainingAmount, style: FontStyleUtilities.f13(fontColor: kYellowDark, fontWeight: FWT.medium),),
                                            Text(currentPerson.remainingBalance + " SAR", style: FontStyleUtilities.f13(fontColor: kLightTextColor, fontWeight: FWT.medium),),
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
                  ));
            },
          ),
        ),
      ),
    );
  }
}
