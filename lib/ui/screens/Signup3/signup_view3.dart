import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:yuslih/app/app.router.dart';
import '../../tools/screen_size.dart';
import 'custom_dropdown.dart';
import 'signup_view3model.dart';

class SignUpView3 extends StatelessWidget {
   String ?name;
   String ?email;
   String? password;

   String? phone;
   Key?key;
  SignUpView3({this.key,required this.name,required this.email,required this.password,required this.phone});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpView3Model>.reactive(
      builder: (context, model, child) {


        model.updateData(name!, email!, password!, phone!);
        return Scaffold(
          backgroundColor:Color(0xffF5F5F5),
          appBar: AppBar(
            elevation: 0,
            backgroundColor:Color(0xffF5F5F5),
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.black12,
                child: BackButton(
                  color: Colors.grey,
                ),
                onPressed: (){},
              ),
            ),
            actions: [
              Container(
                height: 50,
                  width: 50,
                  child: Center(child: Text("2/3",style: TextStyle(color: Colors.black),)))
            ],

          ),

          body: SafeArea(
            top: true,
            bottom: true,
            child: ListView(
              children: [
                Container(
                  height: ScreenSize.height,
                  width: ScreenSize.width,
                  child: Stack(children: [

                    Positioned(
                        top: ScreenSize.getHeight(double.parse(800.toString()), 258.0),
                        child: SizedBox(
                          width: ScreenSize.getWidth(
                              double.parse(360.toString()), 255.0),
                          height: ScreenSize.getHeight(
                              double.parse(800.toString()), 479.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(left: 24),
                                    child: Text(
                                      "Choose your field(s)",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400

                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(left: 24, top: 6),
                                    child: Text(
                                      "Help us to fix",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                      top: ScreenSize.getHeight(double.parse(800.toString()), 330.0),
                      left: 0,
                      right: 0,
                      child: SizedBox(
                          width: ScreenSize.width,
                          height: ScreenSize.getHeight(double.parse(800.toString()), 600.0),
                          child: TitleSection(name,email,password,phone)),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: (){

        return SignUpView3Model(name: name!,email: email!,password: password!,phone:phone!);

      },
    );
  }
}






class TitleSection extends StatelessWidget {
  String? name;
  String? email;
  String? password;
  String? phone;
  TitleSection(this.name, this.email,this.password, this.phone);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpView3Model>.reactive(

        viewModelBuilder: () => SignUpView3Model(name: name,password: password,email: email,phone:phone!),
        onViewModelReady: (model) => model.initData(),
        builder: (context, model, child) =>

            Form(
        key: model.formKey4,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text("You are qualified for",style: TextStyle(fontWeight: FontWeight.w400),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24,top: 8),
              child:
              Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),

                    border: Border.all(
                        width: 1,
                        color: Color(0xffFCFCFC)
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child:
                    DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        // Add Horizontal padding using menuItemStyleData.padding so it matches
                        // the menu padding when button's width is not specified.
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),

                        // Add more decoration..
                      ),
                      hint: const Text(
                        'select Category',
                        style: TextStyle(fontSize: 14),
                      ),
                      items: model.dropdownCategoryValues
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select select Category';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        model.updatecategory(value.toString());
                      },
                      onSaved: (value) {
                        model.updatecategory(value.toString());
                      },

                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24,top: 16),
              child: Text("How many years of experience you got?",style: TextStyle(fontWeight: FontWeight.w400)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24,top: 8),
              child:
              Container(
                  decoration: BoxDecoration(
                color: const Color(0xffffffff),

                border: Border.all(
                    width: 1,
                    color: Color(0xffFCFCFC)
                ),
                borderRadius: BorderRadius.circular(5),
              ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child:
                    DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        // Add Horizontal padding using menuItemStyleData.padding so it matches
                        // the menu padding when button's width is not specified.
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),

                        // Add more decoration..
                      ),
                      hint: const Text(
                        'select Years of Experience',
                        style: TextStyle(fontSize: 14),
                      ),
                      items: model.dropdownValues
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select Years of Experience.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        model.updateexp(value.toString());
                      },
                      onSaved: (value) {
                        model.updateexp(value.toString());
                      },

                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24,top: 16),
              child: Text("What’s your pricing in an hourly basis ?",style: TextStyle(fontWeight: FontWeight.w400)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Amount  in INR';
                  }
                  return null;
                },
                // initialValue: viewModel.name,
                controller: model.amtctrlr,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.currency_rupee),
                  filled: true,
                  fillColor: Color(0xffFFFFFF),

                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //       width: 1, color: Color(0xffE4F8F8)),
                  // ),
                  labelText: 'Amount',
                  labelStyle: TextStyle(color: Color(0xffBFBFBF)),
                  floatingLabelStyle: TextStyle(color: Color(0xffBFBFBF)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xfE4F8F8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xff3F54D1)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                ),
              ),
            ),




            Padding(
              padding: const EdgeInsets.only(left: 24, top: 57.0, right: 24),
              child: Container(
                  height: 50,
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff3F54D1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child:  Text('Next',
                        style: TextStyle(
                          fontSize: 16,
                          color:Color(0xffffffff),
                        )),
                    onPressed: () {
                      print(model.selectedCategoryValue?.length.toString());

                      if(model.formKey4.currentState!.validate()) {
                        var s=model.selectedValue;
                        var s1=model.selectedCategoryValue;
                          model.navvNext(s!,s1!);

                      }
                    },

                  )),
            ),
          ],
        ))
    );

  }
}



