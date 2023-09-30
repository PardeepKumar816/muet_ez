

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:muet_ez/model/repository/academic_model.dart';
import 'package:muet_ez/model/repository/student_model.dart';

class AcademicData{

  List<Academic> academicData = [];

  Future<List<Academic>> getAcademicData(String? semester) async {
    await FirebaseFirestore.instance.collection('academicRecord').doc(Student.batch!).get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        final data = documentSnapshot.data() as Map<String, dynamic>;
        for (var entry in data.entries) {
          if (entry.key.contains(semester!)) {
            var value = await FirebaseFirestore.instance.collection("academicRecord").doc(Student.batch!).collection(entry.key.substring(0,entry.key.length-1).replaceAll(" ", '')).get();
            for (var element in value.docs) {
              if (element.data()['id'] == Student.id) {
                academicData.add(
                    Academic(
                      subject: entry.key.substring(1, entry.key.length-1),
                      sessional: element.data()['sessional'].toString(),
                      mids: element.data()['mids'].toString(),
                      finals: element.data()['final'].toString(),
                      creditHour: entry.key.substring(entry.key.length-1)
                    )
                );
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
    return academicData;
  }


}