import 'package:flutter/material.dart';
import 'package:github_training_project/l10n/app_localizations.dart';
import 'package:github_training_project/widgets/my_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_training_project/l10n/app_localizations.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFBFB),
      body: Material(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center,
          children: [
            SizedBox(height: 123.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 36.w,
              ),
              child: Image.asset(
                'images/img_onboarding.png',
                height: 180.w,
                width: 303.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 132.h),
            MyText(
              text: AppLocalizations.of(
                context,
              )!.fast_and_responsibily,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 14.h),
            MyText(
              text:
                  'Lorem ipsum dolor sit amet, consectetur \n adipiscing elit, sed do eiusmod tempor ',
              fontSize: 14,
            ),
            SizedBox(height: 71.h),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(
                    context,
                    '/register_screen',
                  ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30.r),
                  side: BorderSide.none,
                ),
                shadowColor: Colors.transparent,
                backgroundColor: Colors.black,
                minimumSize: Size(318.w, 60.h),
              ),
              child: MyText(
                text: AppLocalizations.of(
                  context,
                )!.create_an_account,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 18.h),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(
                    context,
                    '/login_screen',
                  ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30.r),
                  side: BorderSide(
                    color: Colors.black,
                    width: 2.w,
                  ),
                ),
                shadowColor: Colors.transparent,
                backgroundColor: Colors.white,
                minimumSize: Size(318.w, 60.h),
              ),
              child: MyText(
                text: AppLocalizations.of(
                  context,
                )!.login,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
