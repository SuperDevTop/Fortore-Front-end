import 'package:flutter/material.dart';
import 'package:fortore/screens/deposit.dart';
import 'package:fortore/screens/depositHistory.dart';
import 'package:fortore/screens/paymentPreview.dart';

class DepositNavigator extends StatefulWidget {
  final navigatorKey;
  DepositNavigator({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  DepositNavigatorState createState() => DepositNavigatorState();
}

class DepositNavigatorState extends State<DepositNavigator> {

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
                return const Deposit(
                );
              case DepositHistory.routeName:
                return  DepositHistory();
              case PaymentPreview.routeName:
                return  PaymentPreview();
              default:
                return const Deposit();
            }
          }
        );
      },
    );
  }
}
