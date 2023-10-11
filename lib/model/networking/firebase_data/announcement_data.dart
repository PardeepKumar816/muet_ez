
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../../repository/student_model.dart';

class AnnouncementData{
  List<Map<String,dynamic>> announcements = [];


  Future<List<Map<String,dynamic>>> getAnnouncementData() async {

    await FirebaseFirestore.instance.collection("announcement").doc("batch").collection(Student.batch!).get()
    .then((value) {
      for (var element in value.docs) {
        announcements.add(element.data());
      }
    });

    await FirebaseFirestore.instance.collection("announcement").doc("department").get()
        .then((value) {
          int length = value.data()!['data'] != null ? value.data()!['data'].length : 0;
          for(int i=0; i<length ; i++){
            announcements.add({"data":value.data()!['data'][i],"time":value.data()!['time'][i]});
          }
    });
    return announcements;
  }
}