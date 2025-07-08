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
  var validator;
  var keyBoardtype;
  bool readOnly;
  bool obscureText;
  var onChanged;
  var onSaved;
  Icon? icon;
  var onTap;
  bool? formatInput;

  CustomTextFieldV2({required this.stateHandler, required this.labela, this.label, this.controller,
      this.inactiveColor,  this.validator,
      Key? key,
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

    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile=width<800?true:false;
    return Obx(() {
      if (stateHandler.value == true) {
        if (label == 'PINCODE'.tr) {
          formatInput = true;
        }
        return TextFormField(
            style: TextStyleUtils.paragraphSmall,
            onTap: () {
              onTap;
            },
            obscureText: obscureText,
            readOnly: readOnly,
            cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
            decoration: InputDecoration(
                hoverColor: Color(0xFFF6F4F4),
                labelStyle: TextStyleUtils.smallGreyTextStyle,

                focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
                alignLabelWithHint: true,
                filled: true,
                fillColor: Color(0xFFF6F4F4), // Added Background Color
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        width: 2, color: ColorUtils.GREY_DOTTED)),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.GREY_DOTTED),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.ERROR_RED),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.ERROR_RED),
                  borderRadius: BorderRadius.circular(8),
                ),
                floatingLabelStyle: TextStyle(
                    color: labela.value == true
                        ? ColorUtils.GREY_COLOR_PLACEHOLDER
                        : ColorUtils.ERROR_RED),
                isDense: false,
                labelText: label,
                prefixIcon: icon,
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
            controller: controller,
            onChanged: (value) {
              if (label == 'PINCODE'.tr) {
                onChanged(value);
              }
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
            validator: validator);
      } else {
        return TextFormField(
          style: TextStyleUtils.paragraphSmall,
          onTap: () {
            onTap == null ? () {} : onTap();
          },
          obscureText: obscureText,
          readOnly: readOnly,
          cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
          decoration: InputDecoration(
              hoverColor: Color(0xFFF6F4F4),
              labelStyle: TextStyleUtils.smallGreyTextStyle,

              focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
              alignLabelWithHint: true,
              filled: true,
              fillColor: Color(0xFFF6F4F4), // Added Background Color
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.GREY_DOTTED)),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 2, color: ColorUtils.GREY_DOTTED),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 2, color: ColorUtils.ERROR_RED),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 2, color: ColorUtils.ERROR_RED),
                borderRadius: BorderRadius.circular(8),
              ),
              isDense: false,
              labelText: label,

              floatingLabelStyle: TextStyle(
                  color: labela.value == false
                      ? ColorUtils.ERROR_RED
                      : ColorUtils.GREY_COLOR_PLACEHOLDER),
              prefixIcon: icon,
              errorStyle: TextStyle(
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
          controller: controller,
          onChanged: (value) {
            if (value.isNotEmpty) {
              stateHandler.value = true;
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


class CustomTextFieldV2WithWhite extends StatelessWidget {
  RxBool stateHandler = true.obs;
  RxBool labela = true.obs;
  String? label;
  TextEditingController? controller;
  Rx<Color>? inactiveColor;
  var validator;
  var keyBoardtype;
  bool readOnly;
  bool obscureText;
  var onChanged;
  var onSaved;
  Icon? icon;
  var onTap;
  bool? formatInput;

  CustomTextFieldV2WithWhite({required this.stateHandler, required this.labela, this.label, this.controller,
    this.inactiveColor,  this.validator,
    Key? key,
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

    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile=width<800?true:false;
    return Obx(() {
      if (stateHandler.value == true) {
        if (label == 'PINCODE'.tr) {
          formatInput = true;
        }
        return TextFormField(
            style: TextStyle(color: ColorUtils.GREY_COLOR_PLACEHOLDER),
            onTap: () {
              onTap;
            },
            obscureText: obscureText,
            readOnly: readOnly,

            cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
            decoration: InputDecoration(
                hoverColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                labelStyle: TextStyleUtils.smallGreyTextStyle,

                focusColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                alignLabelWithHint: true,
                filled: true,
                fillColor: ColorUtils.WHITE_COLOR_BACKGROUND, // Added Background Color
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        width: 2, color: ColorUtils.GREY_DOTTED)),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.GREY_DOTTED),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.ERROR_RED),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.ERROR_RED),
                  borderRadius: BorderRadius.circular(8),
                ),
                floatingLabelStyle: TextStyle(
                    color: labela.value == true
                        ? ColorUtils.GREY_COLOR_PLACEHOLDER
                        : ColorUtils.ERROR_RED),
                isDense: false,
                labelText: label,
                prefixIcon: icon,
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
            controller: controller,
            onChanged: (value) {
              if (label == 'PINCODE'.tr) {
                onChanged(value);
              }
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
            validator: validator);
      } else {
        return TextFormField(
          style: TextStyle(color: ColorUtils.GREY_COLOR_PLACEHOLDER),
          onTap: () {
            onTap == null ? () {} : onTap();
          },
          obscureText: obscureText,
          readOnly: readOnly,
          cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
          decoration: InputDecoration(
              hoverColor: ColorUtils.WHITE_COLOR_BACKGROUND,
              labelStyle: TextStyleUtils.smallGreyTextStyle,

              focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
              alignLabelWithHint: true,
              filled: true,
              fillColor: ColorUtils.WHITE_COLOR_BACKGROUND, // Added Background Color
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.GREY_DOTTED)),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 2, color: ColorUtils.GREY_DOTTED),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 2, color: ColorUtils.ERROR_RED),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 2, color: ColorUtils.ERROR_RED),
                borderRadius: BorderRadius.circular(8),
              ),
              isDense: false,
              labelText: label,

              floatingLabelStyle: TextStyle(
                  color: labela.value == false
                      ? ColorUtils.ERROR_RED
                      : ColorUtils.GREY_COLOR_PLACEHOLDER),
              prefixIcon: icon,
              errorStyle: TextStyle(
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
          controller: controller,
          onChanged: (value) {
            if (value.isNotEmpty) {
              stateHandler.value = true;
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




class CustomPasswordField extends StatelessWidget {
  final RxBool stateHandler;
  final RxBool labela;
  final String? label;
  final TextEditingController? controller;
  final Rx<Color>? inactiveColor;
  final String? Function(String?)? validator;
  final TextInputType? keyBoardtype;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final VoidCallback? onTap;

  final RxBool isObscure = true.obs;

  CustomPasswordField({
    required this.stateHandler,
    required this.labela,
    this.label,
    this.controller,
    this.inactiveColor,
    this.validator,
    Key? key,
    this.keyBoardtype = TextInputType.visiblePassword,
    this.onSaved,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        style: TextStyle(color: ColorUtils.BRAND_COLOR),
        controller: controller,
        obscureText: isObscure.value,
        keyboardType: keyBoardtype,

        readOnly: false,
        cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
        onTap: onTap,
        decoration: InputDecoration(
          hoverColor: ColorUtils.WHITE_COLOR_BACKGROUND,
          labelStyle: TextStyleUtils.smallGreyTextStyle,
          filled: true,
          fillColor: ColorUtils.WHITE_COLOR_BACKGROUND,
          focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
          alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 2, color: ColorUtils.GREY_DOTTED),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: ColorUtils.GREY_DOTTED),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: ColorUtils.ERROR_RED),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: ColorUtils.ERROR_RED),
            borderRadius: BorderRadius.circular(8),
          ),
          floatingLabelStyle: TextStyle(
            color: labela.value ? ColorUtils.GREY_COLOR_PLACEHOLDER : ColorUtils.ERROR_RED,
          ),
          isDense: false,
          labelText: label ?? 'Password',
          prefixIcon: Icon(Icons.lock_outline,color: ColorUtils.TRACK_GREY,),
          suffixIcon: IconButton(
            icon: Icon(
              isObscure.value ? Icons.visibility_off : Icons.visibility,
              color: ColorUtils.GREY_COLOR_PLACEHOLDER,
            ),
            onPressed: () {
              isObscure.value = !isObscure.value;
            },
          ),
          errorStyle: TextStyle(
            color: ColorUtils.ERROR_RED,
            fontSize: TextSizeDynamicUtils.dHeight12,
            fontWeight: FontWeight.w400,
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            stateHandler.value = true;
          } else {
            stateHandler.value = false;
          }
          if (onChanged != null) onChanged!(value);
        },
        validator: validator,
        onSaved: onSaved,
      );
    });
  }
}
