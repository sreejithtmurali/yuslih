import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:stacked/stacked.dart';

import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import '../../../constants/assets.gen.dart';
import '../../tools/screen_size.dart';
import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
                      FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
                      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent,
                      ));
    return ViewModelBuilder<LoginViewModel>.reactive(
      onViewModelReady: (model){
        model.fetchDataFromFirebase();
      },
      builder: (context, model, child) {

        return Scaffold(

          body:  Listener(
          /* When the user interacts in your app body like click, move etc. */
          onPointerUp: hideStatusBar,
          onPointerMove: hideStatusBar,
          onPointerDown: hideStatusBar,

          child:TitleSection(),)
        );
      },
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}


class TitleSection extends ViewModelWidget<LoginViewModel> {
  TitleSection({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {


    return Form(
        key:viewModel.formKey,
        child: ListView(

          children: <Widget>[
        Container(
          height: ScreenSize.getHeight(
              double.parse(800.toString()), 400.0),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                width: ScreenSize.width,
                height: ScreenSize.getHeight(
                    double.parse(800.toString()), 396.0),
                alignment: Alignment.center,
                child:
                Assets.images.login.image(
                height: ScreenSize.getHeight(
                double.parse(800.toString()), 396.0), width: ScreenSize.width,fit: BoxFit.fill),),
              ),
              Positioned(
                top: ScreenSize.getHeight(
                    double.parse(800.toString()), 366.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text("Broken something ?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                ),
              ),
              Positioned(
                top: ScreenSize.getHeight(
                    double.parse(800.toString()), 396.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text("Login to fix it",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                ),
              ),
            ],

          ),
        ),
           
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24,top: 30),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email';
                  }
                  return null;
                },
                controller:viewModel.usernameController,

                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffFAFAFA),
                  labelText: 'Email',
                  labelStyle:  TextStyle(color: Color(0xffBFBFBF)),
                  floatingLabelStyle:  TextStyle(color: Color(0xffBFBFBF)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color:Color(0xfE4F8F8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color:Color(0xfE4F8F8)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Colors.red),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 16.0, right: 24),
              child: TextFormField(

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
                obscureText: true,
                controller: viewModel.passwordController,
                decoration:  InputDecoration(
                  filled: true,
                  fillColor: Color(0xffFAFAFA),
                  // border: OutlineInputBorder(
                  //     borderSide: BorderSide(
                  //         width: 1, color: Color(0xffE4F8F8)),
                  //   borderRadius: BorderRadius.circular(5.0)
                  //
                  // ),
                  labelText: 'Password',
                  labelStyle:  TextStyle(color: Color(0xffBFBFBF)),
                  floatingLabelStyle:  TextStyle(color: Color(0xffBFBFBF)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color:Color(0xfE4F8F8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color:Color(0xfE4F8F8)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Colors.red),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 24, top: 32.0, right: 24),
              child: Container(
                  height: 50,
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff4FE0B5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child:  Text('Login',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        )),
                    onPressed: () {
                      if(viewModel.formKey.currentState!.validate()) {
                        viewModel.navHomr();
                      }
                    },

                  )),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 24, top: 12.0, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'New member?',
                    style: TextStyle(fontSize: 14, color: Color(0xff8F8F8F)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 12.0, right: 24,bottom: 66),
              child: Container(
                  height: 50,
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                       backgroundColor: Color(0xffE7FBF5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: const Text('Sign up',
                        style: TextStyle(
                          fontSize: 16,
                          color:Color(0xff4FE0B5),
                        )),
                    onPressed: () {

                        viewModel.navSignup();

                    },

                  )),
            ),
          ],
        ));
  }
}
void hideStatusBar(PointerEvent details) {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
}
