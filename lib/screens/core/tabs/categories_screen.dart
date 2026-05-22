import 'package:flutter/material.dart';
import 'package:flutter1_project/l10n/app_localizations.dart';
import 'package:flutter1_project/model/category.dart';
import 'package:flutter1_project/widgets/my_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _itemSelected = 0;

  List<Category> categories = [
    Category(
      image: "images/categories_images/img_cat1.svg",
      type: 'fruits',
      itemCount: 87,
    ),
    Category(
      image: 'images/categories_images/img_cat2.svg',
      type: 'vegetables',
      itemCount: 87,
    ),
    Category(
      image: 'images/categories_images/img_cat3.svg',
      type: 'mushroom',
      itemCount: 87,
    ),
    Category(
      image: 'images/categories_images/img_cat4.svg',
      type: 'dairy',
      itemCount: 87,
    ),
    Category(
      image: 'images/categories_images/img_cat5.svg',
      type: 'oats',
      itemCount: 87,
    ),
    Category(
      image: 'images/categories_images/img_cat6.svg',
      type: 'bread',
      itemCount: 87,
    ),
    Category(
      image: 'images/categories_images/img_cat7.svg',
      type: 'rice',
      itemCount: 27,
    ),
    Category(
      image: 'images/categories_images/img_cat8.svg',
      type: 'egg',
      itemCount: 120,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFF2F2F2),
      child: GridView.builder(
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 24.w,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => setState(() => _itemSelected = index),
          child: Container(
            margin: EdgeInsetsDirectional.only(
              start: index % 2 == 0 ? 36.w : 0,
              end: index % 2 == 0 ? 0.w : 36,
              top: 14.h,
              bottom: 14.h,
            ),
            width: 138.w,
            height: 138.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 1,
                ),
              ],
              color: _itemSelected == index
                  ? Color(0xFFFEC54B)
                  : Color(0xFFFBFBFB),
              borderRadius: BorderRadius.circular(28.r),
            ),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                SvgPicture.asset(
                  categories[index].image,
                  width: 72.w,
                  height: 72.h,
                  color: _itemSelected == index
                      ? Colors.black
                      : Color(0xFFE67F1E),
                ),
                SizedBox(height: 10.h),
                MyText(
                  text: translateCategory(context, categories[index].type),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: _itemSelected == index
                      ? Colors.black
                      : Color(0xFFE67F1E),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text:
                          AppLocalizations.of(context)!.item +
                          categories[index].itemCount.toString(),
                      fontSize: 12.sp,
                      color: _itemSelected == index
                          ? Colors.black
                          : Color(0xFFE67F1E),
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String translateCategory(BuildContext context, String key) {
    switch (key) {
      case 'fruits':
        return AppLocalizations.of(context)!.fruits;
      case 'vegetables':
        return AppLocalizations.of(context)!.vegetables;
      case 'mushroom':
        return AppLocalizations.of(context)!.mushroom;
      case 'dairy':
        return AppLocalizations.of(context)!.dairy;
      case 'oats':
        return AppLocalizations.of(context)!.oats;
      case 'bread':
        return AppLocalizations.of(context)!.bread;
      case 'rice':
        return AppLocalizations.of(context)!.rice;
      case 'egg':
        return AppLocalizations.of(context)!.egg;
      default:
        return key;
    }
  }
}
