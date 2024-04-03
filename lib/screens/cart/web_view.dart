import 'package:customneon/controllers/cart_controller.dart';
import 'package:customneon/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';
import 'package:get/get.dart';

import '../homepage/homepage.dart';

class PaymentPage extends StatefulWidget {
  static const routeName = '/payments-page';
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final CartController cartController = Get.put(CartController());
  final GlobalKey<HtmlWidgetState> _htmlWidgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    String returnURL = "http://localhost:63794/dashboard";
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
                      "url = http://localhost:63794//web/stripe/stripe_webview.html?clientSecret=${cartController.clientSecret.value}?returnURL=$returnURL"),
                  HtmlWidget(
                    '<iframe src="http://localhost:63794/web/stripe/stripe_webview.html?clientSecret=${cartController.clientSecret.value}&returnURL=$returnURL"></iframe>',
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
