
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../view/widgets/bottom_sheets.dart';

Future<dynamic> bottomSheetCallback(BuildContext context,Widget widget) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColors.blue,
      context: context,
      builder: (context){
        return  widget;
      }
  );
}