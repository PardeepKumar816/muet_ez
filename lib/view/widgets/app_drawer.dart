import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.blue,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24))
            ),
            accountName: Text('Pardeep Kumar'),
            accountEmail: Text('19sw37@student.muet.edu.pk'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/my_image.JPG'),
            ),
          ),
          ListTile(
            iconColor: AppColors.white,
            textColor: AppColors.white,
            leading: const CircleAvatar(backgroundImage: AssetImage('assets/images/attendance.png'),),
            title: const Text('Attendance'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(color: AppColors.white.withOpacity(0.5),),
          ListTile(
            iconColor: AppColors.white,
            textColor: AppColors.white,
            leading: const CircleAvatar(backgroundImage: AssetImage('assets/images/challan.png'),),
            title: const Text('Transcript'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(color: AppColors.white.withOpacity(0.5),),
          ListTile(
            iconColor: AppColors.white,
            textColor: AppColors.white,
            leading: const CircleAvatar(backgroundImage: AssetImage('assets/images/results.png'),),
            title: const Text('Result'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(color: AppColors.white.withOpacity(0.5),),
          ListTile(
            iconColor: AppColors.white,
            textColor: AppColors.white,
            leading: const CircleAvatar(backgroundImage: AssetImage('assets/images/schedule.png'),),
            title: const Text('Schedule'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(color: AppColors.white.withOpacity(0.5),),
          ListTile(
            iconColor: AppColors.white,
            textColor: AppColors.white,
            leading: const CircleAvatar(backgroundImage: AssetImage('assets/images/profile.png'),),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(color: AppColors.white.withOpacity(0.5),),
          ListTile(
            iconColor: AppColors.white,
            textColor: AppColors.white,
            leading: const CircleAvatar(backgroundImage: AssetImage('assets/images/map.png'),),
            title: const Text('Map'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(color: AppColors.white.withOpacity(0.5),),
          ListTile(
            iconColor: AppColors.white,
            textColor: AppColors.white,
            leading: const CircleAvatar(backgroundImage: AssetImage('assets/images/notification.png'),),
            title: const Text('Notifications'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(color: AppColors.white.withOpacity(0.5),),
          ListTile(
            iconColor: AppColors.white,
            textColor: AppColors.white,
            leading: const CircleAvatar(backgroundImage: AssetImage('assets/images/dinning.png'),),
            title: const Text('Dinning'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(color: AppColors.white.withOpacity(0.5),),
          ListTile(
            iconColor: AppColors.white,
            textColor: AppColors.white,
            leading: const CircleAvatar(backgroundImage: AssetImage('assets/images/emergency.png'),),
            title: const Text('Emergency'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(color: AppColors.white.withOpacity(0.5),),
          ListTile(
            iconColor: AppColors.white,
            textColor: AppColors.white,
            leading: const CircleAvatar(backgroundImage: AssetImage('assets/images/events.png'),),
            title: const Text('Events'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(color: AppColors.white.withOpacity(0.5),),
          ListTile(
            iconColor: AppColors.white,
            textColor: AppColors.white,
            leading: const CircleAvatar(backgroundImage: AssetImage('assets/images/transport.png'),),
            title: const Text('Transport'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(color: AppColors.white.withOpacity(0.5),),
          ListTile(
            iconColor: AppColors.white,
            textColor: AppColors.white,
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              // Perform logout logic here...
            },
          ),
        ],
      ),
    );
  }
}