import 'package:flutter/material.dart';
import 'package:muet_ez/constants/app_colors.dart';

class NotificationDownloadScreen extends StatelessWidget {
  const NotificationDownloadScreen({Key? key, required this.text})
      : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const  SizedBox(height: 32,),
            Text(
              '$data',
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.white, fontSize: 16),
            ),
            const SizedBox(height: 32,),
            Padding(
              padding: const EdgeInsets.only(left: 24,right: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                   const Icon(Icons.arrow_forward_ios,color: AppColors.white,),
                    Flexible(child: TextButton(onPressed: (){}, child: const Text('Announcement'))),
                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.arrow_forward_ios,color: AppColors.white,),
                      Flexible(child: TextButton(onPressed: (){}, child: const Text('List of All Eligible Candidates'))),
                    ],),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
