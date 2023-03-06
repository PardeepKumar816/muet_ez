import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class MarksDistributionTable extends StatelessWidget {
  const MarksDistributionTable({
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
        children:  [
          const TableRow(
            children: [
              TableCell(child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(''),
              )),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('Credit Hours',textAlign: TextAlign.center,)),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('Total Marks',textAlign: TextAlign.center,)),
              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('Passing Marks',textAlign: TextAlign.center,)),
            ],
          ),
          TableRow(
              children: [
                const TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('Theory',textAlign: TextAlign.center,),),
                TableCell(
                  child: Table(
                    border: TableBorder.symmetric(inside: const BorderSide(color: AppColors.black,width: 1)),
                    children: const [
                      TableRow(
                          children: [
                            TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('3',textAlign: TextAlign.center,),),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('2',textAlign: TextAlign.center,),),
                          ]
                      ),
                    ],
                  ),),
                TableCell(
                  child: Table(
                    border: TableBorder.symmetric(inside: const BorderSide(color: AppColors.black,width: 1)),
                    children: const [
                      TableRow(
                          children: [
                            TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('100',textAlign: TextAlign.center,),),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('50',textAlign: TextAlign.center,),),
                          ]
                      ),
                    ],
                  ),),
                TableCell(
                  child: Table(
                    border: TableBorder.symmetric(inside: const BorderSide(color: AppColors.black,width: 1)),
                    children: const [
                      TableRow(
                          children: [
                            TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('50',textAlign: TextAlign.center,),),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('25',textAlign: TextAlign.center,),),
                          ]
                      ),
                    ],
                  ),),
              ]),
          const TableRow(
              children: [
                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text('Practical',textAlign: TextAlign.center,),
                )),
                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('2',textAlign: TextAlign.center,)),
                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('50',textAlign: TextAlign.center,)),
                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('25',textAlign: TextAlign.center,)),
              ]
          ),
        ],
      ),
    );
  }
}