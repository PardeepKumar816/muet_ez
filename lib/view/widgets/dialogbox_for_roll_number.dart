

import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/constants.dart';

Dialog dialogBoxForRollNumber(BuildContext context,{required Function trigger}) {
  final controller = TextEditingController();
  return Dialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
    ),
    backgroundColor: AppColors.green,
    child: Container(
      width: getDeviceSize(context).width,
      height: getDeviceSize(context).height / 3,
      decoration: const BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Enter Your Roll Number',
            style: Theme.of(context).textTheme.headline6,
          ),
          Container(
            padding: const EdgeInsets.only(left: 8),
            width: getDeviceSize(context).width / 3,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: '19sw37',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if(controller.text.isNotEmpty){
                trigger.call();
                Navigator.of(context).pop();
              }
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.blue),
                foregroundColor: MaterialStateProperty.all(AppColors.white),
                fixedSize: MaterialStateProperty.all(const Size(80, 32))),
            child: const Text(
              'OK',
            ),
          ),
        ],
      ),
    ),
  );
}