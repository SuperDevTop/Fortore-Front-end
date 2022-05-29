import 'package:flutter/material.dart';
import 'package:fortore/screens/investment.dart';
import 'package:fortore/screens/investmentMembership.dart';

class InvestmentNavigator extends StatefulWidget {
  final navigatorKey;
  InvestmentNavigator({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  InvestmentNavigatorState createState() => InvestmentNavigatorState();
}

class InvestmentNavigatorState extends State<InvestmentNavigator> {

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
                  return const InvestmentMembership();
                case Investment.routeName:
                  return  Investment();
                default:
                  return const InvestmentMembership();
              }
            });
      },
    );
  }
}
