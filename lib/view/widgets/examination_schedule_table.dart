import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../model/dummy_data.dart';

class ExaminationScheduleTable extends StatelessWidget {
  ExaminationScheduleTable({Key? key, required this.text}) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 8),
            child: Text(text),
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
              columnWidths: const {
                0: FixedColumnWidth(96),
                1: FixedColumnWidth(64)
              },
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
                          'Date',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        'Time',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        'Subject',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                ...DummyData.examinationScheduleMids['subject'].map((e) {
                  final list =
                  DummyData.examinationScheduleMids.values.map((f) {
                    return f[DummyData.examinationScheduleMids['subject']
                        .indexOf(e)];
                  }).toList();
                  return TableRow(children: [
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