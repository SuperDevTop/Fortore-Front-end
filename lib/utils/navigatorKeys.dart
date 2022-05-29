import 'package:flutter/material.dart';

class NavigatorKeys {
  static final myData = GlobalKey(debugLabel: 'myData');
  static final transaction = GlobalKey(debugLabel: 'transaction');
  static final deposit = GlobalKey(debugLabel: 'deposit');
  static final investment = GlobalKey(debugLabel: 'investment');
  static final account = GlobalKey(debugLabel: 'account');

  static List<GlobalKey> getKeys() => [myData, transaction, deposit, investment, account];
}