import 'package:flutter/material.dart';
import 'package:github_training_project/database/user_db_controller.dart';
import 'package:github_training_project/l10n/app_localizations.dart';
import 'package:github_training_project/model/process_response.dart';
import 'package:github_training_project/model/user.dart';
import 'package:github_training_project/utils/context_extention.dart';
import 'package:github_training_project/widgets/login_text_field.dart';
import 'package:github_training_project/widgets/my_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState
    extends State<RegisterScreen> {
  bool visiblePassword = true;

  late TextEditingController
  _firstNameTextEditingController;
  late TextEditingController
  _lastNameTextEditingController;
  late TextEditingController
  _emailTextEditingController;
  late TextEditingController
  _passwordTextEditingController;

  @override
  void initState() {
    super.initState();
    _lastNameTextEditingController =
        TextEditingController();
    _firstNameTextEditingController =
        TextEditingController();
    _emailTextEditingController =
        TextEditingController();
    _passwordTextEditingController =
        TextEditingController();
  }

  @override
  void dispose() {
    _lastNameTextEditingController.dispose();
    _firstNameTextEditingController.dispose();
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
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/img_login.png',
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
                    borderRadius:
                        BorderRadius.only(
                          topLeft:
                              Radius.circular(20),
                          topRight:
                              Radius.circular(20),
                        ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 28.w,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 28.h),
                        Row(
                          children: [
                            MyText(
                              text: AppLocalizations.of(
                                context,
                              )!.create_an_account,
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.w600,
                            ),
                            Spacer(),
                            Container(
                              decoration:
                                  BoxDecoration(
                                    color: Colors
                                        .black,
                                    borderRadius:
                                        BorderRadius.circular(
                                          14.r,
                                        ),
                                  ),
                              width: 28.w,
                              height: 28.h,
                              child: Icon(
                                Icons.close,
                                color:
                                    Colors.white,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.h),
                        Row(
                          children: [
                            Expanded(
                              child: LoginTextField(
                                controller:
                                    _firstNameTextEditingController,
                                hint:
                                    AppLocalizations.of(
                                      context,
                                    )!.first_name,
                                heightTextField:
                                    39,
                                keyboardType:
                                    TextInputType
                                        .text,
                              ),
                            ),
                            SizedBox(width: 19.w),
                            Expanded(
                              child: LoginTextField(
                                controller:
                                    _lastNameTextEditingController,
                                hint:
                                    AppLocalizations.of(
                                      context,
                                    )!.last_name,
                                heightTextField:
                                    39,
                                keyboardType:
                                    TextInputType
                                        .text,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        LoginTextField(
                          controller:
                              _emailTextEditingController,
                          hint:
                              AppLocalizations.of(
                                context,
                              )!.email,
                          heightTextField: 59,
                          keyboardType:
                              TextInputType
                                  .emailAddress,
                        ),
                        SizedBox(height: 13.h),
                        TextField(
                          controller:
                              _passwordTextEditingController,
                          keyboardType:
                              TextInputType
                                  .visiblePassword,
                          minLines: 1,
                          maxLines: 1,
                          obscureText:
                              visiblePassword,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'poppins',
                            fontSize: 15,
                            fontWeight:
                                FontWeight.w400,
                          ),
                          cursorColor:
                              Colors.orange,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              padding:
                                  EdgeInsets.zero,
                              onPressed: () => setState(
                                () => visiblePassword =
                                    !visiblePassword,
                              ),
                              icon: Icon(
                                visiblePassword
                                    ? Icons
                                          .visibility_outlined
                                    : Icons
                                          .visibility_off_outlined,
                              ),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(
                                  vertical: 20.h,
                                  horizontal:
                                      20.w,
                                ),
                            counterText: "",
                            fillColor:
                                Colors.white,
                            filled: true,
                            hintText:
                                AppLocalizations.of(
                                  context,
                                )!.password,
                            hintStyle: TextStyle(
                              fontWeight:
                                  FontWeight.w400,
                              fontSize: 16,
                              fontFamily:
                                  'poppins',
                              color: Color(
                                0xFF9C9F9E,
                              ),
                            ),
                            enabledBorder:
                                OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(
                                        50,
                                      ),
                                  borderSide:
                                      BorderSide(
                                        color: Colors
                                            .orange,
                                        width: 2,
                                      ),
                                ),
                            focusedBorder:
                                OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(
                                        50,
                                      ),
                                  borderSide:
                                      BorderSide(
                                        color: Colors
                                            .orange,
                                        width: 2,
                                      ),
                                ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        MyText(
                          text: AppLocalizations.of(
                            context,
                          )!.by_tapping_sign_up_you_accept_all,
                          fontSize: 14.sp,
                          color: Color(
                            0xFF303030,
                          ),
                        ),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .center,
                          children: [
                            MyText(
                              text:
                                  AppLocalizations.of(
                                    context,
                                  )!.terms,
                              fontSize: 14,
                              color: Color(
                                0xFFFEC54B,
                              ),
                              fontWeight:
                                  FontWeight.bold,
                            ),
                            MyText(
                              text:
                                  AppLocalizations.of(
                                    context,
                                  )!.and,
                              fontSize: 14,
                              color: Color(
                                0xFF303030,
                              ),
                            ),
                            MyText(
                              text:
                                  AppLocalizations.of(
                                    context,
                                  )!.conditions,
                              fontSize: 14,
                              color: Color(
                                0xFFFEC54B,
                              ),
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ],
                        ),
                        SizedBox(height: 23.h),
                        ElevatedButton(
                          onPressed: () =>
                              performRegister(),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                    90,
                                  ),
                            ),
                            minimumSize: Size(
                              double.infinity,
                              60.h,
                            ),
                            backgroundColor:
                                Color(0xFFFEC54B),
                            shadowColor: Colors
                                .transparent,
                          ),
                          child: MyText(
                            text:
                                AppLocalizations.of(
                                      context,
                                    )!
                                    .create_an_account
                                    .toUpperCase(),
                            fontSize: 16,
                            fontWeight:
                                FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(
                        context,
                      )!.already_have_an_account,
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(
                            context,
                            '/login_screen',
                          ),
                      child: Text(
                        AppLocalizations.of(
                          context,
                        )!.login,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight:
                              FontWeight.bold,
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

  void performRegister() {
    if (checkData()) {
      register();
    }
  }

  bool checkData() {
    if (_firstNameTextEditingController
            .text
            .isNotEmpty &&
        _lastNameTextEditingController
            .text
            .isNotEmpty &&
        _emailTextEditingController
            .text
            .isNotEmpty &&
        _passwordTextEditingController
            .text
            .isNotEmpty) {
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          AppLocalizations.of(
            context,
          )!.enter_required_data,
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 3),
        dismissDirection:
            DismissDirection.horizontal,
        backgroundColor: Colors.red,
      ),
    );
    return false;
  }

  void register() async {
    ProcessResponse processResponse =
        await UserDbController().register(
          _user,
          context,
        );
    if (processResponse.success) {
      Navigator.pushNamed(
        context,
        '/login_screen',
      );
      context.showSnackBar(
        title: processResponse.message,
        error: !processResponse.success,
      );
    } else {
      context.showSnackBar(
        title: processResponse.message,
        error: !processResponse.success,
      );
    }
  }

  User get _user {
    var u = User();
    u.fName =
        _firstNameTextEditingController.text;
    u.lName = _lastNameTextEditingController.text;
    u.email = _emailTextEditingController.text;
    u.password =
        _passwordTextEditingController.text;
    return u;
  }
}
