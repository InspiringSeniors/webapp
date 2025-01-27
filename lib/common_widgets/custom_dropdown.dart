import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_controller.dart';

import '../utils/color_utils.dart';

class CustomDropdown extends StatelessWidget{

  var heading;
  var isDropdownClicked;
  var dropdownElements;

  CustomDropdown({this.heading,this.isDropdownClicked,this.dropdownElements});

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: TextSizeDynamicUtils.dHeight12),


          child: InkWell(
            onTap: () {
              isDropdownClicked.value =
              !isDropdownClicked.value;
            },
            child: Container(
              width: MediaQuery.of(Get.context!).size.width,
              padding: EdgeInsets.symmetric(
                  horizontal: 16, vertical: TextSizeDynamicUtils.dHeight12),
              height: TextSizeDynamicUtils.dHeight48,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: ColorUtils.GREY_DOTTED),
                      borderRadius: BorderRadius.circular(8))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    heading,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: TextSizeDynamicUtils.dHeight16,
                        letterSpacing: 0.15,
                        fontFamily: 'Poppings-medium',
                        color: ColorUtils.SECONDARY_BLACK),
                  ),
                  Container(
                      height: TextSizeDynamicUtils.dHeight24,
                      width: TextSizeDynamicUtils.dHeight24,
                      child: Obx(
                            () => isDropdownClicked.value
                            ? Icon(
                          Icons.arrow_drop_up,
                          size: TextSizeDynamicUtils.dHeight24,
                        )
                            : Icon(
                          Icons.arrow_drop_down,
                          size: TextSizeDynamicUtils.dHeight24,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
        Obx(() =>
            isDropdownClicked.value
            ? Container(
            child: dropdownElements)
            : Container()),
      ],
    );

  }




}