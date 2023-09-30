

import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
import '../../model/networking/upload_data.dart';

class BottomSheetWidgetForAcademic extends StatefulWidget {
  const BottomSheetWidgetForAcademic({Key? key, }) : super(key: key);

  @override
  State<BottomSheetWidgetForAcademic> createState() => _BottomSheetWidgetForAcademicState();
}

class _BottomSheetWidgetForAcademicState extends State<BottomSheetWidgetForAcademic> {

  final _controller1 = TextEditingController() ;
  final _controller2 = TextEditingController() ;
  final _controller3 = TextEditingController() ;
  bool _isValuesProvided = false;
  bool _isUploading = false;
  bool _twoCreditHour = false;
  bool _threeCreditHour = false;

  @override
  Widget build(BuildContext context) {
    return
      _isUploading ? SizedBox(height: getDeviceSize(context).height*0.5,child: const CircularProgressIndicator()) :
    Padding(
      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children:  [
          const SizedBox(height: 32,),
          Container(
            padding: const EdgeInsets.only(left: 16),
            width: getDeviceSize(context).width*0.8,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(45))
            ),
            child: TextField(
              controller: _controller1,
              showCursor: true,
              cursorColor: Colors.blue,
              decoration:const InputDecoration(
                  hintText: "Enter Batch Ex: 19sw",
                  border: InputBorder.none
              ),
            ),
          ),
          const SizedBox(height: 32,),
          Container(
            padding: const EdgeInsets.only(left: 16),
            width: getDeviceSize(context).width*0.8,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(45))
            ),
            child: TextFormField(
              controller: _controller2,
              showCursor: true,
              cursorColor: Colors.blue,
              decoration:const InputDecoration(
                  hintText: "Enter Semester Ex: 8",
                  border: InputBorder.none
              ),
            ),),
          const SizedBox(height: 32,),
          Container(
            padding: const EdgeInsets.only(left: 16),
            width: getDeviceSize(context).width*0.8,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(45))
            ),
            child: TextFormField(
              controller: _controller3,
              showCursor: true,
              cursorColor: Colors.blue,
              decoration:const InputDecoration(
                  hintText: "Enter Subject Ex: Cloud Computing",
                  border: InputBorder.none
              ),
            ),),
          const SizedBox(height: 16,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("2 Credit Hour",style: TextStyle(color: AppColors.white),),
                  Theme(
                    data: ThemeData(unselectedWidgetColor: Colors.white),
                    child: Checkbox(
                        value: _twoCreditHour, onChanged: (value){
                      setState(() {
                        _twoCreditHour = value!;
                        if(_twoCreditHour && _threeCreditHour){
                          _threeCreditHour = false;
                        }
                      });
                    }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("3 Credit Hour",style: TextStyle(color: AppColors.white),),
                  Theme(
                    data: ThemeData(unselectedWidgetColor: Colors.white),
                    child: Checkbox(
                        value: _threeCreditHour, onChanged: (value){
                      setState(() {
                        _threeCreditHour = value!;
                        if(_twoCreditHour && _threeCreditHour){
                          _twoCreditHour = false;
                        }
                      });
                    }),
                  ),
                ],
              ),
            ],
          ),
         // const SizedBox(height: 32,),
          if(_isValuesProvided)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Text("Please Provide all values above",style: TextStyle(color: Colors.red),),
            ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ElevatedButton(
                onPressed: () async{
                  if(_controller1.text.isNotEmpty && _controller2.text.isNotEmpty && _controller3.text.isNotEmpty && (_threeCreditHour || _twoCreditHour) ){
                    setState(() {_isUploading = true;});
                    await uploadAcademicData(_controller1.text,_controller2.text,_controller3.text,_twoCreditHour,_threeCreditHour);
                    _isValuesProvided = false;
                    _isUploading = false;
                    Navigator.pop(context);
                  }else{
                    setState(() {_isValuesProvided = true;});
                  }
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(AppColors.green),
                    fixedSize: MaterialStatePropertyAll(Size(200,40)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(45))))
                ),
                child: const Text("Upload .csv file")),
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////


class BottomSheetWidgetForChallan extends StatefulWidget {
  const BottomSheetWidgetForChallan({Key? key, }) : super(key: key);

  @override
  State<BottomSheetWidgetForChallan> createState() => _BottomSheetWidgetForChallanState();
}

class _BottomSheetWidgetForChallanState extends State<BottomSheetWidgetForChallan> {

  final _controller1 = TextEditingController() ;
  final _controller2 = TextEditingController() ;
  bool _isValuesProvided = false;
  bool _isUploading = false;

