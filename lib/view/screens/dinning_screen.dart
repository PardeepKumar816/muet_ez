import 'package:flutter/material.dart';
import 'package:muet_ez/model/dummy_data.dart';

import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
import '../widgets/app_drawer.dart';
import '../widgets/food_item_dialog.dart';

class DinningScreen extends StatelessWidget {
  const DinningScreen({Key? key}) : super(key: key);

  bool isDinningEmpty(int index){
    bool flag = false;
    if(DummyData.dinning.entries.toList()[index].value['dinner'].isEmpty){
      flag = true;
    }
    if(DummyData.dinning.entries.toList()[index].value['lunch'].isEmpty){
      flag = true;
    }
    if(DummyData.dinning.entries.toList()[index].value['breakfast'].isEmpty){
      flag = true;
    }

    return flag;
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
            ListView.builder(itemCount:DummyData.dinning.length,itemBuilder: (context,index){
              return Container(
                height: 420,
                margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
                decoration: const BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Row(children: [
                  Flexible(
                    flex:2,child:
                  Image.asset(DummyData.dinning.entries.toList()[index].value['image'][0],height: 420,fit: BoxFit.fitHeight,),),
                  Flexible(
                      child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(child: Text(DummyData.dinning.entries.toList()[index].key,textAlign: TextAlign.center,style: const TextStyle(fontSize: 16),)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:  EdgeInsets.only(left: 8),
                            child:  Text('Address:',style: TextStyle(fontSize: 15),),
                          ),
                         const SizedBox(height: 1,),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text(DummyData.dinning.entries.toList()[index].value['address']),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:  EdgeInsets.only(left: 8),
                            child:  Text('Time:',style: TextStyle(fontSize: 15),),
                          ),
                          const SizedBox(height: 1,),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text(DummyData.dinning.entries.toList()[index].value['time']),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:  EdgeInsets.only(left: 8),
                            child:  Text('Meals:',style: TextStyle(fontSize: 15),),
                          ),
                          const SizedBox(height: 1,),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: DummyData.dinning.entries.toList()[index].value['meals'].map<Widget>((e){
                                return Text(e);
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:  EdgeInsets.only(left: 8),
                            child:  Text('Restaurant Dinning:',style: TextStyle(fontSize: 15),),
                          ),
                          const SizedBox(height: 1,),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: DummyData.dinning.entries.toList()[index].value['restaurant dinning'].map<Widget>((e){
                                return Text(e);
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      Center(child: ElevatedButton(onPressed: (){
                        foodItemDialog(context, index,isDinningEmpty);
                      }, child: const Text('Food Items'))),
                    ],
                  )),
                ],),
              );
            }),
          ],
        ),
      ),
    );
  }


}
