import 'package:flutter/material.dart';
import 'package:muet_ez/model/dummy_data.dart';

import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
import '../widgets/app_drawer.dart';
import '../widgets/examination_schedule_table.dart';
import '../widgets/time_table.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  // int rowLength = 1;
  late List<int> tableRowsList;

  int getRowsLength() {
    int largestLength = DummyData.timeTable.values
        .reduce(
            (value, element) => value.length > element.length ? value : element)
        .length;
    return largestLength;
  }

  List<String> time = [
    '[8 to 9]',
    '[9 to 10]',
    '[10 to 11]',
    '[11 to 12]',
    '[12 to 1]',
    '[1 to 2]',
    '[2 to 3]',
    '[3 to 4]',
    '[4 to 5]',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tableRowsList = List.generate(getRowsLength(), (index) => index);
  }

  // List<Widget> getRowText() {
  //   List<Widget> l = [];
  //
  //   for(int i=0; i<DummyData.timeTable.length; i++){
  //
  //   }
  //
  //   DummyData.timeTable.entries.map<Widget>((e) {
  //     return DummyData.timeTable[e.key].map<Widget>((value) {
  //       return Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 4),
  //         child: Text(
  //           value,
  //           textAlign: TextAlign.center,
  //         ),
  //       );
  //     }).toList();
  //   }).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: 8),
                  child: Text(
                    'TimeTable:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                TimeTable(
                  tableRowsList: tableRowsList,
                  time: time,
                  section: '1',
                ),
                TimeTable(
                  tableRowsList: tableRowsList,
                  time: time,
                  section: '2',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: 8, top: 4),
                  child: Text(
                    'Examination Schedule:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                ExaminationScheduleTable(
                  text: 'Mids',
                ),
                ExaminationScheduleTable(
                  text: 'Finals',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




