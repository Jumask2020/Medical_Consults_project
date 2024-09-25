import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/view/widget/my_circular_contanier.dart';
import 'package:medical_consult_project/core/view/widget/my_container.dart';
import 'package:medical_consult_project/core/view/widget/my_elevated_button.dart';
import 'package:medical_consult_project/core/view/widget/my_horizntal_size.dart';
import 'package:medical_consult_project/core/view/widget/my_text_form_field.dart';
import 'package:medical_consult_project/core/view/widget/my_vertical_size.dart';
import 'package:numberpicker/numberpicker.dart';

class AddProfileView extends StatelessWidget {
   AddProfileView({super.key});
  final List<bool> _checkboxValues = List.generate(7, (index) => false);
  final List<String> _days = ['السبت', 'الاحد', 'الإثنين', 'الثلاثاء', 'الاربعاء', 'الخميس', 'الجمعة'];
  // final List<int> _morningFrom = List.filled(7, 0);
  // final List<int> _morningTo = List.filled(7, 0);
  // final List<int> _nightFrom = List.filled(7, 0);
  // final List<int> _nightTo = List.filled(7, 0);
  // final List<String> _hospitals = List.filled(7, '');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),

        body:Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                      MyCircularContanier(height: 200,width: 200,radius:100,color: Colors.green,),
                // Stack(
                //   children: <Widget>[
                //     Container(
                //       width: double.infinity,
                //       height: 200,
                //       margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                //       padding: EdgeInsets.only(top: 10,bottom: 10),
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //           color: AppColor.primaryColor,
                //             //color: Color.fromARGB(255, 51, 204, 255),
                //             width: 1),
                //         borderRadius: BorderRadius.circular(5),
                //         shape: BoxShape.rectangle,
                //       ),
                //       child: SingleChildScrollView(
                //         child: Column(
                //           children: [
                //
                //           ],
                //         ),
                //       ),
                //     ),
                //     Positioned(
                //       right: 50,
                //       top: 12,
                //       child: Container(
                //        // padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                //         color: Colors.white,
                //         child: Text(
                //           'المعلومات الشخصية',
                //           style: TextStyle(color: Colors.black, fontSize: 12),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                MyTextFormField(labelText: "الاسم",),
                MyTextFormField(labelText: "التخصص",),
                MyTextFormField(labelText: "التخصصات الفرعية",),
                MyTextFormField(labelText: "الشهادة الأكاديمية",),
                MyTextFormField(labelText: "الجامعة",),
        MyContainer(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Row(
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text("سنة التخرج")),
              InkWell(child:
              MyContainer(topLeft: 10,topRight: 10,bottomRight: 10,bottomLeft: 10,height: 35,width: 70,color: AppColor.primaryColor,
                child: Center(
                     child:Text("اختر السنة",style: TextStyle(color: Colors.white),) ,),
                 ),
                  onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Select Year"),
                      content: Container( // Need to use container to add size constraint.
                        width: 300,
                        height: 300,
                        child: YearPicker(
                          firstDate: DateTime(DateTime.now().year - 100, 1),
                          lastDate: DateTime(DateTime.now().year + 100, 1),
                          initialDate: DateTime.now(),
                          // save the selected date to _selectedDate DateTime variable.
                          // It's used to set the previous selected date when
                          // re-showing the dialog.
                          selectedDate: null,
                          onChanged: (DateTime dateTime) {
                            // close the dialog when year is selected.
                            Navigator.pop(context);

                            // Do something with the dateTime selected.
                            // Remember that you need to use dateTime.year to get the year
                          },
                        ),
                      ),

                    );
                  },
                );
                         }

              ),
              MyHorizntalSize(width: 20,),
              // VerticalDivider(color: AppColor.primaryColor,width: 10,thickness: 10,indent: 10,endIndent: 10,),
              MyHorizntalSize(width: 20,),
              Expanded(child: Text("سنوات الخبرة")),
              Expanded(
                child: SizedBox(
                  height: 70,
                  child: NumberPicker(
                    decoration: BoxDecoration(shape: BoxShape.rectangle) ,
                    value: 1,
                    minValue: 0,
                    maxValue: 100,
                    //   onChanged: (value) => setState(() => _currentValue = value),
                    // ),
                    onChanged: (value){
                
                    },),
                ),
              ),
            ],
          ),
        ),
                // /MyTextFormField(labelText: "المستشفى",),
                Text("أيام الدوام",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold ),),
                Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                      children: [
                        TableCell(child: Center(child: Text('متواجد',style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold )))),
                        TableCell(child: Center(child: Text('اليوم',style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold )))),
                        TableCell(child: Center(child: Text('الصباح',style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold )))),
                        TableCell(child: Center(child: Text('المساء',style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold )))),
                        TableCell(child: Center(child: Text('المستشفى',style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold )))),
                      ],
                    ),
                    for (int i = 0; i < _days.length; i++) TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Checkbox(
                              value: _checkboxValues[i],
                              onChanged: (value) {
                                // setState(() {
                                //   _checkboxValues[i] = value ?? false;
                                // });
                              },
                            ),
                          ),
                        ),
                        TableCell(child: Center(child: Text(_days[i]))),
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 70,
                                      child: NumberPicker(
                                        decoration: BoxDecoration(shape: BoxShape.rectangle) ,
                                        value: 7,
                                        minValue: 6,
                                        maxValue: 12,
                                        //   onChanged: (value) => setState(() => _currentValue = value),
                                        // ),
                                        onChanged: (value){

                                        },),
                                    ),
                                  ],
                                ),
                              ),
                              Text(':'),
                              Expanded(
                                child: SizedBox(
                                  height: 70,
                                  child: NumberPicker(
                                    decoration: BoxDecoration(shape: BoxShape.rectangle) ,
                                    value: 13,
                                    minValue: 12,
                                    maxValue: 18,
                                    //   onChanged: (value) => setState(() => _currentValue = value),
                                    // ),
                                    onChanged: (value){
                                
                                    },),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 70,
                                  child: NumberPicker(
                                    decoration: BoxDecoration(shape: BoxShape.rectangle) ,
                                    value: 17,
                                    minValue: 16,
                                    maxValue: 24,
                                    //   onChanged: (value) => setState(() => _currentValue = value),
                                    // ),
                                    onChanged: (value){
                                
                                    },),
                                ),
                              ),
                              Text(':'),
                              Expanded(
                                child: SizedBox(
                                  height: 70,
                                  child: NumberPicker(
                                    decoration: BoxDecoration(shape: BoxShape.rectangle) ,
                                    value: 23,
                                    minValue: 22,
                                    maxValue: 24,
                                    //   onChanged: (value) => setState(() => _currentValue = value),
                                    // ),
                                    onChanged: (value){
                                
                                    },),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: '.........'),
                              onChanged: (value){},
                              // onChanged: (value) {
                              //   setState(() {
                              //     _hospitals[i] = value;
                              //   });
                              // },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            Text("الحسابات المصرفية"),
            Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(value: false, onChanged: (v){}),
                Text("العمقي"),
                Checkbox(value: false, onChanged: (v){}),
                Text("الكريمي"),
                Checkbox(value: false, onChanged: (v){}),
                Text("بن دول"),
                // Checkbox(value: false, onChanged: (v){}),
                // TextFormField(decoration: InputDecoration(labelText: "أخرى"),),
              ],
            ),
                Text("اللغات التي تجيدها"),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(value: false, onChanged: (v){}),
                    Text("العربية"),
                    Checkbox(value: false, onChanged: (v){}),
                    Text("الانجليزية"),
                    Checkbox(value: false, onChanged: (v){}),
                    Text("أخرى"),
                    // Checkbox(value: false, onChanged: (v){}),
                    // TextFormField(decoration: InputDecoration(labelText: "أخرى"),),
                  ],
                ),


              MyElvatedButton(label: 'حفظ', onPressed: (){})
              ],
            ),
          ),
        ) ,
      ),
    );
  }
}
