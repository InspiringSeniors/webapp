import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color_utils.dart';

Widget TextButton(){
  return               ElevatedButton(
    onPressed: () {},
    onHover: (v){
      if(v){
      }
      else{
      }
    }
    ,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        "Donate",
        style: TextStyle(fontSize: 16,color: Colors.white),
      ),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepOrangeAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}