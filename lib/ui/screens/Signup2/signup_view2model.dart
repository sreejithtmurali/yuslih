import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';
import '../../../app/utils.dart';

class SignUpView2Model extends BaseViewModel {
  //  late formKey1 ;
//late SignUpView3Arguments signUpView3Arguments;

 late String name;
 late  String email;
 late String password;
  SignUpView2Model({required  this.name, required this. email, required this. password});

  TextEditingController usernameController = TextEditingController();
  TextEditingController phctrler = TextEditingController();





//   SignUpView2Model({required String name, required String email, required String password}) {
//     name=name;
//     email=email;
//     password=password;
// print('$name $email $password');
//   }



  //SignUpView2Model(SignUpView2Arguments{required this.name, required this.email, required this.password, required this.file});

  updateData( String name, String email, String password){
    this.name=name;
    this.email=email;
    this.password=password;

    print("calling update$name");
  }
  void NavNext(String phone){
    navigationService.navigateTo(Routes.signUpView3,
        arguments: SignUpView3Arguments(name: name!, email: email, password: password,  phone: phone)
         );
  }
  final signup2Keey = GlobalKey<FormState>();


  init() {
    usernameController.text = name??'';


  }
}
