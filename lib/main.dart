import 'package:flutter/material.dart';
import 'package:github_training_project/database/db_controller.dart';
import 'package:github_training_project/database/prefs/shared_pref_controller.dart';
import 'package:github_training_project/l10n/app_localizations.dart';
import 'package:github_training_project/provider/language_provider.dart';
import 'package:github_training_project/screens/auth/register_screen.dart';
import 'package:github_training_project/screens/core/launch_screen.dart';
import 'package:github_training_project/screens/core/onboarding_screen.dart';
import 'package:github_training_project/screens/tabs/main_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController()
      .initSharedPreferences();
  await DbController().initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child:
          ChangeNotifierProvider<
            LanguageProvider
          >(
            create: (context) =>
                LanguageProvider(),
            builder: (context, child) =>
                MaterialApp(
                  debugShowCheckedModeBanner:
                      false,

                  // Localizations
                  localizationsDelegates:
                      AppLocalizations
                          .localizationsDelegates,
                  supportedLocales:
                      AppLocalizations
                          .supportedLocales,
                  locale: Locale(
                    Provider.of<LanguageProvider>(
                      context,
                    ).language,
                  ),

                  // Localizations
                  initialRoute: '/launch_screen',
                  routes: {
                    '/launch_screen': (context) =>
                        LaunchScreen(),
                    '/onboarding_screen':
                        (context) =>
                            OnboardingScreen(),
                    '/main_screen': (context) =>
                        MainScreen(),
                    '/register_screen':
                        (context) =>
                            RegisterScreen(),
                  },
                ),
          ),
    );
  }
}
