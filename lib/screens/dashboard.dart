import 'package:flutter/material.dart';
import 'package:fortore/navigator/accountNavigator.dart';
import 'package:fortore/navigator/investmentNavigator.dart';
import 'package:fortore/navigator/depositNavigator.dart';
import 'package:fortore/screens/login_screen.dart';
import 'package:fortore/screens/profileSetting.dart';
import 'package:fortore/screens/transaction.dart';
import 'package:fortore/utils/AppConstants.dart';
import 'package:fortore/utils/LanguageChangeNotifierProvider.dart';
import 'package:fortore/utils/SharedPref.dart';
import 'package:fortore/utils/font_style_utils.dart';
import 'package:fortore/utils/sized_box.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../generated/l10n.dart';
import '../utils/navigatorKeys.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var ctime;
  int pageIndex = 4;
  SharedPref sharedPref = SharedPref();

  getPage(int page) {
    switch (page) {
      case 0:
        {
          return const ProfileSetting();
        }
      case 1:
        {
          return const Transaction();
        }
      case 2:
        {
          return  DepositNavigator(navigatorKey:  NavigatorKeys.getKeys().elementAt(2));
        }
      case 3:
        {
          return  InvestmentNavigator(navigatorKey:  NavigatorKeys.getKeys().elementAt(3));
        }
      default:
        {
          return AccountNavigator(navigatorKey:  NavigatorKeys.getKeys().elementAt(4));
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog( //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit App'),
          content: Text('Do you want to exit an App?'),
          actions:[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              //return false when click on "NO"
              child:Text('No'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              //return true when click on "Yes"
              child:Text('Yes'),
            ),
          ],
        ),
      )??false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: InkWell(
            onTap: () async {
              String? langauge = await sharedPref.readSingleString("lang");
              if(langauge == null || langauge == "en"){
                context.read<LanguageChangeNotifierProvider>().changeLocale("ar");
              }else{
                context.read<LanguageChangeNotifierProvider>().changeLocale("en");
              }
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: kYellowDark),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                  child: Text(
                    S.of(context).language,
                style: FontStyleUtilities.f12(
                    fontColor: kWhiteColor, fontWeight: FWT.medium),
              )),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
              child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Image.asset(
                    Images.hamburg,
                    width: 30,
                  )),
            )
          ],
        ),
        endDrawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: kBackgroundColor,
            //other styles
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Drawer(
              backgroundColor: kBackgroundColor,
              child: Container(
                color: kBackgroundColor,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                        decoration: const BoxDecoration(
                          color: kBackgroundColor,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                  Images.hambugClose,
                                  width: 32,
                                ),
                              ),
                            ),
                            Image.asset(
                              Images.logo,
                              width: 200,
                            )
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24),
                      child: Column(
                        children: [
                          const Divider(
                            color: kFontColor,
                          ),
                          ListTile(
                            title: Row(
                              children: [
                                Image.asset(
                                  Images.accountSelect,
                                  width: 24,
                                ),
                                wSizedBox2,
                                Text(
                                  S.of(context).MyData,
                                  style: FontStyleUtilities.f14(
                                      fontColor: kFontColor,
                                      fontWeight: FWT.medium),
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                pageIndex = 0;
                              });
                              Navigator.pop(context);
                            },
                          ),
                          const Divider(
                            color: kFontColor,
                          ),
                          ListTile(
                            title: Row(
                              children: [
                                Image.asset(
                                  Images.transactionSelect,
                                  width: 24,
                                ),
                                wSizedBox2,
                                Text(
                                  S.of(context).Transaction,
                                  style: FontStyleUtilities.f14(
                                      fontColor: kFontColor,
                                      fontWeight: FWT.medium),
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                pageIndex = 1;
                              });
                              Navigator.pop(context);
                            },
                          ),
                          const Divider(
                            color: kFontColor,
                          ),
                          ListTile(
                            title: Row(
                              children: [
                                Image.asset(
                                  Images.depositSelect,
                                  width: 24,
                                ),
                                wSizedBox2,
                                Text(
                                  S.of(context).deposit,
                                  style: FontStyleUtilities.f14(
                                      fontColor: kFontColor,
                                      fontWeight: FWT.medium),
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                pageIndex = 2;
                              });
                              Navigator.pop(context);
                            },
                          ),
                          const Divider(
                            color: kFontColor,
                          ),
                          ListTile(
                            title: Row(
                              children: [
                                Image.asset(
                                  Images.investmentSelect,
                                  width: 24,
                                ),
                                wSizedBox2,
                                Text(
                                  S.of(context).Investment,
                                  style: FontStyleUtilities.f14(
                                      fontColor: kFontColor,
                                      fontWeight: FWT.medium),
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                pageIndex = 3;
                              });
                              Navigator.pop(context);
                            },
                          ),
                          const Divider(
                            color: kFontColor,
                          ),
                          ListTile(
                            title: Row(
                              children: [
                                Image.asset(
                                  Images.myDataSelect,
                                  width: 24,
                                ),
                                wSizedBox2,
                                Text(
                                  S.of(context).dashboard,
                                  style: FontStyleUtilities.f14(
                                      fontColor: kFontColor,
                                      fontWeight: FWT.medium),
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                pageIndex = 4;
                              });
                              Navigator.pop(context);
                            },
                          ),
                          const Divider(
                            color: kFontColor,
                          ),
                          ListTile(
                            title: Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: kYellowDark,
                                ),
                                wSizedBox2,
                                Text(
                                  S.of(context).Signout,
                                  style: FontStyleUtilities.f14(
                                      fontColor: kFontColor,
                                      fontWeight: FWT.medium),
                                ),
                              ],
                            ),
                            onTap: () async {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              await prefs.setString("SHARED_LOGGED", "false");
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                            },
                          ),
                          const Divider(
                            color: kFontColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 75,
            color: Color(0xFF21201E),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  NavBarIcon(
                    text: S.of(context).MyData,
                    icon: pageIndex == 0
                        ? Images.accountSelect
                        : Images.accountUnselect,
                    selected: true,
                    onPressed: () {
                      setState(() {
                        pageIndex = 0;
                      });
                    },
                    defaultColor: pageIndex == 0 ? kYellowDark : kBorderGrey,
                  ),
                  NavBarIcon(
                    text: S.of(context).Transaction,
                    icon: pageIndex == 1
                        ? Images.transactionSelect
                        : Images.transactionUnselect,
                    selected: true,
                    onPressed: () {
                      setState(() {
                        pageIndex = 1;
                      });
                    },
                    defaultColor: pageIndex == 1 ? kYellowDark : kBorderGrey,
                  ),
                  NavBarIcon(
                    text: S.of(context).deposit,
                    icon: pageIndex == 2
                        ? Images.depositSelect
                        : Images.depositUnselect,
                    selected: true,
                    onPressed: () {
                      setState(() {
                        pageIndex = 2;
                      });
                    },
                    defaultColor: pageIndex == 2 ? kYellowDark : kBorderGrey,
                  ),
                  NavBarIcon(
                    text: S.of(context).Investment,
                    icon: pageIndex == 3
                        ? Images.investmentSelect
                        : Images.investmentUnselect,
                    selected: true,
                    onPressed: () {
                      setState(() {
                        pageIndex = 3;
                      });
                    },
                    defaultColor: pageIndex == 3 ? kYellowDark : kBorderGrey,
                  ),
                  NavBarIcon(
                    text: S.of(context).dashboard,
                    icon: pageIndex == 4
                        ? Images.myDataSelect
                        : Images.myDataUnselect,
                    selected: true,
                    onPressed: () {
                      setState(() {
                        pageIndex = 4;
                      });
                    },
                    defaultColor: pageIndex == 4 ? kYellowDark : kBorderGrey,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: getPage(pageIndex),
          ),
        ),
      ),
    );
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      required this.defaultColor})
      : super(key: key);
  final String text;
  final String icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 22,
            height: 22,
          ),
          hSizedBox1,
          Text(
            text,
            style: FontStyleUtilities.f11(
                fontColor: defaultColor, fontWeight: FWT.medium),
          )
        ],
      ),
    );
  }
}
