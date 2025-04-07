import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/color_utils.dart';

Widget CustomSearchFieldV2(
    {width, height, onpressed, controller, icon, hintText,onchanged}) {
  return Container(
    alignment: Alignment.center,
    width: width,
    height: height,
    margin: const EdgeInsets.only(top: 10, bottom: 10),
    decoration: BoxDecoration(
      border: Border.all(color: ColorUtils.GREY_DOTTED),
      borderRadius: const BorderRadius.all(Radius.circular(5)),
    ),
    child: TextFormField(

      // controller: referralController.searchfiled,
      // focusNode: dashboardController.searchfieldnode,
      cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
      onChanged: onchanged,
      decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusColor: ColorUtils.BRAND_COLOR,
          alignLabelWithHint: true,
          // isDense: true,
          hintText: hintText,
          prefixIcon: GestureDetector(
            onTap: () {},
            child: Container(
              width: 50,
              alignment: Alignment.center,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                  ),
                ],
              ),
            ),
          )),
    ),
  );
}
