

import 'package:firebase_database/firebase_database.dart';
import 'package:muet_ez/model/dummy_data.dart';

class ImagesFromCloudDatabase{

 static Future<void> getImagesFromDatabase() async {
    final DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
    final event = await databaseRef.once();
    Map<String, dynamic> imageUrls = {};
     imageUrls = Map<String, String>.from(event.snapshot.value! as Map<Object?, Object?>);

     DummyData.dinning.forEach((key, value) {
       if(key=='Electronic Canteen'){
         value['image'] = [imageUrls['electronic-1'],imageUrls['electronic-2']];
       }
       if(key=='IT Canteen'){
         value['image'] = [imageUrls['itCanteen-1'],imageUrls['itCanteen-2']];
       }
       if(key=='Hill Top Canteen'){
         value['image'] = [imageUrls['ht-1'],imageUrls['ht-2']];
       }
       if(key=='STC Canteen'){
         value['image'] = [imageUrls['stc-1'],imageUrls['stc-2']];
       }
       if(key=='CC Canteen'){
         value['image'] = [imageUrls['cc-1'],imageUrls['cc-2']];
       }
     });
  }

}