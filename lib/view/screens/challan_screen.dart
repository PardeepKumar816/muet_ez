import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:muet_ez/model/networking/firebase_data/challan_data.dart';
import 'package:muet_ez/model/repository/challan_model.dart';

import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
import '../../model/dummy_data.dart';
import '../widgets/app_drawer.dart';
import '../widgets/challan_dialog.dart';

class ChallanScreen extends StatefulWidget {
  const ChallanScreen({Key? key}) : super(key: key);

  @override
  State<ChallanScreen> createState() => _ChallanScreenState();
}

class _ChallanScreenState extends State<ChallanScreen> {

  String? _selectedSemester;

  // bool _paidChallan = false;
  // bool _unpaidChallan = false;
  // bool _university = false;
  // bool _hostel = false;
  // bool _others = false;
  //
  // void chooseChallanType(bool paidChallan, bool unpaidChallan) {
  //   if (paidChallan) {
  //     setState(() {
  //       _paidChallan = true;
  //     });
  //   }
  //   if (unpaidChallan) {
  //     setState(() {
  //       _unpaidChallan = true;
  //     });
  //   }
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return ChallanDialog(
  //           chooseChallanType: chooseChallanType,
  //         );
  //       },
  //     );
  //   });
  //
  //   _university = true;
  //
  // }
  //
  // int getDataItemsCount(){
  //   if(_paidChallan){
  //     if(_university){
  //       return DummyData.paidChallanData['university'].length;
  //     }
  //     if(_hostel){
  //       return DummyData.paidChallanData['hostel'].length;
  //     }
  //     if(_others){
  //       return DummyData.paidChallanData['others'].length;
  //     }
  //   }if(_unpaidChallan){
  //     if(_university){
  //       return DummyData.unpaidChallanData['university'].length;
  //     }
  //     if(_hostel){
  //       return DummyData.unpaidChallanData['hostel'].length;
  //     }
  //     if(_others){
  //       return DummyData.unpaidChallanData['others'].length;
  //     }
  //   }
  //
  //   return 0;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        elevation: 0,
        foregroundColor: AppColors.black,
      ),
      drawer: const AppDrawer(),
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
            Positioned(
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: getDeviceSize(context).width - 100,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text('Select Semester'),
                        // alignment: Alignment.center,
                        underline: Container(
                          height: 0,
                          color: Colors.transparent,
                        ),
                        value: _selectedSemester,
                        items: DummyData.semester.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedSemester = value!;
                          });
                        }),
                  ),
                  SizedBox(height: getDeviceSize(context).height*0.1,),
                  if(_selectedSemester!=null)
                    FutureBuilder<List<Challan>>(
                      future: ChallanData().getChallanData(_selectedSemester??""), // your function
                      builder: (BuildContext context, AsyncSnapshot<List<Challan>> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child:  CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        else if(snapshot.data!.isNotEmpty) {
                          return Column(
                            children: snapshot.data!.map<Widget>((e) {
                              return  Container(
                                margin: const EdgeInsets.symmetric(horizontal: 32),
                                padding: const EdgeInsets.only(top: 16),
                                height: 88,
                                width: 200,
                                decoration: const BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                                child: Column(
                                  children: [
                                    Text("$_selectedSemester Semester", style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(fontWeight: FontWeight.w500),),
                                   const SizedBox(height: 8,),
                                    e.status =="paid" ?
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Text('Paid'),
                                        SizedBox(width: 4,),
                                        Icon(Icons.check_box,color: AppColors.green,)
                                      ],
                                    ) :
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Text('Unpaid'),
                                        SizedBox(width: 4,),
                                        Icon(Icons.check_box_outline_blank_rounded,color: Colors.redAccent,)
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                        }
                        else{
                          return const Padding(
                            padding:  EdgeInsets.only(bottom: 32),
                            child: Text("No Data Found",textAlign: TextAlign.center,style: TextStyle(fontSize: 32,color: Colors.red),),
                          );
                        }
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ChallanBox extends StatelessWidget {
//   const ChallanBox({
//     Key? key,
//     required this.data, required this.index, required this.isPaid,
//   }) : super(key: key);
//
//   final data;
//   final int index;
//   final bool isPaid;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(
//           top: 16, left: 8, right: 8),
//       // width: getDeviceSize(context).width - 24,
//       height: 156,
//       decoration: const BoxDecoration(
//           color: AppColors.white,
//           borderRadius:
//           BorderRadius.all(Radius.circular(24))),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Row(
//             mainAxisAlignment:
//             MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 data[index]['description'],
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline5!
//                     .copyWith(fontWeight: FontWeight.w500),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment:
//                 CrossAxisAlignment.start,
//                 children: [
//                   Text('Fee Amount:\t ${data[index]['feeAmount']}'),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   Text('Late Fees:\t\t\t\t\t ${data[index]['lateFees']}'),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   Text('Total Due:\t\t\t\t\t ${data[index]['TotalDue']}'),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   Text('Remaining:\t\t\t ${data[index]['remaining']}'),
//                 ],
//               )
//             ],
//           ),
//           isPaid ?  Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Text('Paid'),
//               SizedBox(width: 4,),
//               Icon(Icons.check_box,color: AppColors.green,)
//             ],
//           ) :
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Text('Unpaid'),
//               SizedBox(width: 4,),
//               Icon(Icons.check_box_outline_blank_rounded,color: Colors.redAccent,)
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
