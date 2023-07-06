import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yuslih/ui/screens/Signup3/signup_view3.dart';

import '../../../app/app.router.dart';
import '../../../app/utils.dart';

class SignUpView3Model extends BaseViewModel {
  // List<CategoryModel> tempselectedCategories = [];
  // List<CategoryModel> selectedCategories = [];
  TextEditingController amtctrlr = TextEditingController();
   String ?name;
   String ?email;
   String ?password;

  SignUpView3Model({required this.name, required this.email, required this.password,required this.phone});

  late String  phone;
  final formKey4 = GlobalKey<FormState>();

   init() {
     print(name);
     print(email);
     print(password);

     print(phone);

   }
  List<String> dropdownValues=[];
  List<String>dropdownCategoryValues = [];
  initData() {
    dropdownValues = [
      'One year',
      'Two years',
      'Three years',
      'Five years',
      'More than 5',
      'More than 10'];

  dropdownCategoryValues = [
      'Expert Painter',
      'Carpenter',
      'Plumber',
      'Cleaner',
      'Gardener',
      'House Keeping',
      'Helper',
      'Welder',
      'Bike Mechanic',
      'AC Mechanic'];
  }



  String? selectedValue;

  String? selectedCategoryValue;





  // void setSelectedValue(String value) {
  //   selectedValue = value;
  //   notifyListeners();
  //   updateexp(value);
  // }
  void updateexp(String value2) {
    print("update caled");

    selectedValue=value2;
    print('updateexp value:$selectedValue');
    notifyListeners();
  }




  void updatecategory(String value2) {
    print("updatecategory called");

    selectedCategoryValue=value2;
    print('updated updatecategory value:$selectedCategoryValue');

    notifyListeners();
  }


  updateData( String name, String email, String password,String  phone){
    this.name=name;
    this.email=email;
    this.password=password;

    this.phone=phone;
  }








  void navvNext(String selectedValue1, String selectedCategoryValue1){
     print(name);
     print(email);
     print(password);
     print(phone);
     print(selectedCategoryValue1);
     print(selectedValue1);
    navigationService.navigateTo(Routes.signUpView4,arguments: SignUpView4Arguments(
      name: name!,email: email!,password: password!,phone:phone, selectedCategories: selectedCategoryValue1, selectedValue: selectedValue1, amt: amtctrlr.text
    ));
  }

}
// class CategoryModel {
//   String name;
//   bool selected;
//
//   CategoryModel({required this.name, required this.selected});
// }