import 'package:flutter/material.dart';
import 'package:muet_ez/model/repository/student_model.dart';
import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
import '../../model/dummy_data.dart';
import '../../model/networking/firebase_data/academic_data.dart';
import '../../model/repository/academic_model.dart';
import '../widgets/app_drawer.dart';
import '../widgets/grade_equivalent_table.dart';
import '../widgets/marks_distribution_table.dart';


class ResultsScreen extends StatefulWidget {
   const ResultsScreen({Key? key}) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  String? _selectedSemester;


  int getPercentage(String creditHour,int totalMarks){
    if(creditHour=="3"){
      return ((totalMarks/100)*100).toInt();
    }else if(creditHour =="2"){
      return ((totalMarks/50)*100).toInt();
    }else{
      return 0;
    }
  }
  double gpaCalculator(List<Academic> list){
    double qa = 0;
    int totalCreditHour = 0;

    for(int i=0; i<list.length; i++){
      int credit = int.parse(list[i].creditHour!);
      final totalMarks = int.parse(list[i].sessional!) + int.parse(list[i].mids!) + int.parse(list[i].finals!);
      final percentage = getPercentage(list[i].creditHour!, totalMarks);
      if(percentage >= 91){
        qa += (4.0*credit);
        totalCreditHour+= credit;
      }else if(percentage >=83){
        qa += (3.5*credit);
        totalCreditHour+= credit;
      }else if(percentage >=76){
        qa += (3.0*credit);
        totalCreditHour+= credit;
      }else if(percentage >=71){
        qa += (2.5*credit);
        totalCreditHour+= credit;
      }else if(percentage >=66){
        qa += (2.0*credit);
        totalCreditHour+= credit;
      }else if(percentage >=50){
        qa += (1.0*credit);
        totalCreditHour+= credit;
      }else if(percentage< 50){
        qa += (0*credit);
        totalCreditHour+= credit;
      }
    }
    double gpa = qa/totalCreditHour;
    return gpa;
  }
  String gradeCalculator(String batch,String sessional,String mids,String finals,String creditHour){
    if(batch=="19sw"){
      final totalMarks = int.parse(sessional) + int.parse(mids) + int.parse(finals);
      final percentage = getPercentage(creditHour, totalMarks);
      if(percentage >= 91){
        return 'A+';
      }else if(percentage >=83){
        return "A";
      }else if(percentage >=76){
        return "B+";
      }else if(percentage >=71){
        return "B";
      }else if(percentage >=66){
        return "C+";
      }else if(percentage >=50){
        return "C";
      }else if(percentage< 50){
        return "F";
      }
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        elevation: 0,
        foregroundColor: AppColors.black,
      ),
      drawer: const AppDrawer(),
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
                          });
                        }),
                  ),
                 const SizedBox(height: 32,),
                  if(_selectedSemester!=null)
                  FutureBuilder<List<Academic>>(
                    future: AcademicData().getAcademicData(_selectedSemester??""), // your function
                    builder: (BuildContext context, AsyncSnapshot<List<Academic>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child:  CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      else if(snapshot.data!.isNotEmpty) {
                        return Column(
                          children: [
                            Column(
                              children: snapshot.data!.map<Widget>((e) {
                                return  Card(
                                  child: ListTile(
                                    title: Text(e.subject!.replaceAll(" ", '')),
                                    subtitle: Text('Marks Obtained: ${(int.parse(e.sessional!) + int.parse(e.mids!) + int.parse(e.finals!)).toString()}'),
                                    trailing: Text("Grade: ${gradeCalculator(Student.batch!, e.sessional!, e.mids!, e.finals!,e.creditHour!)}"),
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 8,),
                            Text("GPA : ${gpaCalculator(snapshot.data!)}",style: TextStyle(color: AppColors.white,fontSize: getDeviceSize(context).width*0.1),)
                          ],
                        );
                      }
                      else{
                        return const Padding(
                          padding:  EdgeInsets.only(bottom: 32),
                          child: Text("No Data Found",textAlign: TextAlign.center,style: TextStyle(fontSize: 32,color: Colors.red),),
                        );
                      }
                    },
                  ),
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