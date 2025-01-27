import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/color_utils.dart';

class CustomTextFieldV2 extends StatelessWidget {
  RxBool stateHandler = true.obs;
  RxBool labela = true.obs;
  String? label;
  TextEditingController? controller;
  Rx<Color>? inactiveColor;
  final String? Function(String?) validator;
  var keyBoardtype;
  bool readOnly;
  bool obscureText;
  var onChanged;
  var onSaved;
  Icon? icon;
  var onTap;
  bool? formatInput;

  CustomTextFieldV2(this.stateHandler, this.labela, this.label, this.controller,
      this.inactiveColor, this.validator,
      {Key? key,
      this.keyBoardtype = TextInputType.text,
      this.readOnly = false,
      this.obscureText = false,
      this.onSaved,
      this.onChanged,
      this.icon,
      this.onTap,
      this.formatInput = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (stateHandler.value == true) {
        if (label == 'PINCODE'.tr) {
          formatInput = true;
        }
        return TextFormField(
            style: TextStyle(color: ColorUtils.WHITE_COLOR_BACKGROUND),
            onTap: () {
              onTap;
            },
            obscureText: obscureText,
            readOnly: readOnly,
            cursorColor: ColorUtils.WHITE_COLOR_BACKGROUND,
            decoration: InputDecoration(
                labelStyle: TextStyle(
                    color: labela.value == false
                        ? ColorUtils.ERROR_RED
                        : ColorUtils.WHITE_COLOR_BACKGROUND),
                focusColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                alignLabelWithHint: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        width: 2, color: ColorUtils.WHITE_COLOR_BACKGROUND)),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.WHITE_COLOR_BACKGROUND),
                  //<-- SEE HERE
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(8),
                ),
                floatingLabelStyle: TextStyle(
                    color: labela.value == true
                        ? ColorUtils.WHITE_COLOR_BACKGROUND
                        : ColorUtils.ERROR_RED),
                isDense: false,
                labelText: label,
                suffixIcon: icon,
                // prefixIcon: Icon(
                //   Icons.phone_iphone,
                //   color: ColorUtilsV2.GREY_DOTTED,
                //   size: TextSizeDynamicUtils.dHeight24,
                // ),
                errorStyle: TextStyle(
                    color: ColorUtils.ERROR_RED,
                    fontSize: TextSizeDynamicUtils.dHeight12,
                    fontWeight: FontWeight.w400)),
            inputFormatters: formatInput == true
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ]
                : <TextInputFormatter>[],
            keyboardType: keyBoardtype,
            // const TextInputType.numberWithOptions(
            //     signed: false, decimal: false),
            controller: controller,
            onChanged: (value) {
              if (label == 'PINCODE'.tr) {
                onChanged(value);
              }
              if (value.isNotEmpty) {
                stateHandler.value = true;
                if (value.length == 10) {
                  inactiveColor!.value = ColorUtils.BRAND_COLOR;
                  // FocusScope.of(context).unfocus();
                  // FocusScope.of(context).requestFocus(FocusNode());
                } else {
                  inactiveColor!.value = ColorUtils.BRAND_COLOR_INACTIVE;
                }
              } else {
                stateHandler.value = false;
              }
            },
            validator: validator);
      } else {
        return TextFormField(
          style: TextStyle(color: ColorUtils.WHITE_COLOR_BACKGROUND),

          onTap: () {
            onTap == null ? () {} : onTap();
          },
          obscureText: obscureText,
          readOnly: readOnly,
          cursorColor: ColorUtils.WHITE_COLOR_BACKGROUND,
          decoration: InputDecoration(
              labelStyle: TextStyle(
                  color: labela.value == false
                      ? ColorUtils.ERROR_RED
                      : ColorUtils.WHITE_COLOR_BACKGROUND),
              focusColor: ColorUtils.WHITE_COLOR_BACKGROUND,
              alignLabelWithHint: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.WHITE_COLOR_BACKGROUND)),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 2, color: ColorUtils.WHITE_COLOR_BACKGROUND),
                //<-- SEE HERE
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 2, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 2, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                borderRadius: BorderRadius.circular(8),
              ),
              isDense: false,
              labelText: label,
              floatingLabelStyle: TextStyle(
                  color: labela.value == false
                      ? ColorUtils.ERROR_RED
                      : ColorUtils.WHITE_COLOR_BACKGROUND),
              suffixIcon: icon,
              // prefixIcon: Icon(
              //   Icons.phone_iphone,
              //   color: ColorUtilsV2.GREY_DOTTED,
              //   size: TextSizeDynamicUtils.dHeight24,
              // ),
              errorStyle: const TextStyle(
                  color: ColorUtils.ERROR_RED,
                  fontSize: 12,
                  fontWeight: FontWeight.w400)),
          inputFormatters: label == 'PINCODE'.tr
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ]
              : <TextInputFormatter>[],

          keyboardType: keyBoardtype,
          // keyboardType:
          // const TextInputType.numberWithOptions(signed: false, decimal: false),
          controller: controller,
          onChanged: (value) {
            if (value.isNotEmpty) {
              stateHandler.value = true;
              if (value.length == 10) {
                inactiveColor!.value = ColorUtils.BRAND_COLOR;
              } else {
                inactiveColor!.value = ColorUtils.BRAND_COLOR_INACTIVE;
              }
            } else {
              stateHandler.value = false;
            }
          },
          validator: validator,
        );
      }
    });
  }
}
