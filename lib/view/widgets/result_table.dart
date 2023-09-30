import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
class ResultTable extends StatelessWidget {
  const ResultTable({
    Key? key,
    required this.resultMap,
  }) : super(key: key);

  final Map<String, dynamic> resultMap;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: AppColors.white,
        ),
        child:
        Table(
          border: TableBorder.all(
              color: Colors.black,
              style: BorderStyle.solid,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              width: 1),
          columnWidths: const {0: FixedColumnWidth(150)},
          children: [
            const TableRow(
                children: [
                  TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Text('Subject',textAlign: TextAlign.center,),
                  ),),
                  TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('Marks Obtained',textAlign: TextAlign.center,),),
                  TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('Credit Hours',textAlign: TextAlign.center,),),
                  TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('Grades',textAlign: TextAlign.center,),),
                  TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('Quality Points',textAlign: TextAlign.center,),),
                ]
            ),
            ...resultMap.entries.map((e) {
              return TableRow(
                  children: [
                    TableCell(
                        child: Table(
                          columnWidths: const {0: FixedColumnWidth(96)},
                          border: TableBorder.symmetric(inside: const BorderSide(color: AppColors.black,width: 1)),
                          children: [
                            TableRow(
                                children: [
                                  TableCell(
                                      verticalAlignment: TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 6),
                                        child: Text(e.key,textAlign: TextAlign.center,style: const TextStyle(fontSize: 13),),
                                      )),
                                  TableCell(
                                      verticalAlignment: TableCellVerticalAlignment.middle,
                                      child: Table(
                                        border:  TableBorder.symmetric(inside: const BorderSide(color: AppColors.black,width: 1)),
                                        children: [
                                          TableRow(
                                              children: [
                                               // Container(height:36,alignment: Alignment.center,child: const TableCell(verticalAlignment: TableCellVerticalAlignment.top,child: Text('Theory',textAlign: TextAlign.center,style:  TextStyle(fontSize: 13),),))
                                                TableCell(verticalAlignment: TableCellVerticalAlignment.top,child: Container(height:36,alignment: Alignment.center,child: const Text('Theory',textAlign: TextAlign.center,style:  TextStyle(fontSize: 13),)),)
                                              ]
                                          ),
                                          TableRow(
                                              children: [
                                               // Container(height:36,alignment: Alignment.center,child: const TableCell(verticalAlignment: TableCellVerticalAlignment.top,child: Text('Practical',textAlign: TextAlign.center,style:  TextStyle(fontSize: 13),),)),
                                                TableCell(verticalAlignment: TableCellVerticalAlignment.top,child: Container(height: 36,alignment: Alignment.center,child: const Text('Practical',textAlign: TextAlign.center,style:  TextStyle(fontSize: 13),)),)
                                              ]
                                          ),
                                        ],))
                                ]
                            )
                          ],
                        )),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Table(
                        border:  TableBorder.symmetric(inside: const BorderSide(color: AppColors.black,width: 1)),
                        children: [
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.top,child: Container(height:36,alignment:Alignment.center,child: Text(e.value['theory']['marks obtained'],textAlign: TextAlign.center,)),)
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.top,child: Container(height: 36,alignment: Alignment.center,child: Text(e.value.length == 2 ?e.value['practical']['marks obtained'] : '-',textAlign: TextAlign.center,)),)
                              ]
                          ),
                        ],),),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Table(
                          border:  TableBorder.symmetric(inside: const BorderSide(color: AppColors.black,width: 1)),
                          children: [
                            TableRow(
                                children: [
                                  TableCell(verticalAlignment: TableCellVerticalAlignment.top,child: Container(height:36,alignment: Alignment.center,child: Text(e.value['theory']['credit hours'],textAlign: TextAlign.center,)),)
                                ]
                            ),
                            TableRow(
                                children: [
                                  TableCell(verticalAlignment: TableCellVerticalAlignment.top,child: Container(height: 36,alignment: Alignment.center,child: Text(e.value.length == 2 ?e.value['practical']['credit hours'] : '-',textAlign: TextAlign.center,)),)
                                ]
                            ),
                          ],)),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Table(
                          border:  TableBorder.symmetric(inside: const BorderSide(color: AppColors.black,width: 1)),
                          children: [
                            TableRow(
                                children: [
                                  TableCell(verticalAlignment: TableCellVerticalAlignment.top,child: Container(height: 36,alignment: Alignment.center,child: Text(e.value['theory']['grades'],textAlign: TextAlign.center,)),)
                                ]
                            ),
                            TableRow(
                                children: [
                                  TableCell(verticalAlignment: TableCellVerticalAlignment.top,child: Container(height: 36,alignment: Alignment.center,child: Text(e.value.length == 2 ?e.value['practical']['grades'] : '-',textAlign: TextAlign.center,)),)
                                ]
                            ),
                          ],)),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Table(
                          border:  TableBorder.symmetric(inside: const BorderSide(color: AppColors.black,width: 1)),
                          children:  [
                            TableRow(
                                children: [
                                  TableCell(verticalAlignment: TableCellVerticalAlignment.top,child: Container(height: 36,alignment: Alignment.center,child: Text(e.value['theory']['quality points'],textAlign: TextAlign.center,)),)
                                ]
                            ),
                            TableRow(
                                children: [
                                  TableCell(verticalAlignment: TableCellVerticalAlignment.top,child: Container(height: 36,alignment: Alignment.center,child: Text(e.value.length == 2 ?e.value['practical']['quality points'] : '-',textAlign: TextAlign.center,)),)
                                ]
                            ),
                          ],)),
                  ]
              );
            }).toList(),
          ],
        )
    );
  }
}