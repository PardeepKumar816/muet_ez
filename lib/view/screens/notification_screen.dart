import 'package:flutter/material.dart';
import 'package:muet_ez/model/dummy_data.dart';

import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
import '../widgets/app_drawer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

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
            ListView.builder(itemCount:DummyData.notification.length,itemBuilder: (context,index){

              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    color: index.isOdd ? const Color(0xffF7FCD2) : const Color(0xffC0EAF5),
                    height: 56,
                    child: Text(DummyData.notification[index],textAlign: TextAlign.center,),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
