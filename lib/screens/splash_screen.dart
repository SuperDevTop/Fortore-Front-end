import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fortore/screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/AppConstants.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      if(localStorage.getString("SHARED_LOGGED") == "true")
        {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const Dashboard(),
          ));
        }
      else
        {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                Images.logo,
                height: 180,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
