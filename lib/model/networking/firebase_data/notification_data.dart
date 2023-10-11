

import 'package:firebase_storage/firebase_storage.dart';

class NotificationData{
  List<String> notification = [];

  Future<List<String>> getNotificationData(String? batch) async {
    final result =  await FirebaseStorage.instance.ref('/notifications/university').listAll();
    for (Reference ref in result.items) {
      String url = await ref.getDownloadURL();
      notification.add(url);
    }

    final result2 =  await FirebaseStorage.instance.ref('/notifications/batch/$batch').listAll();
    for (Reference ref in result2.items) {
      String url = await ref.getDownloadURL();
      notification.add(url);
    }

    return notification;

  }

}