import 'package:customneon/controllers/preference_controller.dart';
import 'package:customneon/models/user_model.dart';
import 'package:customneon/screens/auth_view/signin_view.dart';
import 'package:customneon/screens/cart/cart_screen.dart';
import 'package:customneon/screens/footer/faqs.dart';
import 'package:customneon/screens/footer/pages/contact_us.dart';
import 'package:customneon/screens/user_screen/user_screen.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/utills/image_path.dart';
import 'package:customneon/utills/preference_labels.dart';
import 'package:customneon/utills/show_messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

import '../homepage/homepage.dart';

class HeaderDesign extends StatefulWidget {
  const HeaderDesign({Key? key}) : super(key: key);

  @override
  State<HeaderDesign> createState() => _HeaderDesignState();
}

class _HeaderDesignState extends State<HeaderDesign> {
  final GlobalKey _key = GlobalKey();
  bool _isHovering = false;

  bool isLogedIn = false;
  UserModel? storedUser;
  String badgeText = "";
  @override
  void initState() {
    getUser();
    super.initState();
  }

  final AppPreferencesController prefs = Get.find();
  void getUser() async {
    isLogedIn = await prefs.getBool(key: AppPreferencesLabels.isLogedin);
    storedUser = await AppPreferencesController.getUser();
    if (storedUser != null && storedUser!.cart != null) {
      badgeText = storedUser!.cart!.length.toString();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.offAllNamed(HomePage.routeName);
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 8,
              child: Image.asset(
                AppImagePath.logo,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Row(
          //   children: [
          //     Text(
          //       "Design your text".toUpperCase(),
          //       style: AppTextStyle.white2,
          //     ),
          //     SizedBox(
          //       width: 3.w,
          //     ),
          //     Text(
          //       "Get a quote".toUpperCase(),
          //       style: AppTextStyle.white2,
          //     ),
          //     SizedBox(
          //       width: 3.w,
          //     ),
          //     Text(
          //       "Shop".toUpperCase(),
          //       style: AppTextStyle.white2,
          //     ),
          //     SizedBox(
          //       width: 3.w,
          //     ),
          //     Text(
          //       "Business Signs".toUpperCase(),
          //       style: AppTextStyle.white2,
          //     ),
          //     SizedBox(
          //       width: 3.w,
          //     ),
          //     Text(
          //       "Blogs".toUpperCase(),
          //       style: AppTextStyle.white2,
          //     ),
          //     SizedBox(
          //       width: 3.w,
          //     ),
          //     mouserRegionWidget(context, "Support")
          //   ],
          // ),
          ///
          ///
          ///
          Row(
            children: [
              mouserRegionWidget(context, "Support"),
              SizedBox(width: 5.w),
              IconButton(
                onPressed: () async {
                  isLogedIn
                      ? Get.toNamed(UserScreen.routeName)
                      : Get.toNamed(SigninView.routeName);
                },
                icon: const Icon(
                  PhosphorIconsBold.user,
                ),
              ),

              ///
              Badge(
                label: Text(badgeText),
                isLabelVisible: isLogedIn ? true : false,
                child: IconButton(
                  onPressed: () async {
                    bool isLogedIn = await prefs.getBool(
                        key: AppPreferencesLabels.isLogedin);

                    if (isLogedIn) {
                      Get.toNamed(CartScreen.routeName);
                    } else {
                      showErrorMessage("Please login to view cart items");
                      Get.toNamed(SigninView.routeName);
                    }
                  },
                  icon: const Icon(
                    PhosphorIconsBold.shoppingCart,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget mouserRegionWidget(BuildContext context, String text) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovering = true;
        });
        _showPopupMenu(context);
      },
      onExit: (_) {
        setState(() {
          _isHovering = false;
        });
      },
      child: Text(text.toUpperCase(), key: _key, style: AppTextStyle.white2),
    );
  }

  void _showPopupMenu(BuildContext context) async {
    if (!_isHovering) return;

    final RenderBox button =
        _key.currentContext?.findRenderObject() as RenderBox;
    final Offset offset = button.localToGlobal(Offset.zero);

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          offset.dx, offset.dy + 30, offset.dx + 100, offset.dy + 30 + 50),
      items: <PopupMenuEntry>[
        PopupMenuItem(
          value: 'Option 1',
          child: Text(
            'Neon Sign Gallery',
            style: AppTextStyle.white2,
          ),
        ),
        PopupMenuItem(
          value: 'Option 2',
          child: GestureDetector(
              onTap: () {
                Get.toNamed(FAQs.routeName);
              },
              child: Text(
                'FAQ',
                style: AppTextStyle.white2,
              )),
        ),
        PopupMenuItem(
          value: 'Option 3',
          child: GestureDetector(
              onTap: () {
                Get.toNamed(ContactUs.routeName);
              },
              child: Text(
                'Contact us',
                style: AppTextStyle.white2,
              )),
        ),
        PopupMenuItem(
          value: 'Option 3',
          child: Text(
            'Neon Sign Colors',
            style: AppTextStyle.white2,
          ),
        ),
        PopupMenuItem(
          value: 'Option 3',
          child: Text(
            'Backboards',
            style: AppTextStyle.white2,
          ),
        ),
      ],
    );
  }
}
