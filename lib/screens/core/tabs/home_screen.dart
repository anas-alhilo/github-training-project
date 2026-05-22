import 'package:flutter/material.dart';
import 'package:flutter1_project/l10n/app_localizations.dart';
import 'package:flutter1_project/model/trending_item.dart';
import 'package:flutter1_project/widgets/my_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  List<String> categoriesIcons = [
    "images/categories_images/img_cat1.svg",
    'images/categories_images/img_cat2.svg',
    'images/categories_images/img_cat3.svg',
    'images/categories_images/img_cat4.svg',
    'images/categories_images/img_cat5.svg',
    'images/categories_images/img_cat6.svg',
  ];
  List<TrendingItem> trendingItems = [
    TrendingItem(
      image: 'images/img_home_grid_view1.png',
      title: 'avocado',
      price: 6.7,
    ),
    TrendingItem(
      image: 'images/img_home_grid_view2.png',
      title: 'broccoli',
      price: 8.7,
    ),
    TrendingItem(
      image: 'images/img_home_grid_view3.png',
      title: 'tomatoes',
      price: 4.9,
    ),
    TrendingItem(
      image: 'images/img_home_grid_view4.png',
      title: 'grapes',
      price: 7.2,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 2, viewportFraction: 0.85);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 63.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: MyText(
                text: AppLocalizations.of(context)!.good_morning,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF5F5F5F),
              ),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Row(
                children: [
                  MyText(
                    text: AppLocalizations.of(context)!.my_name,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  Spacer(),
                  Material(
                    child: Stack(
                      children: [
                        Icon(
                          Icons.notifications,
                          size: 24,
                          color: Color(0xFF384144),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 12.w,
                            height: 12.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xFFFEC54B),
                              border: BoxBorder.all(
                                color: Colors.white,
                                width: 2.w,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.h),
            SizedBox(
              height: 162.h,
              child: PageView(
                reverse: true,
                padEnds: false,
                controller: _pageController,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    margin: EdgeInsetsDirectional.only(start: 10.w, end: 28.w),
                    child: Stack(
                      children: [
                        Image.asset(
                          'images/home_page_view2.jpg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        PositionedDirectional(
                          bottom: 0,
                          start: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: MyText(
                              text: 'Fresh Fruits\n Delivery',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    height: 162.h,
                    width: 283.w,
                    margin: EdgeInsetsDirectional.only(end: 10.w, start: 28.w),

                    child: Stack(
                      children: [
                        Image.asset(
                          'images/home_page_view1.jpg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        PositionedDirectional(
                          bottom: 0,
                          start: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: MyText(
                              text: 'Recomended\n Recipe Today',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Row(
                children: [
                  MyText(
                    text: AppLocalizations.of(context)!.categories,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward, color: Colors.black),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            SizedBox(
              height: 70.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoriesIcons.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsetsDirectional.only(
                    start: index == 0 ? 28.w : 0,
                    end: index == 8 ? 28.w : 10.w,
                  ),
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                    color: Colors.white,
                  ),
                  width: 70.w,
                  height: 70.h,
                  child: SvgPicture.asset(
                    categoriesIcons[index],
                    colorFilter: ColorFilter.mode(
                      Color(0xFF7A1E76),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Row(
                children: [
                  MyText(
                    text: AppLocalizations.of(context)!.trending_deals,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward, color: Colors.black),
                ],
              ),
            ),
            SizedBox(height: 13.h),
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: trendingItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 200.h,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 20.w,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => SizedBox(
                width: 200.w,
                height: 200.h,
                child: Stack(
                  children: [
                    Image.asset(trendingItems[index].image),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 14.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            padding: EdgeInsets.all(0),
                            alignment: Alignment.topLeft,
                            iconSize: 24.r,
                            onPressed: () => setState(
                              () => trendingItems[index].isFavorite =
                                  !trendingItems[index].isFavorite,
                            ),

                            icon: Icon(
                              Icons.favorite,
                              color: trendingItems[index].isFavorite
                                  ? Colors.red
                                  : Colors.white,
                              size: 24.r,
                            ),
                          ),
                          Spacer(),
                          MyText(
                            text: getTranslatedTitle(
                              context,
                              trendingItems[index].title,
                            ),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFF2F2F2),
                          ),
                          SizedBox(height: 6.h),
                          MyText(
                            text: '\$${trendingItems[index].price}',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getTranslatedTitle(BuildContext context, String key) {
    switch (key) {
      case 'avocado':
        return AppLocalizations.of(context)!.avocado;
      case 'broccoli':
        return AppLocalizations.of(context)!.broccoli;
      case 'tomatoes':
        return AppLocalizations.of(context)!.tomatoes;
      case 'grapes':
        return AppLocalizations.of(context)!.grapes;
      default:
        return key;
    }
  }
}
