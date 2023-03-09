import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
import '../widgets/app_drawer.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

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
                Text('IN CASE OF EMERGENCY PLEASE CONTACT',style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.redAccent),textAlign: TextAlign.center,),
                const SizedBox(height: 8,),
                Container(
                  margin: const EdgeInsets.only(left:4,right: 4,bottom: 8),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('MUET EMERGENCY CONTACT NUMBER',style: TextStyle(fontWeight: FontWeight.w600),),
                      ),
                      Table(
                        border: TableBorder.all(color: AppColors.black),
                        children: const [
                          TableRow(
                            children: [
                              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                padding:  EdgeInsets.symmetric(vertical: 8.0),
                                child: Text('NAME',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w600),),
                              )),
                              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('CELL NO.',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w600),)),
                              TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('PTCL/HELPLINE',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w600),)),
                            ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('REGISTERAR MUET JAMSHORO',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-2771371',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Mr. Asif Ali Akhund, In-charge Surveillance Security',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('03463372708',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-2772257\n(EXT:7710)',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Mr. Ghulam Nabi Rajar, Security Officer',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('0300-3447554',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-2772250\n(Ext:4806)',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Mr. Abdul Hakeem Unar, Security Coordinator',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('0312-7959138',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Mr. Ghazi Khan, Student Welfare Officer, MUET',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('0331-3502713\n0300-3061125',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-2772250\n(Ext: 2037)',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Mr. Gul Bahar Khaskhely (Assistant) Day Shift',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('0333-2766554\n0310-2766554',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-2772250\n(Ext:4806)',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Mr. Muhammad Afzal Pathan Care Taker (Night Shift)',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('0333-2731448\n0342-8350070',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                              ]
                          ),
                        ],
                      ),
                      const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('PAKISTAN ARMY CONTACT NUMBERS',style: TextStyle(fontWeight: FontWeight.w600),),
                      ),
                      Table(
                        border: TableBorder.all(color: AppColors.black),
                        children: const [
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Quick Response Fore (QRF)',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-3870326/1135',textAlign: TextAlign.center,)),
                              ]
                          ),
                        ],
                      ),
                      const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('PAKISTAN RANGERS CONTACT NUMBERS',style: TextStyle(fontWeight: FontWeight.w600),),
                      ),
                      Table(
                        border: TableBorder.all(color: AppColors.black),
                        children: const [
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('DSR Muhammad Farooque Pakistan Rangers',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-2771356',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Pakistan Rangers',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('1101',textAlign: TextAlign.center,)),
                              ]
                          ),
                        ],
                      ),
                      const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('SINDH POLICE CONTACT NUMBERS',style: TextStyle(fontWeight: FontWeight.w600),),
                      ),
                      Table(
                        border: TableBorder.all(color: AppColors.black),
                        children: const [
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('SSP Parwaiz Khan Umrani, Jamshoro',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-9213661-2',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('SSP House Jamshoro',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-9213285-6',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('ASP Suhai Aziz Talpur, Jamshoro',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-3874976',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('SI Jalil Abbasi Inch: DIB',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-3874574',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Police Control Room District Jamshoro',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-3874977',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Girls Rescue Centre\nDSP Agha Aljaz Ali Khan SPS',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('0308-3509665',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Insp. Muhammad Khan RI, MUET, Jamshoro',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('0300-3024884',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Police Station Jamshoro',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-3877130',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('MADADGAR 15 Hyderabad Cant',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-9200723',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('HC Sayed Riaz Shah MUET, Campus',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('0347-9644038',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                              ]
                          ),
                        ],
                      ),
                      const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('DISTRICT MANAGEMENT JAMSHORO',style: TextStyle(fontWeight: FontWeight.w600),),
                      ),
                      Table(
                        border: TableBorder.all(color: AppColors.black),
                        children: const [
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Deputy Commissioner Jamshoro',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-3871299',textAlign: TextAlign.center,)),
                              ]
                          ),
                        ],
                      ),
                      const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('MEDICAL EMERGENCY CONTACT NUMBERS',style: TextStyle(fontWeight: FontWeight.w600),),
                      ),
                      Table(
                        border: TableBorder.all(color: AppColors.black),
                        children: const [
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('MS Dr. Abdul Wahab, LUMHS Jamshoro',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-9210207-8',textAlign: TextAlign.center,)),
                              ]
                          ),
                        ],
                      ),
                      const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('OTHER EMERGENCY CONTACT NUMBERS',style: TextStyle(fontWeight: FontWeight.w600),),
                      ),
                      Table(
                        border: TableBorder.all(color: AppColors.black),
                        children: const [
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Police Emergency Helpline',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('15-9200073',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Fire Brigade Hyderabad',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-9239121',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Fire Brigade Kotri',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('0345-3570361',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Bomb Disposal Squad Team (Special Branch, Hyderabad)',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('022-9200303-4',textAlign: TextAlign.center,)),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('EDHI Centre',textAlign: TextAlign.center,),
                                )),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('',textAlign: TextAlign.center,)),
                                TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: Text('115',textAlign: TextAlign.center,)),
                              ]
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
