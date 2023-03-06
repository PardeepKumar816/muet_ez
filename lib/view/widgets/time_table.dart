import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../model/dummy_data.dart';

class TimeTable extends StatelessWidget {
  const TimeTable({
    Key? key,
    required this.tableRowsList,
    required this.time,
    required this.section,
  }) : super(key: key);

  final List<int> tableRowsList;
  final List<String> time;
  final String section;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 8),
            child: Text('Section: $section'),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              color: AppColors.white,
            ),
            margin: const EdgeInsets.only(left: 2, right: 2),
            child: Table(
              columnWidths: const {0: FixedColumnWidth(80)},
              border: TableBorder.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  width: 1),
              children: [
                const TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(22.0),
                        child: Text(
                          '',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        'MON',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        'TUE',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        'WED',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        'THU',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        'FRI',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                ...tableRowsList.map((e) {
                  final list = DummyData.timeTable.values.map((f) {
                    return f[e];
                  }).toList();
                  return TableRow(children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          time[tableRowsList.indexOf(e)],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    ...list.map((e) {
                      return TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            e,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                  ]);
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}