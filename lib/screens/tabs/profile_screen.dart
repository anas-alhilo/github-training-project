import 'package:flutter/material.dart';
import 'package:github_training_project/database/prefs/shared_pref_controller.dart';
import 'package:github_training_project/database/user_db_controller.dart';
import 'package:github_training_project/l10n/app_localizations.dart';
import 'package:github_training_project/model/process_response.dart';
import 'package:github_training_project/model/user.dart';
import 'package:github_training_project/utils/context_extention.dart';
import 'package:github_training_project/widgets/my_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState
    extends State<ProfileScreen> {
  List<String> imagesTrendingDeals = [
    'images/img_home_grid_view1.png',
    'images/img_home_grid_view2.png',
    'images/img_home_grid_view3.png',
    'images/img_home_grid_view4.png',
  ];

  late TextEditingController
  _fNameTextEditingController;
  late TextEditingController
  _lNameTextEditingController;
  late TextEditingController
  _emailTextEditingController;
  late TextEditingController
  _passwordTextEditingController;
  late TextEditingController
  _confirmPasswordTextEditingController;

  void _loadUser() async {
    User? u = await UserDbController()
        .getUserById(
          SharedPrefController().getValue<int>(
            PrefKeys.id.name,
          )!,
        );

    if (u != null) {
      setState(() {
        _originalUser = u!;
        _fNameTextEditingController.text =
            u.fName;
        _lNameTextEditingController.text =
            u.lName;
        _emailTextEditingController.text =
            u.email;
        _passwordTextEditingController.text =
            u.password;
        _confirmPasswordTextEditingController
                .text =
            u.password;
        userId = u.id;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fNameTextEditingController =
        TextEditingController();
    _lNameTextEditingController =
        TextEditingController();
    _emailTextEditingController =
        TextEditingController();
    _passwordTextEditingController =
        TextEditingController();
    _confirmPasswordTextEditingController =
        TextEditingController();
    _loadUser();
  }

  @override
  void dispose() {
    _fNameTextEditingController.dispose();
    _lNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _confirmPasswordTextEditingController
        .dispose();
    super.dispose();
  }

  bool visiblePassword = true;
  int userId = -1;
  late User _originalUser;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32.h),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    width: 90.w,
                    height: 90.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(
                            45.r,
                          ),
                    ),
                    child: Image.asset(
                      'images/me.jpeg',
                      width: 90.w,
                      height: 90.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  PositionedDirectional(
                    bottom: 0,
                    end: 0,
                    child: Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius:
                            BorderRadius.circular(
                              15.r,
                            ),
                      ),
                      child: IconButton(
                        onPressed: () =>
                            _showEditBottonSheet(),
                        icon: Icon(
                          Icons.edit,
                          size: 14.r,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            //Name name
            MyText(
              text: '${user.fName} ${user.lName}',
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 5.h),
            MyText(
              text:
                  'Junior Mobile Apps Developer',
              fontSize: 12,
              color: Color(0xFF7E848D),
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 50.h),
            //////////////////////////////////
            // Email
            Align(
              alignment: AlignmentDirectional
                  .centerStart,
              child: MyText(
                text: AppLocalizations.of(
                  context,
                )!.email_address,
                fontSize: 12.sp,
                color: Color(0xFF7E848D),
              ),
            ),
            TextField(
              controller:
                  _emailTextEditingController,
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
                enabledBorder:
                    UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                focusedBorder:
                    UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
              ),
            ),

            SizedBox(height: 20.h),

            // Password
            Align(
              alignment: AlignmentDirectional
                  .centerStart,
              child: MyText(
                text: AppLocalizations.of(
                  context,
                )!.password,
                fontSize: 12.sp,
                color: Color(0xFF7E848D),
              ),
            ),
            TextField(
              controller:
                  _passwordTextEditingController,
              obscureText: visiblePassword,
              readOnly: true,
              decoration: InputDecoration(
                suffixIcon: IconButton(
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
                prefixIcon: Icon(
                  Icons.lock_outline,
                ),
                enabledBorder:
                    UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                focusedBorder:
                    UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
              ),
            ),

            ////////////////////////////
            SizedBox(height: 20.h),

            ////////////////////////////
            SizedBox(height: 20.h),
            Align(
              alignment: AlignmentDirectional
                  .centerStart,
              child: MyText(
                text: AppLocalizations.of(
                  context,
                )!.birth_date,
                fontSize: 12.sp,
                color: Color(0xFF7E848D),
              ),
            ),
            SizedBox(height: 10.h),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        MyText(
                          text: '12',
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                        SizedBox(height: 5.h),
                        Divider(),
                      ],
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Column(
                      children: [
                        MyText(
                          text: 'July',
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                        SizedBox(height: 5.h),
                        Divider(),
                      ],
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Column(
                      children: [
                        MyText(
                          text: '2004',
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                        SizedBox(height: 5.h),
                        Divider(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditBottonSheet() async {
    bool? result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: const Color(0xFFF3EFF4),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30.r),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(width: 28.w),
                    Spacer(),
                    MyText(
                      text: AppLocalizations.of(
                        context,
                      )!.edit_profile,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    Spacer(),

                    IconButton(
                      onPressed: () =>
                          Navigator.pop(
                            context,
                            false,
                          ),
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.red,
                        size: 28.r,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                // Fist name
                Align(
                  alignment: AlignmentDirectional
                      .centerStart,
                  child: MyText(
                    text: AppLocalizations.of(
                      context,
                    )!.first_name,
                    fontSize: 12.sp,
                    color: const Color(
                      0xFF7E848D,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                TextField(
                  controller:
                      _fNameTextEditingController,
                  decoration: InputDecoration(
                    enabledBorder:
                        OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                                10.r,
                              ),
                        ),
                    focusedBorder:
                        OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                                10.r,
                              ),
                        ),
                  ),
                ),

                SizedBox(height: 10.h),

                // Last name
                Align(
                  alignment: AlignmentDirectional
                      .centerStart,
                  child: MyText(
                    text: AppLocalizations.of(
                      context,
                    )!.last_name,
                    fontSize: 12.sp,
                    color: const Color(
                      0xFF7E848D,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                TextField(
                  controller:
                      _lNameTextEditingController,
                  decoration: InputDecoration(
                    enabledBorder:
                        OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                                10.r,
                              ),
                        ),
                    focusedBorder:
                        OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                                10.r,
                              ),
                        ),
                  ),
                ),

                SizedBox(height: 10.h),

                //email
                Align(
                  alignment: AlignmentDirectional
                      .centerStart,
                  child: MyText(
                    text: AppLocalizations.of(
                      context,
                    )!.email_address,
                    fontSize: 12.sp,
                    color: const Color(
                      0xFF7E848D,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                TextField(
                  controller:
                      _emailTextEditingController,
                  decoration: InputDecoration(
                    enabledBorder:
                        OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                                10.r,
                              ),
                        ),
                    focusedBorder:
                        OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                                10.r,
                              ),
                        ),
                  ),
                ),

                SizedBox(height: 10.h),

                // password
                Align(
                  alignment: AlignmentDirectional
                      .centerStart,
                  child: MyText(
                    text: AppLocalizations.of(
                      context,
                    )!.password,
                    fontSize: 12.sp,
                    color: const Color(
                      0xFF7E848D,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                TextField(
                  controller:
                      _passwordTextEditingController,
                  decoration: InputDecoration(
                    enabledBorder:
                        OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                                10.r,
                              ),
                        ),
                    focusedBorder:
                        OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                                10.r,
                              ),
                        ),
                  ),
                ),

                SizedBox(height: 30.h),
                // update Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                    _loadUser();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      double.infinity,
                      48.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                            10.r,
                          ),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: MyText(
                    text: AppLocalizations.of(
                      context,
                    )!.edit,
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (result ?? false) {
      _updateUser();
    }
  }

  void _updateUser() async {
    ProcessResponse processResponse =
        await UserDbController().updateUser(
          user,
          context,
        );
    context.showSnackBar(
      title: processResponse.message,
      error: !processResponse.success,
    );
  }

  User get user {
    User u = User();
    u.fName = _fNameTextEditingController.text;
    u.lName = _lNameTextEditingController.text;
    u.email = _emailTextEditingController.text;
    u.password =
        _passwordTextEditingController.text;
    u.id = userId;
    return u;
  }
}
