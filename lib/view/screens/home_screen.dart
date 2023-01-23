import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
import '../../model/user_actions_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _gridOption = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: CircleAvatar(
                    radius: 60,
                    child: CircleAvatar(
                      radius: 56,
                      backgroundColor: AppColors.lightBlue,
                      backgroundImage: AssetImage('assets/images/my_image.JPG'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Text(
                      'Pardeep Kumar',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )),
                const SizedBox(
                  height: 2,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Text(
                    '19SW37',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onPanUpdate: (details) {
                    // Swiping in right direction.
                    if (details.delta.dx > 0) {}
                    _gridOption = true;
                    //   _grid2 = false;
                    setState(() {});
                    // Swiping in left direction.
                    if (details.delta.dx < 0) {
                      _gridOption = false;
                      //   _grid2 = true;
                      setState(() {});
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    width: getDeviceSize(context).width,
                    height: getDeviceSize(context).height * 0.65,
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _gridOption
                            ? Expanded(
                                child: GridView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                  ),
                                  children: UserActions.actions
                                      .map((e) => Column(
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      AppColors.lightBlue,
                                                  radius: 40,
                                                  child: ClipOval(
                                                    child: Image.asset(
                                                      e.imgUrl,
                                                      width: 64,
                                                      height: 72,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                e.name,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ))
                                      .toList(),
                                ),
                              )
                            : Expanded(
                                child: GridView(
                                  scrollDirection: Axis.vertical,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                  ),
                                  children: UserActions.actions
                                      .sublist(
                                          12, UserActions.actions.length - 1)
                                      .map((e) => Column(
                                            children: [
                                              InkWell(
                                                  onTap: () {},
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        AppColors.lightBlue,
                                                    radius: 40,
                                                    child: ClipOval(
                                                      child: Image.asset(
                                                        e.imgUrl,
                                                        width: 64,
                                                        height: 72,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  )),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                e.name,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ))
                                      .toList(),
                                ),
                              ),
                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  _gridOption = true;
                                  setState(() {});
                                },
                                child: Container(
                                  width: _gridOption ? 32 : 14,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: _gridOption
                                        ? AppColors.green
                                        : Colors.grey,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              InkWell(
                                onTap: () {
                                  _gridOption = false;
                                  setState(() {});
                                },
                                child: Container(
                                  width: _gridOption ? 14 : 32,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: _gridOption
                                        ? Colors.grey
                                        : AppColors.green,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
