// ignore_for_file: deprecated_member_use, unnecessary_null_comparison

import 'dart:developer';
import 'dart:ui' as ui;

import 'package:customneon/controllers/preference_controller.dart';
import 'package:customneon/models/user_model.dart';
import 'package:customneon/network_client/network_client.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/show_messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNeonController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isAddingToCart = false.obs;
  RxBool showFonts = false.obs;
  RxBool isRemoteDimmer = true.obs;
  RxBool isOutdoor = true.obs;
  RxBool showNeon = true.obs;

  RxString selectedTextAlign = "center".obs;
  RxString selectedFont = "Fribash".obs;
  RxString neonText = "Hi".obs;
  RxString descriptionText = "".obs;
  RxString totalPrice = "0".obs;

  ///

  Color selectedColor = AppColors.orange;
  Color selectedBackBoardColor = Colors.transparent;
  RxString selectedSize = "S".obs;
  RxString selectedBackBoardStyle = "".obs;
  RxString selectedAdapter = "USA / CANADA 120V".obs;

  onToggle(index) {
    if (index == 0) {
      showNeon.value = true;
    } else {
      showNeon.value = false;
    }
  }

  List<Color> neonColorList = [
    AppColors.orange,
    AppColors.white,
    AppColors.warmWhite,
    AppColors.lemonYellow,
    AppColors.yellow,
    AppColors.red,
    AppColors.pink,
    AppColors.fuchsia,
    AppColors.neonPurple,
    AppColors.purple,
    AppColors.blue,
    AppColors.skyBlue,
    AppColors.green,
  ];
  List<String> neonColorNames = [
    "Orange",
    "White",
    "Warm White",
    "Lemon Yellow",
    "Yellow",
    "Red",
    "Pink",
    "Fuchsia",
    "Neon Purple",
    "Purple",
    "Blue",
    "Sky Blue",
    "Green",
  ];

  ///
  List<String> fontNames = [
    "Aamonoline",
    "Allison",
    "Allura",
    "Architex",
    "Fribash",
    "HighSchool",
    "Magiera",
    "Library",
    "Meow",
    "Monte",
    "Moonless",
    "Neon",
    "Neonderthaw",
    "Playhead",
    "Nickainley",
    "Playlist",
    "Roboto",
    "Sacramento",
    "Stretcher",
    "Style",
    "TwinkleStar",
  ];
  String getColorName({required Color selectedColor}) {
    if (selectedColor == neonColorList[0]) return neonColorNames[0];
    if (selectedColor == neonColorList[1]) return neonColorNames[1];
    if (selectedColor == neonColorList[2]) return neonColorNames[2];
    if (selectedColor == neonColorList[3]) return neonColorNames[3];
    if (selectedColor == neonColorList[4]) return neonColorNames[4];
    if (selectedColor == neonColorList[5]) return neonColorNames[5];
    if (selectedColor == neonColorList[6]) return neonColorNames[6];
    if (selectedColor == neonColorList[7]) return neonColorNames[7];
    if (selectedColor == neonColorList[8]) return neonColorNames[8];
    if (selectedColor == neonColorList[9]) return neonColorNames[9];
    if (selectedColor == neonColorList[10]) return neonColorNames[10];
    if (selectedColor == neonColorList[11]) return neonColorNames[11];
    if (selectedColor == neonColorList[12]) {
      return neonColorNames[12];
    } else {
      return "";
    }
  }

  ///
  ///
  ///
  List<Color> backBoardColorList = [
    Colors.transparent,
    AppColors.white,
    AppColors.black,
    AppColors.silver,
    AppColors.gold,
  ];
  List<String> backBoardColorNames = [
    "Clear",
    "White",
    "Black",
    "Silver",
    "Gold",
  ];

  String getBackBoardColorName({required Color selectedColor}) {
    if (selectedColor == backBoardColorList[0]) return backBoardColorNames[0];
    if (selectedColor == backBoardColorList[1]) return backBoardColorNames[1];
    if (selectedColor == backBoardColorList[2]) return backBoardColorNames[2];
    if (selectedColor == backBoardColorList[3]) return backBoardColorNames[3];
    if (selectedColor == backBoardColorList[4]) {
      return backBoardColorNames[4];
    } else {
      return "";
    }
  }

  ///
  ///
  ///

  List<String> sizeNames = ["S", "M", "L", "XL", "XXL", "Custom"];

  ///
  List<String> backBoardsNames = [
    "Cut to shape",
    "Cut to letter",
    "Invisible Backboard",
    "Cut to rectangle",
    "Stand",
  ];

  ///
  List<String> backBoardsSubTitles = [
    "The backboard will be shaped in line with the letters. Compared to the cut-to-letter backing, it provides greater support to the neon sign while also lending a stylish and modern appearance.",
    "The backboard will closely follow the pattern of the preferred font size and style. It provides a minimalistic appearance, making it perfect for interior decoration.",
    "This backboard is made of metal, more invisible than cut-to-letter. wall mounting only, suitable for small neon signs",
    "The backboard will be cut rectangularly like a frame. It offers the greatest stability for LED neon signs due to its larger backing surface, making it ideal for outdoor use and sturdier framing needs.",
    "Make your sign upright on the floor or desk. Lightweight and portable, you can easily place them anywhere you need them.",
  ];

  ///
  ///
  ///
  List<String> adapterList = [
    "USA / CANADA 120V",
    "UK / IRELAND 230V",
    "EUROPE 230V",
    "AUSTRALIA / NA 230V",
    "JAPAN 100V",
    "OTHER: Plaase specify below.",
  ];

  ///
  ///
  ///
  RxDouble textHeight = 0.0.obs;
  RxDouble textWidth = 0.0.obs;

  ///
  ///

  void calculateTextSize({
    required String text,
    required TextStyle style,
    required BuildContext context,
  }) {
    isLoading.value = true;
    final double textScaleFactor = context != null
        ? MediaQuery.of(context).textScaleFactor
        : WidgetsBinding.instance.window.textScaleFactor;

    final TextDirection textDirection =
        context != null ? Directionality.of(context) : TextDirection.ltr;

    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: textDirection,
      textScaleFactor: textScaleFactor,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    Size size = textPainter.size;

    // Convert logical pixels to physical pixels
    final double devicePixelRatio = ui.window.devicePixelRatio;
    final double widthInches = size.width /
        devicePixelRatio /
        ui.window.physicalSize.width *
        ui.window.physicalSize.width /
        ui.window.devicePixelRatio;
    final double heightInches = size.height /
        devicePixelRatio /
        ui.window.physicalSize.height *
        ui.window.physicalSize.height /
        ui.window.devicePixelRatio;

    ///
    textWidth.value = widthInches;
    textHeight.value = heightInches;

    ///
    ///
    textHeight.value = textHeight.value * 4;
    textWidth.value = textWidth.value * 4.5;

    ///
    getPriceInfo(selectedSize.value);

    isLoading.value = false;
  }

  ///
  ///
  ///
  ///
  ///
  ///
  String getPriceInfo(String size) {
    isLoading.value = true;
    double height, width;
    switch (size) {
      case "S":
        height = textHeight.value;
        width = textWidth.value;
        break;
      case "M":
        height = textHeight.value + 2.5;
        width = textWidth.value + 2.5;
        break;
      case "L":
        height = textHeight.value + 5;
        width = textWidth.value + 5;
        break;
      case "XL":
        height = textHeight.value + 7.5;
        width = textWidth.value + 7.5;
        break;
      case "XXL":
        height = textHeight.value + 10;
        width = textWidth.value + 10;
        break;
      case "Custom":
        height = textHeight.value + 12.5;
        width = textWidth.value + 12.5;
        break;
      default:
        height = textHeight.value;
        width = textWidth.value;
    }

    double value = (height * width) / 6;
    totalPrice.value = value.toStringAsFixed(2);

    isLoading.value = false;

    return totalPrice.value;
  }

  ///
  ///
  ///
  Future<void> addToCart() async {
    isAddingToCart.value = true;
    var data = {
      "cart": [
        {
          "neon": neonText.value,
          "price": totalPrice.value,
          "fontstyle": selectedFont.value,
          "align": selectedTextAlign.value,
          "color": getColorName(selectedColor: selectedColor),
          "size": selectedSize.value,
          "height": textHeight.value.toString(),
          "width": textWidth.value.toString(),
          "backboardcolor":
              getBackBoardColorName(selectedColor: selectedBackBoardColor),
          "backboardstyle": selectedBackBoardStyle.value,
          "location": isOutdoor.value ? "outdoor" : "indoor",
          "adaptertype": selectedAdapter.value,
          "remote": isRemoteDimmer.value ? "yes" : "no",
          "description": descriptionText.value,
        }
      ]
    };

    log(data.toString());

    UserModel? storedUser = await AppPreferencesController.getUser();

    final result = await Get.find<NetworkClient>().post(
      "/user/${storedUser!.sId!}/cart",
      data: data,
      sendUserAuth: true,
    );
    if (result.isSuccess) {
      neonText.value = "";
      totalPrice.value = "";
      selectedFont.value = "Fribash";
      selectedTextAlign.value = "center";
      selectedColor = AppColors.orange;
      selectedSize.value = "S";
      textHeight.value = 0.0;
      textWidth.value = 0.0;
      selectedBackBoardColor = Colors.transparent;
      selectedBackBoardStyle.value = "";
      isOutdoor.value = false;
      selectedAdapter.value = "USA / CANADA 120V";
      isRemoteDimmer.value = true;
      descriptionText.value = "";

      isAddingToCart.value = false;
      isLoading.value = true;
      isLoading.value = false;
    } else {
      showErrorMessage(result.message!);
      isAddingToCart.value = false;
      isLoading.value = false;
    }
  }
}
