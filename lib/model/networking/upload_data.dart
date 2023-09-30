import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future<void> uploadAcademicData(String batch,String semester,String subject,bool twoCreditHour,bool threeCreditHour) async{
   String creditHour = twoCreditHour ? '2' : '3';
  await FirebaseFirestore.instance.collection('academicRecord').doc(batch).set({
    '$semester $subject $creditHour': '$semester $subject $creditHour'
  }, SetOptions(merge: true));

 var docRef =  FirebaseFirestore.instance.collection('academicRecord').doc(batch);
   var subCollection = docRef.collection('$semester${subject.replaceAll(" ", '')}');


 FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    PlatformFile file = result.files.first;

    final input =  File(file.path!).openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform( const CsvToListConverter())
        .toList();

    if (kDebugMode) {
      print(fields);
    }
    for(int i=1; i<fields.length; i++){
      final record = {
        "id" : fields[i][0],
        "sessional": fields[i][1],
        "mids" : fields[i][2],
        "final" : fields[i][3]
      };
     await subCollection.add(record).then((value){}).catchError((err){if (kDebugMode) {print(err.toString());}});
    }
  }
}


Future<void> uploadChallanData(String batch,String semester) async{

  await FirebaseFirestore.instance.collection('challanRecord').doc(batch).set({
    semester: semester
  },SetOptions(merge: true));
  var docRef = FirebaseFirestore.instance.collection("challanRecord").doc(batch);
  var subCollection = docRef.collection(semester);

  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    PlatformFile file = result.files.first;

    final input =  File(file.path!).openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform( const CsvToListConverter())
        .toList();

    if (kDebugMode) {
      print(fields);
    }
    for(int i=1; i<fields.length; i++){
      final record = {
        "id" : fields[i][0],
        "status": fields[i][1],
      };
      await subCollection.add(record).then((value){}).catchError((err){if (kDebugMode) {print(err.toString());}});
    }
  }
}

Future<void> uploadNotification(String? batch) async{

  String path = batch!.isNotEmpty ? '/notifications/batch/$batch' : '/notifications/university';

  final ImagePicker picker = ImagePicker();
  XFile? image = await picker.pickImage(source: ImageSource.gallery);
  final fileName = image!.path.split('/').last;
  final fileNameWithTimestamp = '${DateTime.now().millisecondsSinceEpoch}_$fileName';
  firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('$path/$fileNameWithTimestamp');

  try {
    await ref.putFile(File(image.path));
  } on FirebaseException catch (e) {
    if (kDebugMode) {
      print(e.message);
    }
  }


}