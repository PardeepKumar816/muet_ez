

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:muet_ez/constants/app_colors.dart';
import 'package:muet_ez/model/repository/student_model.dart';

import '../../constants/constants.dart';
import '../../model/networking/upload_data.dart';

class EditProfileScreen extends StatefulWidget {
   const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _addressController = TextEditingController();
  bool _isUploading = false;
  bool _isUploading2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text  = Student.name??"";
    _numberController.text = Student.number??"";
    _addressController.text = Student.address??"";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _addressController.dispose();
    _numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        elevation: 0,
        foregroundColor: AppColors.black,
      ),
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
            _isUploading2 ? const Center(child: CircularProgressIndicator(),) :
            ListView(
              children:   [
                 Center(
                  child: _isUploading ? const CircularProgressIndicator() :
                  Stack(
                    children: [
                       CircleAvatar(
                        backgroundImage: Student.image != null ?
                        NetworkImage(Student.image!)  :
                        const AssetImage( 'assets/images/user.png') as ImageProvider ,
                        radius: 64,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 12,
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              _isUploading = true;
                            });
                            await uploadUserProfile(Student.id).then((value) async {
                              if (kDebugMode) {
                                final result =  await FirebaseStorage.instance.ref('profile/${Student.id}').listAll();
                                Student.image = await result.items[0].getDownloadURL();
                                setState(() {
                                  _isUploading = false;
                                });
                              }
                            }).catchError((err){if (kDebugMode) {print(err.toString());}});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                            ),
                              child: const Icon(Icons.add,color: Colors.black,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 16),

                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                        padding: const EdgeInsets.only(left: 20),
                        height: 48,
                        decoration: const  BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        child:  TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            hintText: "Name",
                            border: InputBorder.none
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                        padding: const EdgeInsets.only(left: 20),
                        height: 48,
                        decoration: const  BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        child:  TextField(
                          controller: _numberController,
                          decoration: const InputDecoration(
                              hintText: "Number",
                              border: InputBorder.none
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                        padding: const EdgeInsets.only(left: 20),
                        height: 48,
                        decoration: const  BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        child:  TextField(
                          controller: _addressController,
                          decoration: const InputDecoration(
                              hintText: "Address",
                              border: InputBorder.none
                          ),
                        ),
                      ),
                     const SizedBox(height: 8,),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _isUploading2 = true;
                          });
                         await uploadUserData(_nameController.text,_numberController.text,_addressController.text).then((value) {
                           setState(() {
                             _isUploading2 = false;
                           });
                         });
                        },
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(AppColors.blue)
                        ),
                        child: const Text("Save"),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
