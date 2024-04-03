import 'package:customneon/screens/auth_view/signin_view.dart';
import 'package:customneon/screens/auth_view/signup_view.dart';
import 'package:customneon/screens/cart/cart_screen.dart';
import 'package:customneon/screens/cart/web_view.dart';
import 'package:customneon/screens/footer/faqs.dart';
import 'package:customneon/screens/footer/pages/about_us.dart';
import 'package:customneon/screens/footer/pages/contact_info.dart';
import 'package:customneon/screens/footer/pages/contact_us.dart';
import 'package:customneon/screens/footer/payment_methods.dart';
import 'package:customneon/screens/footer/policies/privacy_policy.dart';
import 'package:customneon/screens/footer/policies/refund_policy.dart';
import 'package:customneon/screens/footer/policies/shipping_policy.dart';
import 'package:customneon/screens/footer/policies/terms_of_service.dart';
import 'package:customneon/screens/footer/track_my_order.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/screens/user_screen/user_screen.dart';
import 'package:get/get.dart';

const dashboardRoute = '/dashboard';

///
///
///
final appRoutes = [
  ///
  GetPage(
    name: dashboardRoute,
    page: () => const HomePage(),
  ),

  ///
  GetPage(
    name: HomePage.routeName,
    page: () => const HomePage(),
    transition: Transition.noTransition,
  ),

  ///
  GetPage(
    name: SigninView.routeName,
    page: () => SigninView(),
  ),

  ///
  GetPage(
    name: SignupView.routeName,
    page: () => SignupView(),
  ),

  ///
  GetPage(
    name: UserScreen.routeName,
    page: () => const UserScreen(),
  ),

  ///
  GetPage(
    name: CartScreen.routeName,
    page: () => const CartScreen(),
  ),

  ///
  GetPage(
    name: TrackMyOrder.routeName,
    page: () => TrackMyOrder(),
  ),

  ///
  GetPage(
    name: ShippingPolicy.routeName,
    page: () => const ShippingPolicy(),
  ),

  ///
  GetPage(
    name: RefundPolicy.routeName,
    page: () => const RefundPolicy(),
  ),

  ///
  GetPage(
    name: PrivacyPolicy.routeName,
    page: () => const PrivacyPolicy(),
  ),

  ///
  GetPage(
    name: TermsOfService.routeName,
    page: () => const TermsOfService(),
  ),

  ///
  GetPage(
    name: FAQs.routeName,
    page: () => const FAQs(),
  ),

  ///
  GetPage(
    name: AboutUs.routeName,
    page: () => const AboutUs(),
  ),

  ///
  GetPage(
    name: ContactUs.routeName,
    page: () => const ContactUs(),
  ),

  ///
  GetPage(
    name: ContactInfo.routeName,
    page: () => const ContactInfo(),
  ),

  ///
  GetPage(
    name: PaymentMethods.routeName,
    page: () => const PaymentMethods(),
  ),

  ///
  GetPage(
    name: PaymentPage.routeName,
    page: () => const PaymentPage(),
  ),
];
