import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:muet_ez/model/networking/authentication.dart';
import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
import '../../model/repository/student_model.dart';
import '../../model/user_actions_name.dart';
import '../../routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _gridOption = true;
 // String _name = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // getName();
    getData();
  }

  Future<void> getName() async{

  }

  Future<void> getData() async{

    await getSharedPreferencesInstance().then((value) {
      Student.name = value.getString("email")!.split("@")[0];
      Student.id = value.getString("email")!.split("@")[0];
      Student.batch = value.getString("email")!.split("@")[0].substring(0,4);
    });

    final result =  await FirebaseStorage.instance.ref('profile/${Student.id}').listAll();
    Student.image = await result.items[0].getDownloadURL();

    await FirebaseFirestore.instance.collection("userProfile").doc(Student.id).get()
        .then((value) {
          if(value.data()!['name'] != null){
            Student.name = value.data()!['name'];
            Student.number = value.data()!['number'];
            Student.address = value.data()!['address'];
          }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
            // Positioned(
            //   top: 16,
            //   left: 0,
            //   right: 0,
            //   child: Opacity(
            //     opacity: 0.1,
            //     child: Image.asset('assets/images/muet_logo.png'),
            //     // Stack(
            //     //   children: [
            //     //     // Implement the stroke
            //     //     Text(
            //     //       'Software Engineering',
            //     //       textAlign: TextAlign.center,
            //     //       style: TextStyle(
            //     //         fontSize: 56,
            //     //         letterSpacing: 5,
            //     //         fontWeight: FontWeight.bold,
            //     //         foreground: Paint()
            //     //           ..style = PaintingStyle.stroke
            //     //           ..strokeWidth = 10
            //     //           ..color = AppColors.blue,
            //     //       ),
            //     //     ),
            //     //     // The text inside
            //     //     const Text(
            //     //       'Software Engineering',
            //     //       textAlign: TextAlign.center,
            //     //       style: TextStyle(
            //     //         fontSize: 56,
            //     //         letterSpacing: 5,
            //     //         fontWeight: FontWeight.bold,
            //     //         color: AppColors.lightBlue,
            //     //       ),
            //     //     ),
            //     //   ],
            //     // ),
            //   ),
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: getDeviceSize(context).width * 0.9,
                  height: getDeviceSize(context).height / 4,
                  decoration: const BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(28))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Stack(
                        children:  [
                         Align(
                           alignment: Alignment.center,
                           child: CircleAvatar(
                              radius: 60,
                              child: CircleAvatar(
                                radius: 56,
                                backgroundColor: AppColors.lightBlue,
                                backgroundImage:
                                Student.image != null ?
                                NetworkImage(Student.image!)  :
                                const AssetImage( 'assets/images/user.png') as ImageProvider,
                              ),
                            ),
                         ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                       Text(
                        Student.name??"",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                       Text(
                        Student.id??"",
                        style: const TextStyle(fontSize: 15, color: AppColors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onPanUpdate: (details) {
                    // Swiping in right direction.
                    if (details.delta.dx > 0) {}
                    _gridOption = true;
                    //   _grid2 = false;
                    setState(() {});
                    // Swiping in left direction.
                    if (details.delta.dx < 0) {
                      _gridOption = false;
                      //   _grid2 = true;
                      setState(() {});
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    width: getDeviceSize(context).width,
                    height: getDeviceSize(context).height * 0.65,
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      //  _gridOption
                           // ?
                        Expanded(
                                child: GridView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                  ),
                                  children: UserActions.actions
                                      .map((e) => Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if(e.name == 'Attendance'){
                                                    Navigator.pushNamed(context, Routes.attendanceScreen);
                                                  }
                                                  // else if(e.name=='Schedule'){
                                                  //   Navigator.pushNamed(context, Routes.scheduleScreen);
                                                 // }
                                                  else if(e.name=='Map'){
                                                    Navigator.pushNamed(context, Routes.mapScreen);
                                                  }else if(e.name=='Emergency'){
                                                    Navigator.pushNamed(context, Routes.emergencyScreen);
                                                  }else if(e.name=='Challan'){
                                                    Navigator.pushNamed(context, Routes.challanScreen);
                                                  }else if(e.name=='Notification'){
                                                    Navigator.pushNamed(context, Routes.notificationScreen);
                                                  }else if(e.name=='Dinning'){
                                                    Navigator.pushNamed(context, Routes.dinningScreen);
                                                  }else if(e.name=='Profile'){
                                                    Navigator.pushNamed(context, Routes.profileScreen);
                                                  }else if(e.name=='Results'){
                                                    Navigator.pushNamed(context, Routes.resultsScreen);
                                                  } else if(e.name=='Announcements'){
                                                    Navigator.pushNamed(context, Routes.eventsScreen);
                                                  }  else if(e.name=='Transport'){
                                                    Navigator.pushNamed(context, Routes.transportScreen);
                                                  } else if(e.name=='Log out'){
                                                    Auth.logout(context);
                                                  }
                                                },
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      AppColors.lightBlue,
                                                  radius: 40,
                                                  child: Image.asset(
                                                    e.imgUrl,
                                                    width: 60,
                                                    height: 70,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                e.name,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ))
                                      .toList(),
                                ),
                              )
                         //   :
                        // Expanded(
                        //         child: GridView(
                        //           scrollDirection: Axis.vertical,
                        //           physics: const NeverScrollableScrollPhysics(),
                        //           gridDelegate:
                        //               const SliverGridDelegateWithFixedCrossAxisCount(
                        //             crossAxisCount: 3,
                        //           ),
                        //           children: UserActions.actions
                        //               .sublist(
                        //                   12, UserActions.actions.length - 1)
                        //               .map((e) => Column(
                        //                     children: [
                        //                       InkWell(
                        //                           onTap: () {},
                        //                           child: CircleAvatar(
                        //                             backgroundColor:
                        //                                 AppColors.lightBlue,
                        //                             radius: 40,
                        //                             child: Image.asset(
                        //                               e.imgUrl,
                        //                               width: 64,
                        //                               height: 72,
                        //                               fit: BoxFit.contain,
                        //                             ),
                        //                           )),
                        //                       const SizedBox(
                        //                         height: 2,
                        //                       ),
                        //                       Text(
                        //                         e.name,
                        //                         style: const TextStyle(
                        //                             fontWeight:
                        //                                 FontWeight.w600),
                        //                       )
                        //                     ],
                        //                   ))
                        //               .toList(),
                        //         ),
                        //       ),
                        // Center(
                        //   child: Row(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       InkWell(
                        //         onTap: () {
                        //           _gridOption = true;
                        //           setState(() {});
                        //         },
                        //         child: Container(
                        //           width: _gridOption ? 32 : 14,
                        //           height: 5,
                        //           decoration: BoxDecoration(
                        //             color: _gridOption
                        //                 ? AppColors.green
                        //                 : Colors.grey,
                        //             borderRadius: const BorderRadius.all(
                        //               Radius.circular(12),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(
                        //         width: 2,
                        //       ),
                        //       InkWell(
                        //         onTap: () {
                        //           _gridOption = false;
                        //           setState(() {});
                        //         },
                        //         child: Container(
                        //           width: _gridOption ? 14 : 32,
                        //           height: 5,
                        //           decoration: BoxDecoration(
                        //             color: _gridOption
                        //                 ? Colors.grey
                        //                 : AppColors.green,
                        //             borderRadius: const BorderRadius.all(
                        //               Radius.circular(12),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
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
