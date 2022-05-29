import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fortore/generated/l10n.dart';
import 'package:fortore/utils/AppConstants.dart';
import 'package:fortore/utils/font_style_utils.dart';
import 'package:fortore/utils/sized_box.dart';
import 'package:my_fatoorah/my_fatoorah.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/loginapi.dart';

final String mAPIKey = "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL";
final String mAPIKey1 = "iuk7upele4l9S5eJGyHCZZB0vOiRSMabEkULlh_kC7HT-YGUiKSaGNgo_Pw1o23vZ15LCZpPBrPmklCesGXKk-opyr70z8kqvwu3tFGzYEZh48mwVP24SIz08KlEsmuKW6adQaABkDHq8gGeCfeO-dk7KMOy_fd50hLEBALzfXmeX0so0haqYi--NC-JjOmJa1f00hukiGJNjY1bvb6ZJqQGh0R0PZgQKU9T8xcg4ujNzUflozhl7Hy6uWTAcaXCIK02teWnk0v2A99to8k4jNCYWormCzIkLt8qyApeOl4tMAmHkVJO0Z33s2DmzhnsBOv-4Lha0FjlYBV2ZGFPDnAxkfmnSiEVNedzfiuP87TZIM6B6GNYjFE8mRv6rjdiX3G2Z_Y0H51EVPCDqoHXQKCebkqGPCJgvC4IomkklzyfgjX60hHvFW5KRZvh9Z1wiC374_Vxi0Y83STVoYWLAsJHZhyqYAzAEwLe_0zNW6hbkhZt1MrzTnzVOvn9vEzd4aeSZYTo11tZ4eOAdyBQ1pqDej9G6vV-sH50mE6CUj24DOccLCL44ihX4pn0L8My8luh_7IgzFNakO65EiXi561W1jnqmyAAd-vUw9ZbOWCjahJ13YOBNaet_WoLRiee2li8Bix2ygFfrD0p3v9wCCZU8_-S7ocsM1TIxbJxkG2q55zBk-5oRVPF95hb0jss8pxseLvGB7ewWPNxE-vP_8SZzfwmG4ucb_V5pJ2w5z8UZYRQ";

class PaymentPreview extends StatefulWidget {
  static const routeName = '/paymentPreview';
  const PaymentPreview({Key? key}) : super(key: key);

  @override
  State<PaymentPreview> createState() => _PaymentPreviewState();
}

class _PaymentPreviewState extends State<PaymentPreview> {
  String transactionID = "";
  String processingDate = "";
  String paymentStatus = "";
  String paymentAmount = "";
  String paymentGateWay = "";

  _update() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userId = localStorage.getInt('userid');

    var data = {
      'TransactionID': userId,
      'Amount': Get(),
      'Status' : paymentStatus,
      'Gateway' : paymentGateWay,
      'id': userId,
    };

    var res = await CallApi().postData(data, 'depositInsert');
    var body = json.decode(res.body);
  }

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
                    S.of(context).paymentPreview,
                    style: FontStyleUtilities.f30(
                        fontColor: kYellowDark, fontWeight: FWT.medium),
                  )),
              hSizedBox4,
              Image.asset(Images.deposit, width: 100, height: 100),
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
                        const Divider(color: kLightTextColor, thickness: 0.5,),
                        hSizedBox,
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  S.of(context).amount + ": " + Get().toString() + " SAR",
                                  textAlign: TextAlign.center,
                                  style: FontStyleUtilities.f18(
                                    fontColor: Colors.white,
                                    fontWeight: FWT.medium,
                                  ),
                                )
                            ),
                          ],
                        ),
                        hSizedBox,
                        const Divider(color: kLightTextColor, thickness: 0.5,),
                        hSizedBox,
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  S.of(context).charge + ": 0 SAR",
                                  textAlign: TextAlign.center,
                                  style: FontStyleUtilities.f18(
                                    fontColor: Colors.white,
                                    fontWeight: FWT.medium,
                                  ),
                                )
                            ),
                          ],
                        ),
                        hSizedBox,
                        const Divider(color: kLightTextColor, thickness: 0.5,),
                        hSizedBox,
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  S.of(context).payable + ": " + Get().toString() + " SAR",
                                  textAlign: TextAlign.center,
                                  style: FontStyleUtilities.f18(
                                    fontColor: Colors.white,
                                    fontWeight: FWT.medium,
                                  ),
                                )
                            ),
                          ],
                        ),
                        hSizedBox,
                        const Divider(color: kLightTextColor, thickness: 0.5,),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  S.of(context).conversionRate + ": 1 SAR = 1 SAR",
                                  textAlign: TextAlign.center,
                                  style: FontStyleUtilities.f18(
                                    fontColor: Colors.white,
                                    fontWeight: FWT.medium,
                                  ),
                                )
                            ),
                          ],
                        ),
                        hSizedBox,
                        const Divider(color: kLightTextColor, thickness: 0.5,),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  "In SAR: " + Get().toString(),
                                  textAlign: TextAlign.center,
                                  style: FontStyleUtilities.f18(
                                    fontColor: Colors.white,
                                    fontWeight: FWT.medium,
                                  ),
                                )
                            ),
                          ],
                        ),
                        hSizedBox,
                        const Divider(color: kLightTextColor, thickness: 0.5,),
                        hSizedBox,
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
                                      ShowGateway();
                                    },
                                    child: Text(
                                      S.of(context).confirm,
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
                        hSizedBox,
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

  String Get()
  {
    final todo = ModalRoute.of(context)!.settings.arguments;
    return todo.toString();
  }

  Future<void> ShowGateway() async {
     var response = await MyFatoorah.startPayment(
      context: context,
      successChild: const Icon(Icons.abc),
      request: MyfatoorahRequest.live(
        currencyIso: Country.SaudiArabia,
        successUrl: 'https://pub.dev/packages/get',
        errorUrl: 'https://www.google.com/',
        invoiceAmount: double.parse(Get()),
        language: ApiLanguage.English,
        token: mAPIKey1,
      ),
    );

    if(response.isSuccess)
    {
      paymentStatus = response.status.name.toString();
      paymentGateWay = response.paymentId.toString();
      _update();
    }
    else
      {
      }
  }
}