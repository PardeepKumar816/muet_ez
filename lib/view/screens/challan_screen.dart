import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
  bool _paidChallan = false;
  bool _unpaidChallan = false;
  bool _university = false;
  bool _hostel = false;
  bool _others = false;

  void chooseChallanType(bool paidChallan, bool unpaidChallan) {
    if (paidChallan) {
      setState(() {
        _paidChallan = true;
      });
    }
    if (unpaidChallan) {
      setState(() {
        _unpaidChallan = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return ChallanDialog(
            chooseChallanType: chooseChallanType,
          );
        },
      );
    });

    _university = true;

  }

  int getDataItemsCount(){
    if(_paidChallan){
      if(_university){
        return DummyData.paidChallanData['university'].length;
      }
      if(_hostel){
        return DummyData.paidChallanData['hostel'].length;
      }
      if(_others){
        return DummyData.paidChallanData['others'].length;
      }
    }if(_unpaidChallan){
      if(_university){
        return DummyData.unpaidChallanData['university'].length;
      }
      if(_hostel){
        return DummyData.unpaidChallanData['hostel'].length;
      }
      if(_others){
        return DummyData.unpaidChallanData['others'].length;
      }
    }

    return 0;
  }

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
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(onTap: (){
                      setState(() {
                        _university = true;
                        _hostel = false;
                        _others = false;
                      });
                    },
                      child: Container(
                        alignment: Alignment.center,
                        width: getDeviceSize(context).width / 3 - 1,
                        height: 40,
                        color: _university ? AppColors.blue : AppColors.white,
                        child:  Text('University',style: TextStyle(color: _university ? AppColors.white : AppColors.black),),
                      ),
                    ),
                    const Divider(color: AppColors.black),
                    InkWell(
                      onTap: (){
                        setState(() {
                          _university = false;
                          _hostel = true;
                          _others = false;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: getDeviceSize(context).width / 3 - 1,
                        height: 40,
                        color: _hostel ? AppColors.blue : AppColors.white,
                        child:  Text('Hostel',style: TextStyle(color: _hostel ? AppColors.white : AppColors.black),),
                      ),
                    ),
                    const Divider(
                      color: AppColors.black,
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          _university = false;
                          _hostel = false;
                          _others = true;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: getDeviceSize(context).width / 3 - 1,
                        height: 40,
                        color: _others ? AppColors.blue : AppColors.white,
                        child:  Text('Others',style: TextStyle(color: _others ? AppColors.white : AppColors.black),),
                      ),
                    ),
                  ],
                ),
                if (_paidChallan)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ListView.builder(
                          itemCount: getDataItemsCount(),
                          itemBuilder: (context, index) {
                            dynamic data;
                            if(_university){
                              data = DummyData.paidChallanData['university'];
                            }
                            if(_hostel){
                              data = DummyData.paidChallanData['hostel'];
                            }
                            if(_others){
                              data = DummyData.paidChallanData['others'];
                            }
                            return ChallanBox(data: data,index: index,isPaid: true,);
                          }),
                    ),
                  ),
                if (_unpaidChallan)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ListView.builder(
                          itemCount: getDataItemsCount(),
                          itemBuilder: (context, index) {
                            dynamic data;
                            if(_university){
                              data = DummyData.unpaidChallanData['university'];
                            }
                            if(_hostel){
                              data = DummyData.unpaidChallanData['hostel'];
                            }
                            if(_others){
                              data = DummyData.unpaidChallanData['others'];
                            }
                            return ChallanBox(data: data,index: index,isPaid: false,);
                          }),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChallanBox extends StatelessWidget {
  const ChallanBox({
    Key? key,
    required this.data, required this.index, required this.isPaid,
  }) : super(key: key);

  final data;
  final int index;
  final bool isPaid;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: 16, left: 8, right: 8),
      // width: getDeviceSize(context).width - 24,
      height: 156,
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius:
          BorderRadius.all(Radius.circular(24))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data[index]['description'],
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text('Fee Amount:\t ${data[index]['feeAmount']}'),
                  const SizedBox(
                    height: 8,
                  ),
                  Text('Late Fees:\t\t\t\t\t ${data[index]['lateFees']}'),
                  const SizedBox(
                    height: 8,
                  ),
                  Text('Total Due:\t\t\t\t\t ${data[index]['TotalDue']}'),
                  const SizedBox(
                    height: 8,
                  ),
                  Text('Remaining:\t\t\t ${data[index]['remaining']}'),
                ],
              )
            ],
          ),
          isPaid ?  Row(
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
  }
}
