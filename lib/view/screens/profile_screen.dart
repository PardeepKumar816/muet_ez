import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
import '../widgets/app_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
             children:  const [
                Center(
                 child: CircleAvatar(
                   backgroundImage: AssetImage('assets/images/my_image.JPG'),
                   radius: 64,
                 ),
               ),
               SizedBox(height: 8,),
               ProfileContainer(icon: Icons.person, about: 'Name', data: 'Pardeep Kumar',),
               ProfileContainer(icon: Icons.perm_identity, about: 'Student ID', data: '19SW37',),
               ProfileContainer(icon: Icons.subject, about: 'Program', data: 'Software Engineering',),
               ProfileContainer(icon: Icons.alternate_email, about: 'Email', data: '19sw37@students.muet.edu.pk',),
               ProfileContainer(icon: Icons.call, about: 'Mobile', data: '03353146121',),
               ProfileContainer(icon: Icons.area_chart, about: 'Address', data: 'Sanghar',),
             ],
           )
          ],
        ),
      ),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    Key? key, required this.icon, required this.about, required this.data,
  }) : super(key: key);

  final IconData icon;
  final String about;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
     // width: getDeviceSize(context).width - 100,
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      padding: const EdgeInsets.only(left: 12),
      height: 56,
      decoration: const  BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Icon(icon,size: 38,),
        const SizedBox(width: 16,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(about,style: const TextStyle(color: AppColors.blue,fontSize: 16),),
            Text(data),
          ],
        )
      ],),
    );
  }
}
