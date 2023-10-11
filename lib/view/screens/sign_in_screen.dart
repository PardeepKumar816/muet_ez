import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muet_ez/constants/app_colors.dart';
import 'package:muet_ez/model/networking/authentication.dart';
import 'package:email_validator/email_validator.dart';
import '../../constants/constants.dart';
import '../../routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  bool _isLoading = false;
  final _controller = TextEditingController();
   bool _isEmailNotProvided = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Image.asset(
                      'assets/images/muet_logo.png',
                      width: getDeviceSize(context).width,
                      height: 160,
                    ),
                  ),
                 _isLoading ? const CircularProgressIndicator() :
                 Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 32,vertical: 32),
                      width: getDeviceSize(context).width,
                      height: getDeviceSize(context).height * 0.75,
                      decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Sign In',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 12),
                            width: 244,
                            height: 48,
                            decoration:  BoxDecoration(
                              border: Border.all(),
                              borderRadius:const  BorderRadius.all(Radius.circular(12))
                            ),
                            child: TextField(
                              controller: _controller,
                              decoration: const InputDecoration(border: InputBorder.none,
                            hintText: "Enter Your Email",
                            ),),
                          ),
                         if(_isEmailNotProvided)
                         const Text("Please Provide Your Email",style: TextStyle(color: Colors.red),),
                          ElevatedButton(
                              onPressed: () async {
                                if(_controller.text.isEmpty || !EmailValidator.validate(_controller.text)){
                                  setState(() {_isEmailNotProvided = true;});
                                }else{
                                  _isEmailNotProvided = false;
                                  setState(() {_isLoading = true;});
                                  try{
                                  final result = await Auth.loginWithMicrosoft();
                                  if(result is Exception){
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.toString())));
                                    setState(() {_isLoading = false;});
                                  }else{
                                    await getSharedPreferencesInstance().then((value) {value.setString("email", _controller.text);});
                                    _isLoading = false;
                                    if(_controller.text.contains("faculty")){
                                      Navigator.pushReplacementNamed(context, Routes.homeScreenAdmin);
                                    }
                                    else if(_controller.text.contains("students")){
                                      Navigator.pushReplacementNamed(context, Routes.homeScreen);
                                    }
                                  }
                                  } catch(error){
                                    if (kDebugMode) {
                                      print(error.toString());
                                    }
                                  }

                                }
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(24)))),
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(248, 44)),
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.blue)),
                              child: Row(
                                children: const [
                                  Icon(FontAwesomeIcons.microsoft),
                                  SizedBox(width: 6,),
                                  Text(
                                    'Sign in with Microsoft',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              )),
                          Column(
                            children: const [
                              Text("Please sign in with user credentials provided by MUET",textAlign: TextAlign.center,),
                              SizedBox(height: 16,),
                              Text('Ex: 19sw37@students.muet.edu.pk'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
