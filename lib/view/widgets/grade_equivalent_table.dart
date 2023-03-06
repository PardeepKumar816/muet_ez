import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
class GradeEquivalentTable extends StatelessWidget {
  const GradeEquivalentTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: AppColors.white,
      ),
      child: Table(
        border: TableBorder.all(
            color: Colors.black,
            style: BorderStyle.solid,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            width: 1),
        children: const [
          TableRow(
            children: [
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('Grade',textAlign: TextAlign.center,),
              )),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('Grade Point',textAlign: TextAlign.center,)),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('Percentage of Marks Theory/Practical/Project',textAlign: TextAlign.center,)),
            ],
          ),
          TableRow(
            children: [
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('A+',textAlign: TextAlign.center,),
              )),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('4.0',textAlign: TextAlign.center,)),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('>90%',textAlign: TextAlign.center,)),
            ],
          ),
          TableRow(
            children: [
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('A',textAlign: TextAlign.center,),
              )),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('3.5',textAlign: TextAlign.center,)),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('>82%',textAlign: TextAlign.center,)),
            ],
          ),
          TableRow(
            children: [
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('B+',textAlign: TextAlign.center,),
              )),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('3.0',textAlign: TextAlign.center,)),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('>75%',textAlign: TextAlign.center,)),
            ],
          ),
          TableRow(
            children: [
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('B',textAlign: TextAlign.center,),
              )),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('2.5',textAlign: TextAlign.center,)),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('>70%',textAlign: TextAlign.center,)),
            ],
          ),
          TableRow(
            children: [
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('C+',textAlign: TextAlign.center,),
              )),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('2.0',textAlign: TextAlign.center,)),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('>65%',textAlign: TextAlign.center,)),
            ],
          ),
          TableRow(
            children: [
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('C',textAlign: TextAlign.center,),
              )),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('1.5',textAlign: TextAlign.center,)),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('>50%',textAlign: TextAlign.center,)),
            ],
          ),
        ],
      ),
    );
  }
}