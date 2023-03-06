import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
import '../../model/dummy_data.dart';
import 'dialogbox_for_roll_number.dart';


class ChooseDepartmentForAttendance extends StatefulWidget {
  const ChooseDepartmentForAttendance({Key? key,required this.trigger}) : super(key: key);

  final Function trigger;

  @override
  State<ChooseDepartmentForAttendance> createState() =>
      _ChooseDepartmentForAttendanceState();
}

class _ChooseDepartmentForAttendanceState
    extends State<ChooseDepartmentForAttendance> {
  dynamic _selectedDepartment = null; // DummyData.departmentList[0];
  dynamic _selectedClass = null;
  String _classHint = '';
//  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.blue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: getDeviceSize(context).width - 100,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text('Choose Department'),
                  // alignment: Alignment.center,
                  underline: Container(
                    height: 0,
                    color: Colors.transparent,
                  ),
                  value: _selectedDepartment,
                  items: DummyData.departmentList.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedDepartment = value!;
                      _classHint = 'Choose Class';
                    });
                  }),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              width: getDeviceSize(context).width - 100,
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text(_classHint),
                //   alignment: Alignment.center,
                underline: Container(
                  height: 0,
                  color: Colors.transparent,
                ),
                value: _selectedClass,
                items: DummyData.classList.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: _classHint.isEmpty
                    ? null
                    : (value) {
                  setState(() {
                    _selectedClass = value!;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            if (_selectedDepartment != null && _selectedClass != null)
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return dialogBoxForRollNumber(context, trigger: widget.trigger,);
                      });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.white),
                    foregroundColor: MaterialStateProperty.all(AppColors.black),
                    fixedSize: MaterialStateProperty.all(const Size(128, 32))),
                child: const Text('Roll Number'),
              ),
          ],
        ),
      ),
    );
  }


}