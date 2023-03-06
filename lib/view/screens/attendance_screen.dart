import 'package:flutter/material.dart';
import 'package:muet_ez/model/dummy_data.dart';

import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
import '../widgets/app_drawer.dart';
import '../widgets/attendance_card.dart';
import '../widgets/choose_department_for_attendance.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  bool _chooseDepartment = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chooseDepartment = true;
  }

  void triggerChooseDepartment() {
    setState(() {
      _chooseDepartment = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    late Widget w;
    _chooseDepartment
        ? w = ChooseDepartmentForAttendance(
            trigger: triggerChooseDepartment,
          )
        : w = Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.green,
              elevation: 0,
              foregroundColor: AppColors.black,
            ),
            drawer: AppDrawer(),
            backgroundColor: AppColors.blue,
            body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    width: getDeviceSize(context).width,
                    height: getDeviceSize(context).height * 0.75,
                    decoration: const BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24))),
                  ),
                  ListView(
                    children: [
                      Center(
                          child: Text(
                        'From 14-12-2022 To 06-03-2023',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: AppColors.blue),
                      )),
                      AttendanceCard(
                        subject: 'Thesis-Final Year Project (Practical)',
                        totalClasses: '31',
                        present: '31',
                        absent: '0',
                        percentage: '100%',
                        lateAdmission: '-',
                      ),
                      AttendanceCard(
                        subject: 'Formal Methods Of Software Engineering (Theory)',
                        totalClasses: '31',
                        present: '25',
                        absent: '3',
                        percentage: '80%',
                        lateAdmission: '-',
                      ),
                      AttendanceCard(
                        subject: 'Multimedia Communication (Theory)',
                        totalClasses: '31',
                        present: '25',
                        absent: '3',
                        percentage: '80%',
                        lateAdmission: '-',
                      ),
                      AttendanceCard(
                        subject: 'Multimedia Communication (Practical)',
                        totalClasses: '31',
                        present: '25',
                        absent: '3',
                        percentage: '80%',
                        lateAdmission: '-',
                      ),
                      AttendanceCard(
                        subject: 'Web Engineering (Theory)',
                        totalClasses: '31',
                        present: '25',
                        absent: '3',
                        percentage: '80%',
                        lateAdmission: '-',
                      ),
                      AttendanceCard(
                        subject: 'Web Engineering (Practical)',
                        totalClasses: '31',
                        present: '25',
                        absent: '3',
                        percentage: '80%',
                        lateAdmission: '-',
                      ),
                      AttendanceCard(
                        subject: 'Software Re-Engineering (Theory)',
                        totalClasses: '31',
                        present: '25',
                        absent: '3',
                        percentage: '80%',
                        lateAdmission: '-',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
    return w;
  }
}


