import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
class ChallanDialog extends StatelessWidget {
  const ChallanDialog({
    Key? key, required this.chooseChallanType,
  }) : super(key: key);

  final Function chooseChallanType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getDeviceSize(context).width - 100,
      height: getDeviceSize(context).height / 4,
      decoration: const BoxDecoration(
        color: AppColors.blue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              chooseChallanType.call(true,false);
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColors.white),
                foregroundColor:
                MaterialStateProperty.all(AppColors.black),
                fixedSize:
                MaterialStateProperty.all(const Size(128, 32))),
            child: const Text('Paid Challan'),
          ),
          ElevatedButton(
            onPressed: () {
              chooseChallanType.call(false,true);
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColors.white),
                foregroundColor:
                MaterialStateProperty.all(AppColors.black),
                fixedSize:
                MaterialStateProperty.all(const Size(128, 32))),
            child: const Text(
              'Unpaid Challan',
            ),
          ),
        ],
      ),
    );
  }
}