import 'package:flutter/material.dart';
import 'package:muet_ez/model/networking/firebase_data/notification_data.dart';
import 'package:muet_ez/model/repository/student_model.dart';
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
            FutureBuilder<List<String>>(
              future: NotificationData().getNotificationData(Student.batch??""), // your function
              builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child:  CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                else if(snapshot.data!.isNotEmpty) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: snapshot.data!.map<Widget>((e) {
                        return  InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> NotificationViewScreen(url: e)));
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16,top: 16),
                              child: Container(
                                width: 300,
                                  height: 400,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                                    image: DecorationImage(
                                      image: NetworkImage(e),
                                      fit: BoxFit.fill
                                    )
                                  ),
                                 // child: Image.network(e),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
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
    );
  }
}


class NotificationViewScreen extends StatelessWidget {
  const NotificationViewScreen({Key? key,required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:SafeArea(
        child: Column(
          children: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.clear,color: Colors.white,)),
            Expanded(child: Image.network(url)),
          ],
        ),
      ) ,
    );
  }
}
