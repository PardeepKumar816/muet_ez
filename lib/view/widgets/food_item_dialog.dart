import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../model/dummy_data.dart';

Future<dynamic> foodItemDialog(BuildContext context, int index,Function function) {
  return showDialog(context: context, builder: (context){
    print(function.call(index));
    return Dialog(
      child: Container(
        height: function.call(index) ? 300 : 400,
        decoration: const BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Row(
          children: [
            Flexible(
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:  EdgeInsets.only(left: 8),
                          child:  Text('Breakfast:',style: TextStyle(fontSize: 15),),
                        ),
                        const SizedBox(height: 1,),
                        Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: DummyData.dinning.entries.toList()[index].value['breakfast'].map<Widget>((e){
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
                          child:  Text('Lunch:',style: TextStyle(fontSize: 15),),
                        ),
                        const SizedBox(height: 1,),
                        Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: DummyData.dinning.entries.toList()[index].value['lunch'].map<Widget>((e){
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
                          child:  Text('Dinner:',style: TextStyle(fontSize: 15),),
                        ),
                        const SizedBox(height: 1,),
                        Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: DummyData.dinning.entries.toList()[index].value['dinner'].map<Widget>((e){
                              return Text(e);
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Flexible(
              flex: 2,
              child:
              Image.asset(DummyData.dinning.entries.toList()[index].value['image'][1],height: 400,fit: BoxFit.fitHeight,),),
          ],),
      ),
    );
  });
}