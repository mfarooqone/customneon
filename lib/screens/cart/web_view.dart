import 'package:customneon/controllers/cart_controller.dart';
import 'package:customneon/utills/app_consts.dart';
import 'package:customneon/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';
import 'package:get/get.dart';

import '../homepage/homepage.dart';

class PaymentPage extends StatefulWidget {
  // static const routeName =
  //     '/http://66.42.49.235:3031/stripe/stripe_webview.html';
  static const routeName = '/payments-page';
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final CartController cartController = Get.put(CartController());
  final GlobalKey<HtmlWidgetState> _htmlWidgetKey = GlobalKey();
  late String itemId;
  @override
  void initState() {
    super.initState();
    // Retrieve itemId from arguments
    itemId = ModalRoute.of(context)!.settings.arguments as String;
  }

  ///
  // final String returnURL = AppConsts.returnUrl;
  final String returnURL = AppConsts.returnUrlLocal;
  final String stripeKey = dotenv.env['STRIPE_KEY']!;

  ///
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        Get.offAllNamed(HomePage.routeName);
      },
      child: Obx(() {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (cartController.isLoading.value) ...[
                    const LoadingIndicator()
                  ],
                  Text(
                      "cartController.clientSecret = ${cartController.clientSecret.value}"),
                  Text(
                      "url = ${AppConsts.webUrlLocal}?clientSecret=${cartController.clientSecret.value}&returnURL=$returnURL&stripeKey=$stripeKey&itemId=$itemId"),
                  HtmlWidget(
                    '<iframe src="${AppConsts.webUrlLocal}?clientSecret=${cartController.clientSecret.value}&returnURL=$returnURL&stripeKey=$stripeKey&itemId=$itemId"></iframe>',
                    key: _htmlWidgetKey,
                    factoryBuilder: () => MyWidgetFactory(),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {}
