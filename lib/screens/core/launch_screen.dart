import 'package:flutter/material.dart';
import 'package:flutter1_project/database/prefs/shared_pref_controller.dart';
import 'package:flutter1_project/screens/core/onboarding_screen.dart';
import 'package:flutter1_project/screens/tabs/main_screen.dart';
import 'package:flutter1_project/widgets/my_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              SharedPrefController().getValue<bool>(PrefKeys.isLogin.name) ??
                  false
              ? MainScreen()
              : OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFFEC54B),
      child: Column(
        children: [
          SizedBox(height: 365.h),
          Image.asset('images/icon_launch_screen.png'),
          SizedBox(height: 38.h),
          MyText(
            text: 'Fresh Fruits',
            fontSize: 38,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
