import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class AttendanceCard extends StatelessWidget {
  AttendanceCard({
    Key? key,
    required this.subject,
    required this.totalClasses,
    required this.present,
    required this.absent,
    required this.percentage,
    required this.lateAdmission,
  }) : super(key: key);

  final String subject;
  final String totalClasses;
  final String present;
  final String absent;
  final String percentage;
  final String lateAdmission;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      height: 200,
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            subject,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text('Total Classes Conducted: $totalClasses'),
          Text('Present: $present'),
          Text(
            'Absent: $absent',
            style: const TextStyle(color: Colors.redAccent),
          ),
          Text('Percentage: $percentage'),
          Text('Late Admission: $lateAdmission')
        ],
      ),
    );
  }
}