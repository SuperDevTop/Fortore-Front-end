import 'package:flutter/material.dart';
import 'package:fortore/main.dart';
import 'package:mobx/mobx.dart';

import '../utils/AppConstants.dart';

part 'AppStore.g.dart';


abstract class AppStoreBase with Store {
  @observable
  bool isDarkModeOn = false;

  @observable
  bool isLoggedIn = false;

  @observable
  bool isBookedFromDashboard = false;

  @observable
  String mStatus = "all";

  @observable
  String? userEmail;

  @observable
  String? profileImage;

  @observable
  int? userId;

  @observable
  String? firstName;

  @observable
  String? lastName;

  @observable
  String? userRole;

  @observable
  String? userDisplayName;

  @observable
  String? userMobileNumber;

  @observable
  String? userGender;

  @observable
  bool? userTelemedOn;

  @observable
  bool? userProEnabled;

  @observable
  String? userEnableGoogleCal;
  @observable
  String? userDoctorGoogleCal;

  @observable
  String selectedLanguage = defaultLanguage;

  @action
  Future<void> setLoggedIn(bool value) async {
    //setBoolAsync(IS_LOGGED_IN, value);
    isLoggedIn = value;
    return;
  }


  @action
  void setStatus(String aStatus) => mStatus = aStatus;
}
