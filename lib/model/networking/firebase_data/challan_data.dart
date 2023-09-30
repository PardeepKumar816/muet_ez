

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:muet_ez/model/repository/challan_model.dart';

import '../../repository/student_model.dart';

class ChallanData{

  List<Challan> challanData = [];

  Future<List<Challan>> getChallanData(String? semester) async {
    await FirebaseFirestore.instance.collection('challanRecord').doc(Student.batch!).get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        final data = documentSnapshot.data() as Map<String, dynamic>;
        for (var entry in data.entries) {
          if (entry.key.contains(semester!)) {
            var value = await FirebaseFirestore.instance.collection("challanRecord").doc(Student.batch!).collection(semester).get();
            for (var element in value.docs) {
              if (element.data()['id'] == Student.id) {
                challanData.add(Challan(id:element.data()['id'],status: element.data()['status']));
              }
            }
          }
        }
      } else {
        if (kDebugMode) {
          print('Document does not exist on the database');
        }
      }
    });
    return challanData;
  }

}