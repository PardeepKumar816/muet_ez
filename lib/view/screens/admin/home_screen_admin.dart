import 'package:flutter/material.dart';
import 'package:muet_ez/view/widgets/bottom_sheets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/constants.dart';
import '../../../model/networking/authentication.dart';
import '../../../utils/bottom_sheet_callbacks.dart';

class HomeScreenAdmin extends StatefulWidget {
   const HomeScreenAdmin({Key? key}) : super(key: key);

  @override
  State<HomeScreenAdmin> createState() => _HomeScreenAdminState();
}

class _HomeScreenAdminState extends State<HomeScreenAdmin> {
  String _name = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> getName() async{
    await getSharedPreferencesInstance().then((value) {
      _name = value.getString("email")!.split("@")[0];
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: getDeviceSize(context).height*0.1,),
                      Text("Welcome $_name",textAlign: TextAlign.center,style: TextStyle(color: AppColors.white,fontSize: getDeviceSize(context).width*0.1),),
                      SizedBox(height: getDeviceSize(context).height*0.1,),
                      ElevatedButton(
                          onPressed: () async {
                            await bottomSheetCallback(context,const BottomSheetWidgetForAcademic());
                          },
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(AppColors.blue),
                            fixedSize: MaterialStatePropertyAll(Size(200,40)),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(45))))
                          ),
                          child: const Text("Add Academic Records")),
                      SizedBox(height: getDeviceSize(context).height*0.05,),
                      ElevatedButton(
                          onPressed: (){
                            bottomSheetCallback(context,const BottomSheetWidgetForChallan());
                          },
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(AppColors.blue),
                              fixedSize: MaterialStatePropertyAll(Size(200,40)),
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(45))))
                          ),
                          child: const Text("Add Challan Records")),
                      SizedBox(height: getDeviceSize(context).height*0.05,),
                      ElevatedButton(
                          onPressed: () async {
                            await bottomSheetCallback(context,const BottomSheetWidgetForNotification());
                          },
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(AppColors.blue),
                              fixedSize: MaterialStatePropertyAll(Size(200,40)),
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(45))))
                          ),
                          child: const Text("Upload Notifications")),
                      SizedBox(height: getDeviceSize(context).height*0.05,),
                      ElevatedButton(
                          onPressed: () async {
                            await bottomSheetCallback(context,const BottomSheetWidgetForAnnouncement());
                          },
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(AppColors.blue),
                              fixedSize: MaterialStatePropertyAll(Size(200,40)),
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(45))))
                          ),
                          child: const Text("Add Announcements")),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ElevatedButton(
                  onPressed: () async {
                     Auth.logout(context);
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(AppColors.green),
                      fixedSize: MaterialStatePropertyAll(Size(150,40)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(45))))
                  ),
                  child: const Text("Log out")),
            ),
          ],
        ),
      ),
    );
  }
}


