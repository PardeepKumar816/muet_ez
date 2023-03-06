import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
import '../../model/dummy_data.dart';
import '../widgets/app_drawer.dart';
import '../widgets/grade_equivalent_table.dart';
import '../widgets/marks_distribution_table.dart';
import '../widgets/result_table.dart';

class ResultsScreen extends StatefulWidget {
   const ResultsScreen({Key? key}) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  dynamic _selectedSemester = null;
  Map<String,dynamic> resultMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        elevation: 0,
        foregroundColor: AppColors.black,
      ),
      drawer: AppDrawer(),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: getDeviceSize(context).width - 100,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text('Select Semester'),
                        // alignment: Alignment.center,
                        underline: Container(
                          height: 0,
                          color: Colors.transparent,
                        ),
                        value: _selectedSemester,
                        items: DummyData.semester.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedSemester = value!;
                            resultMap = DummyData.result[_selectedSemester];
                          });
                        }),
                  ),
                 const SizedBox(height: 32,),
                  ResultTable(resultMap: resultMap),
                  const SizedBox(height: 16,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Marks Distribution',style: Theme.of(context).textTheme.headline6,),
                  ),
                  const SizedBox(height: 8,),
                  const MarksDistributionTable(),
                  const SizedBox(height: 16,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Grade Equivalent',style: Theme.of(context).textTheme.headline6,),
                  ),
                  const SizedBox(height: 8,),
                  const GradeEquivalentTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}