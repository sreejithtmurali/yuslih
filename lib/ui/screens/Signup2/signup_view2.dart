import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../tools/screen_size.dart';
import 'signup_view2model.dart';

class SignUpView2 extends StatelessWidget {
  late String name;
  late String email;
  late String password;
  Key? key;

  SignUpView2(
      {this.key,
      required this.name,
      required this.email,
      required this.password});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpView2Model>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, model, child) {
      print("calling update");
      //  final arguments = ModalRoute.of(context)!.settings.arguments as SignUpView2Arguments;
      // name = arguments.name;
      //  email=arguments.email;
      //  password=arguments.password;

      // model.updateData(name, email, password);

      return Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffF5F5F5),
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.black12,
              child: BackButton(
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
          ),
          actions: [
            Container(
                height: 50,
                width: 50,
                child: Center(
                    child: Text(
                  "1/3",
                  style: TextStyle(color: Colors.black),
                )))
          ],
        ),
        body: SafeArea(
          top: true,
          bottom: true,
          child: SingleChildScrollView(
            child: Container(
              height: ScreenSize.height,
              width: ScreenSize.width,
              child: Stack(children: [
                Positioned(
                    top: ScreenSize.getHeight(
                        double.parse(800.toString()), 258.0),
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
                                  "Personal Information",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
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
                                  "Let’s know each other better",
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
                  top:
                      ScreenSize.getHeight(double.parse(800.toString()), 330.0),
                  left: 0,
                  right: 0,
                  child: SizedBox(
                      width: ScreenSize.width,
                      height: ScreenSize.getHeight(
                          double.parse(800.toString()), 600.0),
                      child: TitleSection()),
                ),
              ]),
            ),
          ),
        ),
      );
    }, viewModelBuilder: () {
      return SignUpView2Model(name: name, email: email, password: password);
    }
        //     final arguments = ModalRoute.of(context)!.settings.arguments as SignUpView2Arguments;
        //     name = arguments.name;
        //     email=arguments.email;
        //     password=arguments.password;
        //     file=arguments.file;
        // return SignUpView2Model(name: name,email: email,password: password,file: file);}
        );
  }
}

class TitleSection extends ViewModelWidget<SignUpView2Model> {

  @override
  Widget build(BuildContext context, SignUpView2Model viewModel) {
    // TODO: implement build

    // usernameController.text=viewModel.name;

    return Form(
        key: viewModel.signup2Keey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your Name';
                  }
                  return null;
                },
                // initialValue: viewModel.name,
                controller: viewModel.usernameController,

                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  filled: true,
                  fillColor: Color(0xffFFFFFF),

                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //       width: 1, color: Color(0xffE4F8F8)),
                  // ),
                  labelText: 'Name',
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
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
              child: TextFormField(
                showCursor: true,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.length != 10) {
                    return 'Enter a Valid Phone Number';
                  }
                  return null;
                },
                controller: viewModel.phctrler,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  filled: true,
                  fillColor: Color(0xffFFFFFF),
                  labelText: 'Phone',
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
                    child: Text('Next',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffffffff),
                        )),
                    onPressed: () {
                      if (viewModel.signup2Keey.currentState!.validate()) {
                        viewModel.NavNext(viewModel.phctrler.text.toString());
                      }
                      //viewModel.navNext();
                    },
                  )),
            ),
          ],
        ));
  }
}
