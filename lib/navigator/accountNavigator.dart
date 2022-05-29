import 'package:flutter/material.dart';
import 'package:fortore/screens/accountScreen.dart';
import 'package:fortore/screens/profileSetting.dart';

class AccountNavigator extends StatefulWidget {
  final navigatorKey;
   AccountNavigator({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  AccountNavigatorState createState() => AccountNavigatorState();
}

class AccountNavigatorState extends State<AccountNavigator> {

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return const AccountScreen();
                case ProfileSetting.routeName:
                  return const ProfileSetting();
                default:
                  return const AccountScreen();
              }
            });
      },
    );
  }
}
