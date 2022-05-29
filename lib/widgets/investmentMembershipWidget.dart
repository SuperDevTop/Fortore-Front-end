import 'package:flutter/material.dart';
import 'package:fortore/utils/AppConstants.dart';
import 'package:fortore/utils/font_style_utils.dart';
import 'package:fortore/utils/sized_box.dart';

class InvestmentMembershipWidget extends StatelessWidget {
  String? memberShipName;
  String? membershipTime;
  String? membershipMin;
  String? membershipMax;
  String? membershipInterest;
  String? membershipRepeattime;

  InvestmentMembershipWidget({Key? key,
    this.memberShipName,
    this.membershipTime,
    this.membershipMin,
    this.membershipMax,
    this.membershipInterest,
    this.membershipRepeattime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        //color: kLightBlack,
          gradient: memberShipName.toString().contains("GOLDEN")
              ? const LinearGradient(
            colors: [
              Color(0xFFEFC768),
              Color(0xFFC69235),
              Color(0xFFA16408),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
              : memberShipName.toString().contains("SILVER")
              ? const LinearGradient(
            colors: [
              Color(0xFFA8A8A8),
              Color(0xFF898989),
              Color(0xFF6B6B6B),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
              : memberShipName.toString().contains("BLACK")
              ? const LinearGradient(
            colors: [
              Color(0xFF403F3F),
              Color(0xFF2A2929),
              Color(0xFF101010),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
              : const LinearGradient(
            colors: [
              Color(0xFF000000),
              Color(0xFF000000),
              Color(0xFF000000),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
              width: 1,
              color: memberShipName.toString().contains("GOLDEN")
                  ? Colors.transparent
                  : memberShipName.toString().contains("BLACK")
                  ? Colors.transparent
                  : memberShipName.toString().contains("SILVER")
                  ? Colors.transparent
                  : kYellowDark),
          image: DecorationImage(
              image: AssetImage(
                memberShipName.toString().contains("GOLDEN") ||
                    memberShipName.toString().contains("BLACK") ||
                    memberShipName.toString().contains("SILVER")
                    ? Images.background
                    : Images.other,
              ))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(Images.fortoreWhite, width: 100),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      memberShipName.toString(),
                      style: FontStyleUtilities.f18(
                          fontColor: memberShipName
                              .toString()
                              .contains("GOLDEN") ||
                              memberShipName.toString().contains("SILVER")
                              ? kLightBlack
                              : kWhiteColor,
                          fontWeight: FWT.medium),
                    ),
                    hSizedBox1,
                    Container(
                      width: 40,
                      color: memberShipName.toString().contains("GOLDEN") ||
                          memberShipName.toString().contains("SILVER")
                          ? kLightBlack
                          : kYellowDark,
                      height: 2,
                    )
                  ],
                )
              ],
            ),
            hSizedBox2,
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Return " + membershipInterest.toString() + "%",
                  textAlign: TextAlign.end,
                  style: FontStyleUtilities.f12(
                      fontColor: memberShipName.toString().contains("GOLDEN") ||
                          memberShipName.toString().contains("SILVER")
                          ? Colors.black
                          : kWhiteColor,
                      fontWeight: FWT.medium),
                )),
            hSizedBox1,
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  membershipTime.toString() + " hours",
                  textAlign: TextAlign.end,
                  style: FontStyleUtilities.f12(
                      fontColor: memberShipName.toString().contains("GOLDEN") ||
                          memberShipName.toString().contains("SILVER")
                          ? Colors.black
                          : kWhiteColor,
                      fontWeight: FWT.medium),
                )),
            hSizedBox2,
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                          child: Text(
                            "Capial",
                            style: FontStyleUtilities.f12(
                                fontColor: kWhiteColor,
                                fontWeight: FWT.regular),
                          ),
                        ),
                      ),
                      wSizedBox1,
                      Text(
                        "+Total " + (double.parse(membershipInterest
                            .toString()) * double.parse(membershipRepeattime
                            .toString())).toString() + " %",
                        textAlign: TextAlign.end,
                        style: FontStyleUtilities.f12(
                            fontColor: memberShipName
                                .toString()
                                .contains("GOLDEN") ||
                                memberShipName.toString().contains("SILVER")
                                ? Colors.black
                                : kWhiteColor,
                            fontWeight: FWT.medium),
                      )
                    ],
                  ),
                ),
                Text(
                  "For " + membershipRepeattime.toString() + " Day",
                  textAlign: TextAlign.end,
                  style: FontStyleUtilities.f12(
                      fontColor: memberShipName.toString().contains("GOLDEN") ||
                          memberShipName.toString().contains("SILVER")
                          ? Colors.black
                          : kWhiteColor,
                      fontWeight: FWT.medium),
                )
              ],
            ),
            hSizedBox2,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  membershipMax.toString() + "-" + membershipMin.toString(),
                  textAlign: TextAlign.end,
                  style: FontStyleUtilities.f18(
                      fontColor: memberShipName.toString().contains("GOLDEN") ||
                          memberShipName.toString().contains("SILVER")
                          ? Colors.black
                          : kWhiteColor,
                      fontWeight: FWT.medium),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: memberShipName.toString().contains("GOLDEN") ||
                          memberShipName.toString().contains("SILVER")
                          ? Colors.black
                          : kYellowDark),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    child: Text(
                      "Invest Now",
                      style: FontStyleUtilities.f12(
                          fontColor: memberShipName
                              .toString()
                              .contains("GOLDEN") ||
                              memberShipName.toString().contains("SILVER")
                              ? kYellowDark
                              : Colors.black,
                          fontWeight: FWT.regular),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