  @override
  Widget build(BuildContext context) {
    return  _isUploading ? SizedBox(height: getDeviceSize(context).height*0.5,child: const CircularProgressIndicator()) :
      Padding(
      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children:  [
          const SizedBox(height: 32,),
          Container(
            padding: const EdgeInsets.only(left: 16),
            width: getDeviceSize(context).width*0.8,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(45))
            ),
            child: TextField(
              controller: _controller1,
              showCursor: true,
              cursorColor: Colors.blue,
              decoration:const InputDecoration(
                  hintText: "Enter Batch Ex: 19sw",
                  border: InputBorder.none
              ),
            ),
          ),
          const SizedBox(height: 32,),
          Container(
            padding: const EdgeInsets.only(left: 16),
            width: getDeviceSize(context).width*0.8,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(45))
            ),
            child: TextFormField(
              controller: _controller2,
              showCursor: true,
              cursorColor: Colors.blue,
              decoration:const InputDecoration(
                  hintText: "Enter Semester Ex: 8",
                  border: InputBorder.none
              ),
            ),),
          const SizedBox(height: 32,),
          if(_isValuesProvided)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Text("Please Provide all values above",style: TextStyle(color: Colors.red),),
            ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ElevatedButton(
                onPressed: () async{
                  if(_controller1.text.isNotEmpty && _controller2.text.isNotEmpty ){
                    setState(() {_isUploading = true;});
                    await uploadChallanData(_controller1.text,_controller2.text);
                    _isValuesProvided = false;
                    _isUploading = false;
                    Navigator.pop(context);
                  }else{
                    setState(() {_isValuesProvided = true;});
                  }
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(AppColors.green),
                    fixedSize: MaterialStatePropertyAll(Size(200,40)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(45))))
                ),
                child: const Text("Upload .csv file")),
          ),
        ],
      ),
    );
  }
}



///////////////////////////////////////////////////////////////////////////////////////////////



class BottomSheetWidgetForNotification extends StatefulWidget {
  const BottomSheetWidgetForNotification({Key? key, }) : super(key: key);

  @override
  State<BottomSheetWidgetForNotification> createState() => _BottomSheetWidgetForNotificationState();
}

class _BottomSheetWidgetForNotificationState extends State<BottomSheetWidgetForNotification> {

  final _controller1 = TextEditingController() ;
  bool _university = false;
  bool _batch = false;
  bool _isValuesProvided = false;
  bool _isUploading = false;

  @override
  Widget build(BuildContext context) {
    return  _isUploading ? SizedBox(height: getDeviceSize(context).height*0.5,child: const CircularProgressIndicator()) :
    Padding(
      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children:  [
          const SizedBox(height: 32,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Text("Notification For University",style: TextStyle(color: AppColors.white),),
              Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: Checkbox(
                    value: _university, onChanged: (value){
                  setState(() {
                    _university = value!;
                    if(_batch && _university){
                      _batch = false;
                    }
                  });
                }),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Notification For Batch",style: TextStyle(color: AppColors.white),),
              Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: Checkbox(
                    value: _batch, onChanged: (value){
                  setState(() {
                    _batch = value!;
                    if(_batch && _university){
                      _university = false;
                    }
                  });
                }),
              ),
            ],
          ),
          if(_batch)
          Container(
            padding: const EdgeInsets.only(left: 16),
            width: getDeviceSize(context).width*0.8,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(45))
            ),
            child: TextField(
              controller: _controller1,
              showCursor: true,
              cursorColor: Colors.blue,
              decoration:const InputDecoration(
                  hintText: "Enter Batch Ex: 19sw",
                  border: InputBorder.none
              ),
            ),
          ),
          const SizedBox(height: 32,),
          if(_isValuesProvided && _batch)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Text("Please Provide all values above",style: TextStyle(color: Colors.red),),
            ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ElevatedButton(
                onPressed: () async{
                  if(_batch){
                    if(_controller1.text.isNotEmpty){
                      setState(() {_isUploading = true;});
                      await uploadNotification(_controller1.text);
                      _isValuesProvided = false;
                      _isUploading = false;
                      Navigator.pop(context);
                    }else{
                      setState(() {_isValuesProvided = true;});
                    }
                  }
                  else if(_university){
                    setState(() {_isUploading = true;});
                  await uploadNotification("");
                    _isUploading = false;
                    Navigator.pop(context);
                  }
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(AppColors.green),
                    fixedSize: MaterialStatePropertyAll(Size(200,40)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(45))))
                ),
                child: const Text("Upload Image")),
          ),
        ],
      ),
    );
  }
}