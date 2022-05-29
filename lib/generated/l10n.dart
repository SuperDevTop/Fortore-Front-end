// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Fortore Investment`
  String get appName {
    return Intl.message(
      'Fortore Investment',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Your Welcome`
  String get welcomeText {
    return Intl.message(
      'Your Welcome',
      name: 'welcomeText',
      desc: '',
      args: [],
    );
  }

  /// `Please enter login information`
  String get pleaseEnter {
    return Intl.message(
      'Please enter login information',
      name: 'pleaseEnter',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Code`
  String get enterCode {
    return Intl.message(
      'Enter Code',
      name: 'enterCode',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `For get your password?`
  String get forgotPassword {
    return Intl.message(
      'For get your password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Now`
  String get resetPassword {
    return Intl.message(
      'Reset Now',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't you have account?`
  String get donothave {
    return Intl.message(
      'Don\'t you have an account?',
      name: 'donothave',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registration {
    return Intl.message(
      'Registration',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `The Account`
  String get account {
    return Intl.message(
      'The Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Shares`
  String get shares {
    return Intl.message(
      'Shares',
      name: 'shares',
      desc: '',
      args: [],
    );
  }

  /// `Investment amount`
  String get investmentAmount {
    return Intl.message(
      'Investment amount',
      name: 'investmentAmount',
      desc: '',
      args: [],
    );
  }

  /// `Available balance`
  String get availableBalance {
    return Intl.message(
      'Available balance',
      name: 'availableBalance',
      desc: '',
      args: [],
    );
  }

  /// `Daily rent`
  String get dailyRent {
    return Intl.message(
      'Daily rent',
      name: 'dailyRent',
      desc: '',
      args: [],
    );
  }

  /// `Purchases`
  String get purchases {
    return Intl.message(
      'Purchases',
      name: 'purchases',
      desc: '',
      args: [],
    );
  }

  /// `Deposited return`
  String get depositReturn {
    return Intl.message(
      'Deposited return',
      name: 'depositReturn',
      desc: '',
      args: [],
    );
  }

  /// `My data`
  String get myData {
    return Intl.message(
      'My data',
      name: 'myData',
      desc: '',
      args: [],
    );
  }

  /// `Buy stakes`
  String get buyStakes {
    return Intl.message(
      'Buy stakes',
      name: 'buyStakes',
      desc: '',
      args: [],
    );
  }

  /// `Deposit`
  String get deposit {
    return Intl.message(
      'Deposit',
      name: 'deposit',
      desc: '',
      args: [],
    );
  }

  /// `Transactions`
  String get transactions {
    return Intl.message(
      'Transactions',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }

  /// `Change\npassword`
  String get changePassword {
    return Intl.message(
      'Change\npassword',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Support ticket`
  String get supportTicket {
    return Intl.message(
      'Support ticket',
      name: 'supportTicket',
      desc: '',
      args: [],
    );
  }

  /// `Deposit Wallet Transactions`
  String get depositWalletTransactions {
    return Intl.message(
      'Deposit Wallet Transactions',
      name: 'depositWalletTransactions',
      desc: '',
      args: [],
    );
  }

  /// `Interest Wallet Transactions`
  String get interestWalletTransactions {
    return Intl.message(
      'Interest Wallet Transactions',
      name: 'interestWalletTransactions',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `TRX`
  String get trx {
    return Intl.message(
      'TRX',
      name: 'trx',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Remaining balance`
  String get remainingAmount {
    return Intl.message(
      'Remaining balance',
      name: 'remainingAmount',
      desc: '',
      args: [],
    );
  }

  /// `Interest log`
  String get interestLog {
    return Intl.message(
      'Interest log',
      name: 'interestLog',
      desc: '',
      args: [],
    );
  }

  /// `Investment Plan`
  String get investmentPlan {
    return Intl.message(
      'Investment Plan',
      name: 'investmentPlan',
      desc: '',
      args: [],
    );
  }

  /// `Plan`
  String get plan {
    return Intl.message(
      'Plan',
      name: 'plan',
      desc: '',
      args: [],
    );
  }

  /// `Return`
  String get returnData {
    return Intl.message(
      'Return',
      name: 'returnData',
      desc: '',
      args: [],
    );
  }

  /// `Received`
  String get received {
    return Intl.message(
      'Received',
      name: 'received',
      desc: '',
      args: [],
    );
  }

  /// `Contract`
  String get contract {
    return Intl.message(
      'Contract',
      name: 'contract',
      desc: '',
      args: [],
    );
  }

  /// `Next Payment`
  String get nextPayment {
    return Intl.message(
      'Next Payment',
      name: 'nextPayment',
      desc: '',
      args: [],
    );
  }

  /// `My Investments`
  String get myInvestments {
    return Intl.message(
      'My Investments',
      name: 'myInvestments',
      desc: '',
      args: [],
    );
  }

  /// `Profile Setting`
  String get profileSetting {
    return Intl.message(
      'Profile Setting',
      name: 'profileSetting',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mobile {
    return Intl.message(
      'Mobile',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `The Address`
  String get theAddress {
    return Intl.message(
      'The Address',
      name: 'theAddress',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Zip Code`
  String get zipCode {
    return Intl.message(
      'Zip Code',
      name: 'zipCode',
      desc: '',
      args: [],
    );
  }

  /// `Governorate`
  String get governorate {
    return Intl.message(
      'Governorate',
      name: 'governorate',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'E',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Total invest`
  String get totalinvest {
    return Intl.message(
      'Total Invest',
      name: 'totalinvest',
      desc: '',
      args: [],
    );
  }

  /// `Interest Wallet Balance`
  String get InterestWalletBalance {
    return Intl.message(
      'Interest Wallet Balance',
      name: 'InterestWalletBalance',
      desc: '',
      args: [],
    );
  }

  /// `Interest Wallet Balance`
  String get Totalwithdrawal {
    return Intl.message(
      'Total withdrawal',
      name: 'Totalwithdrawal',
      desc: '',
      args: [],
    );
  }

  /// `Loyalty point`
  String get Loyaltypoint {
    return Intl.message(
      'Loyalty point',
      name: 'Loyaltypoint',
      desc: '',
      args: [],
    );
  }

  /// `Total Deposit`
  String get TotalDeposit {
    return Intl.message(
      'Total Deposit',
      name: 'TotalDeposit',
      desc: '',
      args: [],
    );
  }

  /// `Total Deposit`
  String get InterestLog {
    return Intl.message(
      'Interest Log',
      name: 'InterestLog',
      desc: '',
      args: [],
    );
  }

  String get Exit {
    return Intl.message(
      'Exit',
      name: 'Exit',
      desc: '',
      args: [],
    );
  }

  String get Confirmtoinveston {
    return Intl.message(
      'Confirm to invest on',
      name: 'Confirmtoinveston',
      desc: '',
      args: [],
    );
  }

  String get invest {
    return Intl.message(
      'Invest',
      name: 'invest',
      desc: '',
      args: [],
    );
  }

  String get Interest {
    return Intl.message(
      'Interest',
      name: 'Interest',
      desc: '',
      args: [],
    );
  }

  String get SelectWallet {
    return Intl.message(
      'Select Wallet',
      name: 'SelectWallet',
      desc: '',
      args: [],
    );
  }

  String get DepositWallet {
    return Intl.message(
      'Deposit Wallet',
      name: 'DepositWallet',
      desc: '',
      args: [],
    );
  }

  String get Checkout {
    return Intl.message(
      'Checkout',
      name: 'Checkout',
      desc: '',
      args: [],
    );
  }

  String get InvestAmount {
    return Intl.message(
      'Invest Amount',
      name: 'InvestAmount',
      desc: '',
      args: [],
    );
  }

  String get NO {
    return Intl.message(
      'NO',
      name: 'NO',
      desc: '',
      args: [],
    );
  }

  String get YES {
    return Intl.message(
      'YES',
      name: 'YES',
      desc: '',
      args: [],
    );
  }

  String get Update {
    return Intl.message(
      'Update',
      name: 'Update',
      desc: '',
      args: [],
    );
  }

  String get MyData {
    return Intl.message(
      'My Data',
      name: 'MyData',
      desc: '',
      args: [],
    );
  }

  String get Transaction {
    return Intl.message(
      'Transaction',
      name: 'Transaction',
      desc: '',
      args: [],
    );
  }

  String get Investment {
    return Intl.message(
      'Investment',
      name: 'Investment',
      desc: '',
      args: [],
    );
  }

  String get Signout {
    return Intl.message(
      'Sign out',
      name: 'Signout',
      desc: '',
      args: [],
    );
  }

  String get OtpNumber {
    return Intl.message(
      'Otp Number',
      name: 'OtpNumber',
      desc: '',
      args: [],
    );
  }

  String get SignUp {
    return Intl.message(
      'Sign Up',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  String get SignIn {
    return Intl.message(
      'Sign In',
      name: 'SignIn',
      desc: '',
      args: [],
    );
  }

  String get Confirmpassword {
    return Intl.message(
      'Confirm password',
      name: 'Confirmpassword',
      desc: '',
      args: [],
    );
  }

  String get Iagreewith {
    return Intl.message(
      'I agree with',
      name: 'Iagreewith',
      desc: '',
      args: [],
    );
  }

  String get privacy {
    return Intl.message(
      'Privacy & Policy. Terms & Condition.',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  String get dohave {
    return Intl.message(
      'Do you have an account?',
      name: 'dohave',
      desc: '',
      args: [],
    );
  }

  String get perhour {
    return Intl.message(
      'per 24 hours',
      name: 'perhour',
      desc: '',
      args: [],
    );
  }

  String get times {
    return Intl.message(
      'times',
      name: 'times',
      desc: '',
      args: [],
    );
  }

  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  String get addsign {
    return Intl.message(
      'Add Signature',
      name: 'addsign',
      desc: '',
      args: [],
    );
  }

  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  String get deposithistory {
    return Intl.message(
      'Deposit History',
      name: 'deposithistory',
      desc: '',
      args: [],
    );
  }

  String get limit {
    return Intl.message(
      'Limit',
      name: 'limit',
      desc: '',
      args: [],
    );
  }

  String get charge {
    return Intl.message(
      'Charge',
      name: 'charge',
      desc: '',
      args: [],
    );
  }

  String get paymentby {
    return Intl.message(
      'Payment By MyFatoorah',
      name: 'paymentby',
      desc: '',
      args: [],
    );
  }

  String get enterAmount {
    return Intl.message(
      'Enter Amount :',
      name: 'enterAmount',
      desc: '',
      args: [],
    );
  }

  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  String get paymentPreview {
    return Intl.message(
      'Payment Preview',
      name: 'paymentPreview',
      desc: '',
      args: [],
    );
  }

  String get payable {
    return Intl.message(
      'Payable',
      name: 'payable',
      desc: '',
      args: [],
    );
  }

  String get conversionRate {
    return Intl.message(
      'Conversion Rate',
      name: 'conversionRate',
      desc: '',
      args: [],
    );
  }

  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  String get depositnow {
    return Intl.message(
      'Deposit Now',
      name: 'deposit',
      desc: '',
      args: [],
    );
  }

  String get transactionId {
    return Intl.message(
      'Transaction ID',
      name: 'transactionId',
      desc: '',
      args: [],
    );
  }

  String get gateway {
    return Intl.message(
      'Gateway',
      name: 'gateway',
      desc: '',
      args: [],
    );
  }

  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
