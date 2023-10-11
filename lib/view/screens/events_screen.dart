import 'package:flutter/material.dart';
import 'package:muet_ez/model/networking/firebase_data/announcement_data.dart';
import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
import '../../model/dummy_data.dart';
import '../../model/repository/student_model.dart';
import '../widgets/app_drawer.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

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
            FutureBuilder<List<Map<String,dynamic>>>(
              future: AnnouncementData().getAnnouncementData(), // your function
              builder: (BuildContext context, AsyncSnapshot<List<Map<String,dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child:  CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                else if(snapshot.data!.isNotEmpty) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: snapshot.data!.map<Widget>((e) {
                        return  Center(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 24),
                            width: getDeviceSize(context).width*0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Text(e['data']!,textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black),),
                                  const SizedBox(height: 20,),
                                  Align(alignment: Alignment.centerRight,child: Text(e['time']))
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }
                else{
                  return const Center(
                    child:  Padding(
                      padding:  EdgeInsets.only(bottom: 32),
                      child: Text("No Data Found",textAlign: TextAlign.center,style: TextStyle(fontSize: 32,color: Colors.red),),
                    ),
                  );
                }
              },
            ),
            // ListView.builder(itemCount:DummyData.events.length,itemBuilder: (context,index){
            //
            //   return Padding(
            //     padding: const EdgeInsets.only(bottom: 8),
            //     child: InkWell(
            //       onTap: (){
            //        // Navigator.pushNamed(context, Routes.newsDownloadScreen,arguments: DummyData.events[index]);
            //       },
            //       child: Container(
            //         alignment: Alignment.center,
            //         margin: const EdgeInsets.symmetric(horizontal: 8),
            //         color: index.isOdd ? const Color(0xffF7FCD2) : const Color(0xffC0EAF5),
            //         //height: 56,
            //         child: Row(
            //           children: [
            //             Image.asset('assets/images/news.jpg'),
            //             Expanded(child: Text(DummyData.events[index],textAlign: TextAlign.center,)),
            //           ],
            //         ),
            //       ),
            //     ),
            //   );
            // })
          ],
        ),
      ),
    );
  }
}
