import 'package:flutter/material.dart';
import 'package:flutter1_project/database/user_db_controller.dart';
import 'package:flutter1_project/l10n/app_localizations.dart';
import 'package:flutter1_project/model/process_response.dart';
import 'package:flutter1_project/provider/language_provider.dart';
import 'package:flutter1_project/screens/tabs/main_screen.dart';
import 'package:flutter1_project/utils/context_extention.dart';
import 'package:flutter1_project/widgets/login_text_field.dart';
import 'package:flutter1_project/widgets/my_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visiblePassword = true;

  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          InkWell(
            onTap: () {
              Future.delayed(Duration(milliseconds: 250), () {
                context.read<LanguageProvider>().changeLanguage();
              });
            },
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: MyText(
                  text: context.watch<LanguageProvider>().language == 'en'
                      ? 'En'
                      : '؏',
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 20.w),
        ],
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Image.asset(
            'images/img_login.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 371.h,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 332.h),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Column(
                      children: [
                        SizedBox(height: 28.h),
                        Row(
                          children: [
                            MyText(
                              text: AppLocalizations.of(context)!.login,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                              width: 28.w,
                              height: 28.h,
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50.h),
                        // Email
                        LoginTextField(
                          controller: _emailTextEditingController,
                          hint: AppLocalizations.of(context)!.email,
                          heightTextField: 59,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 13.h),
                        // Password
                        TextField(
                          controller: _passwordTextEditingController,
                          keyboardType: TextInputType.visiblePassword,
                          minLines: 1,
                          maxLines: 1,
                          obscureText: visiblePassword,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          cursorColor: Colors.orange,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              padding: EdgeInsetsDirectional.only(end: 20.w),
                              onPressed: () => setState(
                                () => visiblePassword = !visiblePassword,
                              ),
                              icon: Icon(
                                visiblePassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 20.h,
                              horizontal: 20.w,
                            ),
                            counterText: "",
                            fillColor: Colors.white,
                            filled: true,
                            hintText: AppLocalizations.of(context)!.password,
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: 'poppins',
                              color: Color(0xFF9C9F9E),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                horizontalTitleGap: 0,
                                value: rememberMe,
                                onChanged: (bool? value) =>
                                    setState(() => rememberMe = value ?? true),
                                title: Text(
                                  AppLocalizations.of(context)!.remember_me,
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                checkColor: Colors.white,
                                activeColor: Color(0xFFE67F1E),
                              ),
                            ),
                            MyText(
                              text: AppLocalizations.of(
                                context,
                              )!.forget_password,
                              fontSize: 14.sp,
                              color: Color(0xFFE67F1E),
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        SizedBox(height: 22.h),
                        ElevatedButton(
                          onPressed: () => _performLogin(),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90),
                            ),
                            minimumSize: Size(double.infinity, 60.h),
                            backgroundColor: Color(0xFFFEC54B),
                            shadowColor: Colors.transparent,
                          ),
                          child: MyText(
                            text: AppLocalizations.of(
                              context,
                            )!.sign_in.toUpperCase(),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.dont_have_an_account),
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                        context,
                        '/register_screen',
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.register,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'poppins',
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _performLogin() {
    if (_checkData()) {
      _login();
    }
  }

  bool _checkData() {
    if (_emailTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(
      title: AppLocalizations.of(context)!.enter_required_data,
      error: true,
    );
    return false;
  }

  void _login() async {
    ProcessResponse processResponse = await UserDbController().login(
      email: _emailTextEditingController.text,
      password: _passwordTextEditingController.text,
      isRememberMe: rememberMe,
      context: context,
    );
    if (processResponse.success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    }
    context.showSnackBar(
      title: processResponse.message,
      error: !processResponse.success,
    );
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      context: context,
      builder: (builder) => BottomSheet(
        onClosing: () {},
        builder: (context) => StatefulBuilder(
          builder: (builder, setState) =>
              Column(mainAxisSize: MainAxisSize.min, children: []),
        ),
      ),
    );
  }
}
