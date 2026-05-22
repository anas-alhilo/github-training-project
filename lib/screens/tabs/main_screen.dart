import 'package:flutter/material.dart';
import 'package:github_training_project/database/prefs/shared_pref_controller.dart';
import 'package:github_training_project/l10n/app_localizations.dart';
import 'package:github_training_project/model/BnScreen.dart';
import 'package:github_training_project/screens/auth/login_screen.dart';
import 'package:github_training_project/screens/tabs/categories_screen.dart';
import 'package:github_training_project/screens/tabs/favorite_screen.dart';
import 'package:github_training_project/screens/tabs/home_screen.dart';
import 'package:github_training_project/screens/tabs/profile_screen.dart';
import 'package:github_training_project/widgets/my_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() =>
      _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.amber,
  ];
  int _pageSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<BnScreen> screens = [
      BnScreen(screen: HomeScreen()),
      BnScreen(
        screen: CategoriesScreen(),
        title: AppLocalizations.of(
          context,
        )!.categories,
      ),
      BnScreen(
        screen: FavoriteScreen(),
        title: AppLocalizations.of(
          context,
        )!.favorite,
      ),
      BnScreen(
        screen: ProfileScreen(),
        title: AppLocalizations.of(
          context,
        )!.profile,
      ),
    ];
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      extendBodyBehindAppBar:
          screens[_pageSelectedIndex].title ==
              null
          ? true
          : false,
      appBar: AppBar(
        leading: Visibility(
          visible: _pageSelectedIndex != 0,
          child: IconButton(
            onPressed: () => setState(
              () => _pageSelectedIndex = 0,
            ),
            icon: Icon(
              Icons.arrow_back,
              size: 24.r,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: MyText(
          text:
              screens[_pageSelectedIndex].title ??
              "",
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
        ),
        backgroundColor:
            screens[_pageSelectedIndex].title ==
                null
            ? Colors.transparent
            : Color(0xFFF2F2F2),
        elevation:
            screens[_pageSelectedIndex].title ==
                null
            ? 0
            : 0,
        actions: [
          Visibility(
            visible: _pageSelectedIndex == 3,
            child: IconButton(
              onPressed: () {},
              icon: IconButton(
                onPressed: () =>
                    _showAlertDialog(),
                icon: Icon(Icons.logout),
              ),
            ),
          ),
        ],
      ),

      body: screens[_pageSelectedIndex].screen,

      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: GNav(
          rippleColor: Colors.grey.shade800,
          tabBorderRadius: 15,
          tabBorder: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          gap: 8,
          color: Colors.grey.shade800,
          activeColor: Colors.white,
          iconSize: 24,
          onTabChange: (int pageSelected) =>
              setState(
                () => _pageSelectedIndex =
                    pageSelected,
              ),
          tabBackgroundColor:
              colors[_pageSelectedIndex],
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          selectedIndex: _pageSelectedIndex,

          tabs: [
            GButton(
              icon: Icons.home_outlined,
              text: AppLocalizations.of(
                context,
              )!.home,
            ),
            GButton(
              icon: Icons.category_outlined,
              text: AppLocalizations.of(
                context,
              )!.categories,
            ),
            GButton(
              icon:
                  Icons.favorite_border_outlined,
              text: AppLocalizations.of(
                context,
              )!.favorite,
            ),
            GButton(
              icon: Icons.person_outlined,
              text: AppLocalizations.of(
                context,
              )!.profile,
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog() async {
    bool result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppLocalizations.of(
            context,
          )!.logoutConfirmTitle,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'poppins',
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
        content: Text(
          AppLocalizations.of(
            context,
          )!.logoutConfirmMessage,
        ),
        contentTextStyle: TextStyle(
          color: Colors.grey,
          fontFamily: 'poppins',
          fontSize: 14.sp,
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.pop(context, true),
            child: MyText(
              text: AppLocalizations.of(
                context,
              )!.confirm,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: MyText(
              text: AppLocalizations.of(
                context,
              )!.cancel,
              fontSize: 14.sp,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
    if (result) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
      SharedPrefController().clear();
    }
  }
}
